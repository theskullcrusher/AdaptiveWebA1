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
import json, re
from elasticsearch import Elasticsearch
import pprint

def utils():
	pass

def search_index(search):
	"""Search an index"""
        with open('data.json','r') as f:
                es = Elasticsearch()
                docs = json.load(f)
#		body = {"query": {"match": {"wikibooks.content":search}}, 
#			"_source": ["wikibooks.title","wikibooks.content", "wikibooks.url"]
#			}
#				"_source": ["wikibooks.title","wikibooks.content", "wikibooks.url", "wikibooks."]
                body = {"query": {"multi_match": {"query":search, "fields":["content","title"]}}
                        }
#				sub_body = {"query": {'match':{'wikibooks.subdata.content':search}}, 
#                        "_source": ["wikibooks.subdata.content", "wikibooks.subdata.title"]
#                        }
		res = es.search(index='wikibooks',body=body)	
		pp = pprint.PrettyPrinter(indent=4)
		#pp.pprint(res)
		return res


def create_index():
	"""Used to create index, etc"""
	with open('data.json','r') as f:
		es = Elasticsearch()
		docs = json.load(f)
		# docs = {}
		# docs['wikibooks'] = docs1
		#print doc[0]
		failed_count = 0
		failed_count1 = 0
		failed_count2 = 0
		#es.delete(index='wikibook', doc_type='book', id=1)
		#results = []
		id_count = 1
		for n, each_doc in enumerate(docs):
			try:
				# val = each_doc['title'].strip().replace(' ', '').lower()
				# val = re.sub('[^0-9a-zA-Z]+', '', val)
				# es.delete(index='wikibooks', doc_type='book', id=1)
				# exit()
				es.delete(index='wikibooks', doc_type='book', id=id_count)
				each_doc['flag'] = True
				url = each_doc['url']
				subdata = each_doc['subdata']
				del each_doc['subdata']
				res = es.index(index='wikibooks', doc_type='book', body=each_doc, op_type='create', id=id_count)
				id_count+=1
				if not res['created']:
					failed_count += 1

				for d in subdata:
					es.delete(index='wikibooks', doc_type='book', id=id_count)
					d['url'] = url
					d['flag'] = False
					res = es.index(index='wikibooks', doc_type='book', body=d, op_type='create', id=id_count)
					id_count+=1
					if not res['created']:
						failed_count1 += 1		

			except Exception as e:
				print e
				failed_count2 += 1
				continue		

		#print('Created? ',res['created'])
		print "Failed insertions:",failed_count, ' ', failed_count1, ' ', failed_count2

#		res = es.search(index="wikibook", body={"query": {"match_all": {'title':'history'}}})
#		print("Got %d Hits:" % res['hits']['total'])
#		for hit in res['hits']['hits']:
#		     print("%(timestamp)s %(author)s: %(text)s" % hit["_source"])


if __name__ == "__main__":
	utils()
	create_index()
	print search_index("Java")
