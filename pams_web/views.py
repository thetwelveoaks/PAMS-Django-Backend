from django.shortcuts import render, redirect
from django.http import HttpResponse
import json
from django.views.decorators.csrf import csrf_exempt
from pams_web import forms
import sys
from django.contrib.auth import login, logout
from django.contrib.auth.decorators import login_required, user_passes_test
from pams.managers import *
from datetime import datetime

"""
all interface rendering and some message processing
call up managers when necessary
"""


# ---------------Mobile App Handling--------------------------
def serialize_list(object_list):
    """
    serialize a list of objects defined in PAMS to JSON object
    :param object_list: a iterable list of objects
    :return: a iterable list of dictionaries containing all information in the object
    """
    serialized_list = []
    for each_object in object_list:
        # serialize all objects
        serialized_list.append(each_object.to_dict())
    return json.dumps(serialized_list)


@csrf_exempt
def mobile_user_interface(request, func_name):
    """
    all user related functions in the Android app are handled here
    to simplify execution, CSRF identity token during POST is exempted
    :param request: HTTP request (automatic)
    :param func_name: name of the function to be invoked
    :return: response with JSON string
    """

    if request.method == "POST":
        # app POST information to server and expect response after server processed the information
        # load parameters passed in as JSON to dictionary object
        params = json.loads(request.body)

        if func_name == "login":
            # patients are logging in
            username = params['username']
            password = params['password']

            user = UserManager.login(username=username, password=password)

            if user is None or user.is_doctor or user.is_admin:
                # user is not a patient / not registered, reject the attempt to login through Android app
                return HttpResponse(json.dumps({"error": 1}))
            else:
                # find corresponding patient and return patient's information
                patient = Patient.objects.get(user=user)
                return HttpResponse(json.dumps({"user": patient.id, "username": user.username, "name": user.name, "error": 0}))

        elif func_name == "register":
            # register as a patient
            form = forms.PatientRegistrationForm(params)  # initialize PatientRegistrationForm with submitted data for form validation

            return HttpResponse(json.dumps(UserManager.register(form)))
    else:
        # app GET information only
        if func_name == "contact_method":
            # return all allowed contact method for anonymous user to choose from during registration
            methods = NotificationMethod.objects.all()

            return HttpResponse(serialize_list(methods))

    # undefined operation detected
    return HttpResponse(json.dumps({"error": "Incorrect operation or parameter"}))

@csrf_exempt
def mobile_appointment_interface(request, func_name):
    """
    all appointment related functions in the Android app are handled here
    to simplify execution, CSRF identity token during POST is exempted
    :param request: HTTP request (automatic)
    :param func_name: name of the function to be invoked
    :return: response with JSON string
    """
    if request.method == "POST":
        # app POST information to server and expect response after server processed the information
        # load parameters passed in as JSON to dictionary object
        params = json.loads(request.body)

        if func_name == 'read_ongoing':
            # return all ongoing appointments for a patrticular patient
            # ongoing implies that the appointment hasn't been attended (no record)
            # display the nearest appointment first
            appointments = Appointment.objects.filter(record=None, patient=int(params["patient"]), date__gte=datetime.now()).order_by("date", "timeSlot")

            return HttpResponse(serialize_list(appointments))

        elif func_name == 'read_history':
            # return all history appointments for a particular patient
            # history implies that the appointment has been attended (have record)
            appointments = AppointmentManager.read_patient_history(patient=int(params["patient"]))

            return HttpResponse(serialize_list(appointments))

        elif func_name == 'create':
            # create a new appointment
            form = forms.AppointmentForm(params)
            return HttpResponse(json.dumps(AppointmentManager.create_appointment(form)))

        elif func_name == 'match_doctor':
            # match a doctor for the appointment
            date = params["date"]
            clinic = int(params["clinic"])
            timeslot = int(params["timeslot"])

            # try if the appointment id is posted (updating an appointment
            appointment_id = None
            if "id" in params:
                appointment_id = params["id"]

            # try to match a doctor, and see what happens
            doctor = AppointmentManager.match_doctor(date, clinic, timeslot, appointment_id)
            if doctor is None:
                # not doctors available at that time, prompt patient to choose another time
                return HttpResponse(json.dumps({'error': 1}))
            else:
                return HttpResponse(json.dumps(doctor.to_dict()))

        elif func_name == 'update':
            # update an existing appointment
            try:
                # need to submit both appointment id and patient id for double validation
                appointment = Appointment.objects.get(patient=int(params["patient"]), id=int(params["id"]))
            except:
                # if anything goes wrong, it means the appointment to be updated doesn't exist
                return HttpResponse(json.dumps({'error': "Appointment Does Not Exist!"}))

            # bind submitted data to AppointmentForm and let AppointmentManager handle it
            form = forms.AppointmentForm(params)

            return HttpResponse(json.dumps(AppointmentManager.update_appointment(form, appointment)))

        elif func_name == 'delete':
            # delete an existing appointment, need to submit both appointment id and patient id for double validation
            # there will be no exceptions if the appointment to be deleted doesn't exist
            Appointment.objects.filter(patient=int(params['patient']), id=int(params['id'])).delete()

            return HttpResponse(json.dumps({"error": 0}))
    else:
        # app GET information only
        if func_name == 'treatment':
            # get all defined treatment types when patient is creating a new appointment
            treatments = Treatment.objects.all()

            return HttpResponse(serialize_list(treatments))

        elif func_name == 'clinic':
            # get all defined clinics when patient is creating a new appointment
            clinics = Clinic.objects.all()

            return HttpResponse(serialize_list(clinics))

    # undefined operation detected
    return HttpResponse(json.dumps({"error": "Incorrect operation or parameter"}))

# ---------------Mobile App Handling Ends--------------------------


# ---------------Web Site Handling--------------------------
# for doctor or admin only

def web_interface(request):
    if request.user.is_authenticated():
        # user has logged in, redirect to respective homepage
        if request.user.is_admin:
            return redirect("/web/admin/")

        elif request.user.is_doctor:
            return redirect("/web/doctor/home/")

    # not logged in, ask for sign in
    return render(request, 'login.html')

def web_login(request):
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']

        user = UserManager.login(username=username, password=password)

        if user is None:
            # user not registered
            return render(request, 'login.html', {'error': "Your Username or Password is incorrect!"})

        elif user.is_admin:
            # redirect to admin interface
            login(request, user)
            return redirect("/web/admin/")

        elif user.is_doctor:
            # find the corresponding doctor id and redirect to doctor interfeace
            doctor_id = Doctor.objects.get(user=user).id
            request.session["doctor_id"] = doctor_id
            login(request, user)
            return redirect("/web/doctor/home/")
        else:
            # patient attempts login through this portal, ask them to use mobile app!
            return render(request, 'login.html', {'error': 'You are Patient!<br>Please use our mobile app to access the system'})

    # something's wrong and no information is submitted
    return render(request, 'login.html', {'error': "Please login again!"})

@login_required
def web_logout(request):
    # logout an doctor / admin and redirect to login page
    logout(request)
    return redirect("/")


@login_required()
@user_passes_test(lambda u: u.is_doctor)
def doctor_appointment(request):
    # get all appointments on the date for the doctor
    appointments = Appointment.objects.filter(doctor=request.session["doctor_id"], record=None, date=datetime.now()).order_by("timeSlot")

    return render(request, 'current.appointment.html', {'appointments': appointments})

@login_required()
@user_passes_test(lambda u: u.is_doctor)
def doctor_patients(request):
    # get all patients that has made appointments with the doctor
    patients = Patient.objects.filter(id__in=Appointment.objects.filter(doctor=request.session["doctor_id"]).values_list("patient"))

    return render(request, 'patient.list.html', {'patients': patients})

@login_required()
@user_passes_test(lambda u: u.is_doctor)
def doctor_record(request, appointment_id):
    # handles record commitment for doctor

    # the appointment to add record to
    selected_appointment = Appointment.objects.get(id=int(appointment_id))

    if request.method == 'POST':
        # doctor is submitting the record form
        form = forms.AppointmentRecordFrom(request.POST)  # Bind record form with posted information

        if form.is_valid():
            # form is validated
            # Insert new record
            record = Record(age=form.cleaned_data['age'], height=form.cleaned_data['height'],
                            weight=form.cleaned_data['weight'], medication=form.cleaned_data['medication'])
            record.save()

            # link the saved record to the appointment
            selected_appointment.record = record
            selected_appointment.save()

            # record complete, go back to appointment list
            return redirect('/web/doctor/home/')

    else:
            # Display new form for user to fill in
            form = forms.AppointmentRecordFrom()

    # if invalid form, render the original page prefilled with submitted data, and display form error in the html logic
    # otherwise display normal page
    return render(request, 'commit_record.html', {'form': form, 'appointment': selected_appointment})


@login_required()
@user_passes_test(lambda u: u.is_doctor)
def doctor_history_record(request, patient_id):
    # get all history appointment of a particular patient
    patient = Patient.objects.get(id=int(patient_id))
    appointments = AppointmentManager.read_patient_history(patient=patient)
    return render(request, 'patient.history.html', {'patient': patient, 'appointments': appointments})


@login_required()
@user_passes_test(lambda u: u.is_doctor)
def doctor_referral(request, patient_id):
    # handles referal appointment for patient from a doctor

    # get the patient to refer
    selected_patient = Patient.objects.get(id=int(patient_id))

    if request.method == 'POST':
        # doctor is submitting the record form
        web_post = request.POST.dict()  # convert to dictionary first

        # patient id and referrer doctor id (the doctor that logged in currently) is not submitted from web browser
        # add them into the dictionary from here
        web_post['patient'] = patient_id
        web_post['referrer'] = request.session["doctor_id"]

        form = forms.AppointmentForm(web_post)  # Bind AppointmentForm with the data

        reply = AppointmentManager.create_appointment(form)  # see if the appointment creation is successful

        if not reply["error"]:
            # creation successful, redirect to home
            return redirect("/web/doctor/home/")

        # unsuccessful creation, display error from replied vector
        # form error is replied through the vector as well, so it's not used in this instance
        return render(request, 'referral_appointment.html', {'form': form, 'patient': selected_patient, "error": reply["error"]})
    else:
            # Display new form for user to fill in
            form = forms.AppointmentForm()

    # display the new referral form page
    return render(request, 'referral_appointment.html', {'form': form, 'patient': selected_patient})

# ---------------Web Site Handling Ends--------------------------