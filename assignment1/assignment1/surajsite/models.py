from __future__ import unicode_literals
from django.db import models
from django.contrib.auth.models import User
from datetime import datetime

class SiteUser(User):
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

class UserLogs(models.Model):
    user = models.ForeignKey('SiteUser')
    action = models.CharField(max_length=256)
    link = models.TextField()
    obj = models.TextField()
    created_on = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)
