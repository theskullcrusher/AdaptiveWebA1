# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('surajsite', '0003_auto_20170905_0828'),
    ]

    operations = [
        migrations.AddField(
            model_name='userlogs',
            name='main_link',
            field=models.TextField(default=None, null=True, blank=True),
        ),
        migrations.AlterField(
            model_name='userlogs',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2017, 9, 7, 7, 46, 48, 668348)),
        ),
    ]
