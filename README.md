# AdaptiveWebAssignments

0. Assignment uses Django1.8 along with its ORM to manage the mysql database

1. Installing requirements(Only needed if you are setting up the repository):
 Run install_packages.sh file using 
     >sh ./install_packages.sh
 Run 
     > cd assignment1
     > pip install -r requirements.txt

2. Setting up database (Not needed for the online version demo):
 Create or change root user for MySQl with password: surajshah
 Access mysql from terminal as : mysql -u root -p surajshah
 Restore the mysql dump using the following command from root directory:
 > cd AdaptiveWebA1 
 > mysqldump -uroot -psurajshah surajsite < surajsitedump.sql


3. Instructions for testing my Assignment 1:
   Please install the google chrome extension that is provided to you with this repository. It is tested in the latest version of chrome 64bit on windows 10 machine. Then go the site below

   -Home/Login page: http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com/login/
   Login usernames: aaa, bbb, ccc, ddd, eee 
   Login password: 123    #for all accounts
  
   -CreateUser page: http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com/admin/
   Superuser login username: suraj
   Superuser login password: surajshah
   -Now after logging in go to add user and add a new system user by specifying username and password.

   -Logout and login with any normal user on /login page which takes you to the profile page
   Profile page: http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com/profile/
   -This page answers the question asked, on the top. It then provides a link to Java stackoverflow. After that it displays the user's login logs with timestamp in UTC, stored onto the server in a persistent database layer, as asked. Below that you will find a table that has all different user activities along with their timestamps in a table, sorted by most recent. 

   -You can login using a user, perform activity by going to the stackoverflow link provided in the profile page, and come back and refresh the page to see the activity being logged in near real-time.

   -Salient features include no tracking done on stackoverflow after logout from the website(cookie deleted). You will be given a prompt to login to the website by the extension if you visit stackoverflow without actually logging in. The prompt is design is such a way that you will have only 1 prompt per page which will be triggered by one of the actions that it records. 

   -Different types of actions recorded include post, search, scroll up, scroll down, click question, click any link, star question, upvote, downvote, hover over tag, hover over upvote or downvote, etc.


4. Instructions for testing my Assignment 2:
   Please visit http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com
   Login using assignment 1 credentials
   Go to the 'Analytics' page link
   Use all 3 tabs and scroll to read analysis,comments and interact with graphs



5. Instructions for testing my Assignment 3:
   To setup - follow Assignment 1 instuction steps 0 to 2.
   Please visit http://ec2-54-215-192-184.us-west-1.compute.amazonaws.com
   Login using assignment 1 credentials
   Go to the 'Recommendations' page link. All indexed pages with their recommended top 10 items are displayed on this page. 
   I have clipped the questions after 200 characters on purpose for a better viewing experience.
   I have also added a javascript function to toggle visibility of each of the 10 posts so that atmost one section is active at a time. Click on any Post to view it's recommendations (stemming). 
   At the bottom of the page, I've explained content indexing and originality.
   Find all implementation related to Assigment3 in the project sourcecode under folders: AdaptiveWebA1/assignment1/assignment1/assign3_utils/, and in surajsite/views.py and templates/recommendations.html. 
   Installation of ElasticSearch is done separately and has not been attached as a part of the sourcecode. 
   assign3_utils/crawler.py has sourcecode to crawl the desired webpages, fragment it and store it as data.json, 
   assign3_utils/utils.py has sourcecode to connect to elasticsearch using python Elasticsearch library and create_index and search over that index.
   surajsite/views.py has a function recommendations which populates the html template using Jinja2 templating engine and serves the data over the web.
   Content Indexing is done with title, url, content and a flag parameter for each section in each page which is considered as an atomic unit to be served back, not the entire page. 92 pages have more than 500 subsections which may include code fragments too. The input for the search query is the entire question+codefragment given in the input posts csv file.
   