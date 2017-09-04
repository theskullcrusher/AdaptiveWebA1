"""
WSGI config for assignment1 project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/1.8/howto/deployment/wsgi/
"""

import os, sys

sys.path.append("/home/ubuntu/venv/lib/python2.7/site-packages")
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "<my_project_name>.settings")

from django.core.wsgi import get_wsgi_application

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "assignment1.settings")

application = get_wsgi_application()
