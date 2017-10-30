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
	with open('data.json','r') as f:
		es = Elasticsearch()
		doc = json.load(f)
		print type(doc)
		# res = es.index(index="wikibook", doc_type='book', body=doc)
		# print(res['created'])

		# res = es.get(index="test-index", doc_type='tweet', id=1)
		# print(res['_source'])

		# es.indices.refresh(index="test-index")

		# res = es.search(index="test-index", body={"query": {"match_all": {}}})
		# print("Got %d Hits:" % res['hits']['total'])
		# for hit in res['hits']['hits']:
		#     print("%(timestamp)s %(author)s: %(text)s" % hit["_source"])



if __name__ == "__main__":
	utils()
	create_index()