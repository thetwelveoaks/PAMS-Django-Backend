from __future__ import absolute_import
import os
from celery import Celery
from datetime import datetime, timedelta

# Celery Scheduler initialization

# set the default Django settings module for the 'celery' program.
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pams.settings')

# import models only when environment variables are set
from pams_web.models import *
app = Celery('pams')

# Using a string here means the worker will not have to
# pickle the object when using Windows.
app.config_from_object('django.conf:settings')

# task for send reminders
@app.task(bind=True, name='send-reminder')
def send_reminder(self):
    # all appointments for the next day
    current_appointments = Appointment.objects.filter(date=datetime.now()+timedelta(days=1))

    for appointment in current_appointments:
        # notify patient in each appointment of the upcoming treatment information
        appointment.patient.notify("Reminder of Appointment", appointment.treatmentType.message)