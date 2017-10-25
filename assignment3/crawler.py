# -*- coding: utf-8 -*-
#__author__:surajshah

from bs4 import BeautifulSoup
import json
import urllib2
import traceback

def crawler():
	"""Crawl the java wikibook and store the content into json files"""
	try:
		base_url = 'https://en.wikibooks.org'
		start_url = 'https://en.wikibooks.org/wiki/Java_Programming'

		page = urllib2.urlopen(start_url)
		soup = BeautifulSoup(page.read(), "html.parser")

		relevant_anchors_base = soup.find("div", "mw-parser-output")
		relevant_links = []

		for each in relevant_anchors_base.findAll("a"):
			if "/wiki/Java_Programming" in each.attrs['href']:
				relevant_links.append(each.attrs['href'])

		#Consider only relevant 92 links from Wiki About this book to Wiki ByteCode
		relevant_links = relevant_links[7:len(relevant_links)-3]
		# print relevant_links
		# print len(relevant_links)
		with open("data.json","w+") as f:
				
			data = []
			for link in relevant_links:
				main_page = {}
				# print "Current link:", link
				page = urllib2.urlopen(base_url + link)
				soup = BeautifulSoup(page.read(),"html.parser")
				relevant_anchors_base = soup.find("div", "mw-parser-output")

				if relevant_anchors_base.find("table", class_="noprint") != None:
					try:
						title = relevant_anchors_base.find("table", class_="noprint").findAll("td", recursive=True)[1].find('b').text
						if "To do:" in title:
							title = soup.find("div", "mw-body").find('h1').text
					except:
						title = soup.find("div", "mw-body").find('h1').text
					# print title
				else:
					title = link.split('/')[-1].strip().replace('_','')
					# print title
					# print "#################################################No title available"
				main_page['title'] = title
				title = ""
				content = ""
				subdata = []
				flag = False
				for element in relevant_anchors_base.children:
					if element.name == "h2":
						if flag == False:
							main_page['content'] = content
							flag = True
						else:
							subdata.append({'title':title, 'content':content})
						content = ""
						title = element.text
					else:
						if element.name != None:
							if element.has_attr('class') and 'noprint' in element['class']:
								pass #Ignore
							else:
								content += element.text.encode('ascii', 'ignore').strip() #ignore errors
				main_page['subdata'] = subdata
				data.append(main_page)

			#write data to file
			data = json.dumps(data)
			print data
			f.write(data)

	except Exception as e:
		traceback.print_exc()

if __name__ == "__main__":
	crawler()






