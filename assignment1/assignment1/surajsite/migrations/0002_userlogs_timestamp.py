# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('surajsite', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='userlogs',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2017, 9, 5, 1, 0, 54, 67859)),
        ),
    ]
