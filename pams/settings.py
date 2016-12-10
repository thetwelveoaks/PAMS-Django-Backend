"""
Django settings for pams project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Celery Beat Scheduler setting
from celery.schedules import crontab
CELERYBEAT_SCHEDULE = {
    # Executes every morning at 9:00 A.M
    'remind-every-morning': {
        'task': 'send-reminder',
        'schedule': crontab(hour=9, minute=0),
    },
}

# user model for authentication
AUTH_USER_MODEL = "pams_web.MyUser"
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

# site admin email address for delivering server exception messages when debug is turned off
ADMINS = (
    ('Chen Zhe', 'chenzhe.943@gmail.com'),
)
# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '1ipolkb!t67o*p$hg@z6bb#0ol+(rp_j+c(pc!zm!zeo3+xu-d'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False
TEMPLATE_DEBUG = DEBUG

ALLOWED_HOSTS = ['*']  # all hosts are allowed to access the site


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'pams_web',
    'pams',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)
SESSION_SERIALIZER = 'django.contrib.sessions.serializers.JSONSerializer'

ROOT_URLCONF = 'pams.urls'

WSGI_APPLICATION = 'pams.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'pamsdb',
        'USER': 'pams',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'Asia/Singapore'
CELERY_TIMEZONE = TIME_ZONE

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'

# Email settings
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER = 'clangkts@gmail.com'
EMAIL_HOST_PASSWORD = 'Dr0wssap'
EMAIL_PORT = 587
EMAIL_USE_TLS = True

PROJECT_NAME = "Nanyang A Plus Hospital - Patient Management System"
PROJECT_PATH = os.path.dirname(os.path.abspath(__file__))

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/var/www/example.com/static/"
#STATIC_ROOT = os.path.join(PROJECT_PATH, os.pardir, 'static')
STATIC_ROOT = os.path.join(PROJECT_PATH, os.pardir, 'production', 'static')

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.abspath(os.path.join(PROJECT_PATH, os.pardir, 'static')),
)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

TEMPLATE_DIRS = (
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    os.path.abspath(os.path.join(PROJECT_PATH, os.pardir, 'templates')),
)

TEMPLATE_CONTEXT_PROCESSORS = (
    'django.contrib.auth.context_processors.auth',
    'django.core.context_processors.debug',
    'django.core.context_processors.i18n',
    'django.core.context_processors.media',
    'django.core.context_processors.static',
    'django.core.context_processors.tz',
    'django.core.context_processors.request',
    'django.contrib.messages.context_processors.messages',

    # Custom context processor for this project
)
