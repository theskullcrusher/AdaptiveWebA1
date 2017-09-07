from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from datetime import datetime
from django.contrib.auth.signals import user_logged_in, user_logged_out, user_login_failed
from django.dispatch import receiver


class SiteUser(User):
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

class UserLogs(models.Model):
    user = models.ForeignKey('SiteUser')
    action = models.CharField(max_length=256)
    link = models.TextField()
    main_link = models.TextField(blank=True, default=None, null=True)
    obj = models.TextField()
    timestamp = models.DateTimeField(default=datetime.now())
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)


##This is from their documentation and a link I found:
#https://stackoverflow.com/questions/37618473/how-can-i-log-both-successful-and-failed-login-and-logout-attempts-in-django

class LoginLogs(models.Model):
    action = models.CharField(max_length=64)
    ip = models.GenericIPAddressField(null=True)
    username =  models.CharField(max_length=256, null=True)
    timestamp = models.DateTimeField(auto_now_add=True)

@receiver(user_logged_in)
def user_logged_in_callback(sender, request, user, **kwargs):
    ip = request.META.get('REMOTE_ADDR')
    LoginLogs.objects.create(action='user_logged_in', ip=ip, username=user.username)


@receiver(user_logged_out)
def user_logged_out_callback(sender, request, user, **kwargs):
    ip = request.META.get('REMOTE_ADDR')
    LoginLogs.objects.create(action='user_logged_out', ip=ip, username=user.username)


@receiver(user_login_failed)
def user_login_failed_callback(sender, credentials, **kwargs):
    LoginLogs.objects.create(action='user_login_failed', username=credentials.get('username', None))

