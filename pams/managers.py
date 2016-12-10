__author__ = 'Chen Zhe'

from pams_web.models import *
import random

# all manager (control) classes and its control methods

class AppointmentManager(object):
    """
    Appointment Manager manages operation regarding to appointments
    as only one manager need to exist, all methods are declared static
    """

    @staticmethod
    def create_appointment(form):
        """
        create a new appointment
        :param form: AppointmentForm object declared in forms.py
        :return: dictionary with 'error' entry describing any errors in the submitted information
        """
        if form.is_valid():  # built-in basic form validation
            treatment=Treatment.objects.get(id=form.cleaned_data["treatmentType"].id)
            appointment_date=form.cleaned_data["date"]

            # test the whether prerequisite is satisfied
            if treatment.prerequisiteId is not None:
                try:
                    # the patient's last treated pre-requisite treatment
                    pre_appointment = Appointment.objects.filter(patient=form.cleaned_data['patient'], treatmentType=treatment.prerequisiteId).exclude(record=None).order_by("-date")[0]
                    days_diff = (appointment_date - pre_appointment.date).days

                    if days_diff > 180:  # more than 180 days since the last treatment, reject
                        return {'error': "You have to redo the prerequisite treatment as it's been more than 180 days"}
                    elif pre_appointment.treatmentType.duration >= days_diff:  # not enough spacing between the 2 treatments, reject
                        return {'error': "You need to wait for "+ str(pre_appointment.treatmentType.duration - days_diff +1) +" day(s) before making a subsequent appointment"}
                except:
                    # if anything goes wrong, it means patient haven't had any pre-treatment, reject
                    return {'error': "Prerequisite is not satisfied"}

            # validate that there's no other appointment for doctor or patient at the same time
            appointment_pool = Appointment.objects.all()

            if not AppointmentManager.validate_patient(form, appointment_pool):
                return {"error": "The patient have already made an appointment at that time!"}

            if not AppointmentManager.validate_doctor(form, appointment_pool):
                return {"error": "This doctor is busy during that period!"}

            # all validated, create and save appointment
            new_app = Appointment(patient=form.cleaned_data["patient"], doctor=form.cleaned_data['doctor'], date=appointment_date,
                                  treatmentType=form.cleaned_data["treatmentType"], timeSlot=form.cleaned_data["timeslot"],
                                  referrer=form.cleaned_data["referrer"])
            new_app.save()
            return {'error': 0}
        else:
            # basic form validation error messages
            return {'error': form.errors}

    @staticmethod
    def update_appointment(form, appointment):
        """
        update existing appointment
        :param form: AppointmentForm object declared in forms.py
        :param appointment: the Appointment object to be updated
        :return: dictionary with 'error' entry describing any errors in the submitted information
        """

        if form.is_valid():  # built-in basic form validation

            # validate that there's no other appointment for doctor or patient at the same time
            # exclude the appointment to be updated
            appointment_pool = Appointment.objects.exclude(id=appointment.id)

            if not AppointmentManager.validate_patient(form, appointment_pool):
                return {"error": "The patient have already made an appointment at that time!"}

            if not AppointmentManager.validate_doctor(form, appointment_pool):
                return {"error": "This doctor is busy during that period!"}

            # validated, update and save appointment
            appointment.date = form.cleaned_data['date']
            appointment.doctor = form.cleaned_data['doctor']
            appointment.timeSlot = form.cleaned_data['timeslot']
            appointment.treatmentType = form.cleaned_data['treatmentType']

            appointment.save()
            return {'error': 0}
        else:
            # basic form validation error messages
            return {'error': form.errors}

    @staticmethod
    def match_doctor(date, clinic, timeslot, appointment_id=None):
        """
        match an available doctor for the appointment
        prioritise the allocated doctor for the appointment when updating an appointment
        :param date: Date object
        :param clinic: Clinic Object
        :param timeslot: Timeslot object
        :param appointment_id: id of the appointment (used when updating)
        :return:
        """
        # find all available doctors
        aval_doctors = Doctor.objects.filter(clinic=clinic).exclude(id__in=Appointment.objects.filter(timeSlot=timeslot, date=date).values_list('doctor_id'))

        if aval_doctors.count() == 0:
            # no doctor is available
            response = None
        else:
            if appointment_id:
                # update appointment, prioritise the previously allocated doctor
                original_doctor = Appointment.objects.get(id=appointment_id).doctor
                if aval_doctors.filter(id=original_doctor.id).count():
                    # that doctor is free during the selected time slot
                    return original_doctor

            # randomly assign one doctor
            assigned_doctor = random.choice(aval_doctors)
            response = assigned_doctor

        return response

    @staticmethod
    def validate_patient(form, appointment_pool):
        """
        validate patient is free during selected time period
        :param form: AppointmentForm object
        :param appointment_pool: the appointment list to be checked through
        :return: True if there's no clash, False otherwise
        """
        patient = form.cleaned_data["patient"]
        timeSlot = form.cleaned_data["timeslot"]
        date = form.cleaned_data["date"]

        time_clash = appointment_pool.filter(timeSlot=timeSlot, patient=patient, date=date).count()
        if time_clash:
            return False
        return True

    @staticmethod
    def validate_doctor(form, appointment_pool):
        """
        validate doctor is free during selected time period
        :param form: AppointmentForm object
        :param appointment_pool: the appointment list to be checked through
        :return: True if there's no clash, False otherwise
        """
        doctor = form.cleaned_data["doctor"]
        timeSlot = form.cleaned_data["timeslot"]
        date = form.cleaned_data["date"]

        time_clash = appointment_pool.filter(timeSlot=timeSlot, doctor=doctor, date=date).count()
        if time_clash:
            return False
        return True

    @staticmethod
    def read_patient_history(patient):
        """
        return all history appointments of a patient
        in the order of the most recent record first
        :param patient: Patient object or patient id
        :return: list of Appointment objects
        """
        return Appointment.objects.filter(patient=patient).exclude(record=None).order_by("-date", "-timeSlot")


from django.contrib.auth import authenticate


class UserManager(object):

        @staticmethod
        def login(username, password):
            """
            authenticate user using built-in authentication system
            :param username: username
            :param password: password
            :return: MyUser object if authenticated, None object otherwise
            """
            return authenticate(username=username, password=password)

        @staticmethod
        def register(form):
            """
            register new patient
            :param form: PatientRegistrationForm
            :return: error message if there's anything wrong
            """
            if form.is_valid():
                # Process account registration
                username=form.cleaned_data['username']
                password=form.cleaned_data['password']
                name=form.cleaned_data['name']

                # create MyUser object, create account like this to allow automatic pdkdf2 password encryption
                user = MyUser.objects.create_user(username=username, password=password, name=name)
                user.save()

                # save the notification details as well
                new_noti = Notifiable(contact=form.cleaned_data['contact'], method=form.cleaned_data['contact_method'])
                new_noti.save()

                # create Patient object and link it to Notifiable and MyUser
                patient = Patient(user=user, notification=new_noti)
                patient.save()

                return {"error": 0}
            else:
                return {"error": 1, "error_msg": form.errors}
