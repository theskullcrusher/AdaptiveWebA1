# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import datetime


class Migration(migrations.Migration):

    dependencies = [
        ('surajsite', '0002_userlogs_timestamp'),
    ]

    operations = [
        migrations.CreateModel(
            name='LoginLogs',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('action', models.CharField(max_length=64)),
                ('ip', models.GenericIPAddressField(null=True)),
                ('username', models.CharField(max_length=256, null=True)),
                ('timestamp', models.DateTimeField(auto_now_add=True)),
            ],
        ),
        migrations.AlterField(
            model_name='userlogs',
            name='timestamp',
            field=models.DateTimeField(default=datetime.datetime(2017, 9, 5, 8, 28, 25, 464230)),
        ),
    ]
