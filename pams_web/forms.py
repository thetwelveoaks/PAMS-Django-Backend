__author__ = 'Chen Zhe'

from pams_web.models import *
from django import forms
from django.forms.widgets import PasswordInput
from django.core.validators import RegexValidator, MinLengthValidator
from django.core.exceptions import ValidationError

# all forms used in the PAMS system
# all objects are submitted by its id and will be translated back to the corresponding object by the form
# all form fields are required unless stated otherwise

class PatientRegistrationForm(forms.Form):
    """
    patient registration form for automatic validation
    """
    methods = NotificationMethod.objects.all()

    # username is 5 to 50 chars
    username = forms.CharField(max_length=50,
                               validators=[MinLengthValidator(5)])
    # real name is 100 chars max
    name     = forms.CharField(max_length=100)

    # password is at least 6 characters
    password = forms.CharField(
        widget=PasswordInput,
        validators=[MinLengthValidator(6)]
    )

    # contact address is 100 chars max
    contact = forms.CharField(max_length=100)

    # contact method need to be one of the defined notification methods
    contact_method = forms.ModelChoiceField(queryset=methods)

    def clean_username(self):
        # Check for existing user with same username
        username = self.cleaned_data['username']

        if MyUser.objects.filter(username=username).exists():
            raise ValidationError("Ah-oh! Someone has taken that username!")

        return username


class AppointmentForm(forms.Form):
    doctors = Doctor.objects.all()
    treatments = Treatment.objects.all()
    timeslots = TimeSlot.objects.all()
    patients = Patient.objects.all()

    date = forms.DateField()  # date submitted is a valid date expression such as yyyy-mm-dd
    timeslot = forms.ModelChoiceField(queryset=timeslots)  # time slot is in database
    treatmentType = forms.ModelChoiceField(queryset=treatments)  # treatment is in database
    referrer = forms.ModelChoiceField(queryset=doctors, required=False)  # referrer is a doctor, and it's optional (only need for referral appointments_
    doctor = forms.ModelChoiceField(queryset=doctors)  # doctor is in database
    patient = forms.ModelChoiceField(queryset=patients)  # patient is in database

    def clean_date(self):
        date = self.cleaned_data['date']
        from datetime import datetime
        if (date - datetime.now().date()).days > 365:
            raise ValidationError("You can't choose this date! Please select a nearer date")
        return date


class AppointmentRecordFrom(forms.Form):
    age = forms.IntegerField(min_value=1)  # age is at least 1
    height = forms.IntegerField(min_value=50)  # height is at least 50
    weight = forms.IntegerField(min_value=20)  # weight is at least 20
    medication= forms.CharField(max_length=1000)  # medication is 1000 character max