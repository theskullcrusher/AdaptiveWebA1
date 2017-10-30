from django.shortcuts import render, render_to_response
from django.http import HttpResponse, JsonResponse
from django.template.response import TemplateResponse
from assignment1.surajsite.models import *
from datetime import datetime
from django.shortcuts import redirect
import traceback
import logging
logger = logging.getLogger(__name__)
import random
import time
from django.db.models import Count, Sum, Max, Min
from copy import deepcopy
import re
from django.contrib.auth.models import User
import json
from elasticsearch import ElasticSearch

def utils():
	pass


def create_index():
	"""Used to create index, etc"""
	


if __name__ == "__main__":
	utils()