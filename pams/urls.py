from django.conf.urls import patterns, include, url
from django.views.generic.base import RedirectView
from pams_web.views import *

from django.contrib import admin
admin.autodiscover()

# URL Dispatcher for the entire PAMS system
# invoke corresponding function for each URL pattern
urlpatterns = patterns(
    '',
    url(r'^$', web_interface),
    url(r'^favicon\.ico$', RedirectView.as_view(url='/static/favicon.ico')),

    url(r'^user/(?P<func_name>\w+)/$', mobile_user_interface),
    url(r'^appointment/(?P<func_name>\w+)/$', mobile_appointment_interface),

    url(r'^web/login/$', web_login),
    url(r'^accounts/login/$', web_login),
    url(r'^web/logout/$', web_logout),
    url(r'^web/doctor/home/$', doctor_appointment),
    url(r'^web/doctor/patient/$', doctor_patients),
    url(r'^web/doctor/referral/(?P<patient_id>\d+)/$', doctor_referral),
    url(r'^web/doctor/patient/(?P<patient_id>\d+)/$', doctor_history_record),
    url(r'^web/doctor/record/(?P<appointment_id>\d+)/$', doctor_record),
    # Static files
    url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.STATIC_ROOT}),

    url(r'^web/admin/logout/$', web_logout),  # override default admin logout to redirect back to main login interface
    url(r'^web/admin/', include(admin.site.urls)),
)
