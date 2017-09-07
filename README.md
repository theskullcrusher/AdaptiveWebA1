# AdaptiveWebA1
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


3. Instructions for testing my site:
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

