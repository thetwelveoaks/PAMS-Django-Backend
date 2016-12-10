__author__ = 'Chen Zhe'
from django.core.mail import send_mail
from django.conf import settings
from django.template.loader import render_to_string
import abc

# all notification methods implementations

class NotificationMethod(object):

    """interface for implementing notification methods."""

    __metaclass__ = abc.ABCMeta

    @abc.abstractmethod
    def send(self, subject, message, contact, patient):
        """send message through corresponding method"""
        pass

class Email(NotificationMethod):
    """
    encapsulation of Email notification implementation
    """
    def send(self, subject, message, contact, patient):
        """
        send email
        :param subject: message subject
        :param message: message content
        :param contact: email address to send email to
        :param patient: Patient object
        """

        # compose email through defined email template
        content = render_to_string('reminder.email', {'name': patient.user.name, 'message': message, 'sender': settings.PROJECT_NAME})
        # Django's built-in email sending system
        send_mail(subject, content, settings.PROJECT_NAME + ' <' + settings.EMAIL_HOST_USER + '>', [contact])


class SMS(NotificationMethod):
    """
    encapsulation of SMS notification implementation
    """
    def send(self, subject, message, contact, patient):
        """
        place holder, not implemented yet
        :param subject: message subject
        :param message: message content
        :param contact: phone number to send SMS to
        :param patient: Patient object
        """
        pass