from django.db import models
from pams import notification
from django.conf import settings
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# defining all classes (Object Oriented Programming) to be used in the PAMS system (called models in Django)
# each class defined here is a table in database and all its attributes is columns in the table

class MyUserManager(BaseUserManager):
    """this is for managing customized user models in Django that
    overrides the built-in version
    """
    def create_user(self, username, password, name, user_type="patient"):
        """
        create normal users (patients and doctors) for the system
        :param username: user's login name of String type
        :param password: user's password of String type
        :param name: user's real name of String type
        :param user_type: user's type of String type
        :return: created MyUser object
        """
        user = self.model(username=username, name=name)

        # default values for is_doctor attribute is False, change to True only for doctors
        if user_type == "doctor":
            user.is_doctor = True

        # built-in password setter that hashes password using pbkdf2 algorithm for maximum protection
        user.set_password(password)

        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, name):
        """
        create super users (administrators) for the system
        :param username: user's login name of String type
        :param password: user's password of String type
        :param name: user's real name of String type
        :return: created MyUser object
        """
        user = self.create_user(username=username, password=password, name=name)
        # is_admin attribute for super users should be True
        user.is_admin = True
        user.save(using=self._db)
        return user

class MyUser(AbstractBaseUser):
    """self-defined user class for PAMS
    override built-in user class
    """
    # password field is inherited from AbstractBaseUser
    username    = models.CharField(max_length=50, unique=True)
    name        = models.CharField(max_length=100)
    is_admin    = models.BooleanField(default=False)
    is_doctor   = models.BooleanField(default=False)

    # define manager of this class
    objects = MyUserManager()

    #define some fields
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['password', 'name']

    # some methods required by Django, not used by PAMS system
    def get_full_name(self):
        return self.name

    def get_short_name(self):
        return self.name

    def has_module_perms(self, app_label):
        return True

    def has_perm(self, app_label):
        return True

    # define admin attribute so that Django recognize administrators defined by the system
    def check_staff(self):
        return self.is_admin

    is_staff     = property(check_staff)

class Patient(models.Model):
    """
    additional attributes for patients
    the inheritance relationship is replaced by one-to-one foreign key
    """
    user = models.OneToOneField(settings.AUTH_USER_MODEL)
    notification = models.ForeignKey("Notifiable", related_name="notification", blank=True, null=True)

    def notify(self, subject, message):
        """
        send notification to patient through its preferred method
        :param subject: subject of the notification of String type
        :param message: real message to be conveyed to the patient
        """

        self.notification.send(subject, message, self)

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return "Patient "+self.user.username

class Doctor(models.Model):
    """
    additional attributes for doctors
    the inheritance relationship is replaced by one-to-one foreign key
    """
    user = models.OneToOneField(settings.AUTH_USER_MODEL)
    clinic = models.ForeignKey("Clinic")

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        return {
            "id": self.id,
            "name": self.user.name,
            "clinic": self.clinic.to_dict(),
            "username": self.user.username
        }

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return "Doctor "+self.user.name

class Clinic(models.Model):
    """clinic class that stores all information related to an clinic
    """
    name    = models.CharField(max_length=30)
    website = models.CharField(max_length=30)

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        return {
            "id": self.id,
            "name": self.name,
            "website": self.website
        }

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return self.name

class Appointment(models.Model):
    """appointment class that stores all information related to an appointment
    """
    patient = models.ForeignKey("Patient")
    doctor  = models.ForeignKey("Doctor")
    date    = models.DateField()
    record  = models.ForeignKey("Record", null=True, blank=True)
    treatmentType = models.ForeignKey("Treatment")
    referrer = models.ForeignKey("Doctor", null=True, blank=True, related_name="referrer")
    timeSlot = models.ForeignKey("TimeSlot")

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        dict = {
            "id": self.id,
            "doctor": self.doctor.to_dict(),
            "date": self.date.strftime("%Y-%m-%d"),  # format date to standard formatted string
            "treatmentType": self.treatmentType.to_dict(),
            "timeSlot": self.timeSlot_id
        }

        if self.record is not None:
            dict["record"] = self.record.to_dict()
        if self.referrer is not None:
            dict["referrer"] = self.referrer.to_dict()
        return dict

class Notifiable(models.Model):
    """abstract class that stores the contact number and the notification method
    """
    contact = models.CharField(max_length=100)
    method  = models.ForeignKey("NotificationMethod")

    def send(self, subject, message, patient):
        """
        using static factory - getattr to instantiate class using its name string
        :param subject: subject of message
        :param message: content of message
        :param patient: Patient object
        :return: no return
        """
        method = getattr(notification, self.method.name)()
        method.send(subject, message, self.contact, patient)

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return self.method.name + " to " + self.contact

class NotificationMethod(models.Model):
    """store all notification methods defined by its name
    """
    name = models.CharField(max_length=50)

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return self.name

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        return {
            "id": self.id,
            "name": self.name
        }


class Record(models.Model):
    """Record class to store the medication record from doctor
    """
    age    = models.IntegerField(max_length=3)
    height = models.IntegerField(max_length=6)
    weight = models.IntegerField(max_length=6)
    medication = models.TextField(max_length=1000)

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        return {
            "age": self.age,
            "height": self.height,
            "weight": self.weight,
            "medication": self.medication
        }

class Treatment(models.Model):
    name = models.CharField(max_length=50)
    message = models.TextField(max_length=200)
    prerequisiteId = models.ForeignKey("Treatment", null=True, blank=True)
    duration = models.IntegerField()

    # display prerequisite treatment's name when necessary
    def prerequisite_name(self):
        prerequisite_str = ""
        if self.prerequisiteId is not None:
            prerequisite_str = " (Requires " + self.prerequisiteId.name + ")"
        return prerequisite_str

    def to_dict(self):
        """serialize itself to be sent to Android App using JSON
        :return: dictionary containing all required attributes by the App
        """
        return {"id": self.id,
                "name": self.name + self.prerequisite_name(),
                "message": self.message}

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return self.name + self.prerequisite_name()

class TimeSlot(models.Model):
    """time slots are stored in the database to prevent duplication
    each time slot is half an hour window from 9:00 to 17:00
    """
    range = models.CharField(max_length=30)

    def __unicode__(self):
        """for display purposes in Django admin site
        """
        return self.range