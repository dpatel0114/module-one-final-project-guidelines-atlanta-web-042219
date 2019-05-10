# Fest Tracker

![Fest Image](https://www.ruhrgold.com/wp-content/uploads/2018/02/festivals-zomer-2017.jpg)

We have designed an application for a user to be able to search for nearby festivals.  Our application is called Fest Tracker. This application allows the user to search by category and narrow a search using their location. The application to add and update reviews through a simple interface. 

To get started…

We have three models for our application. Those models include a consumer, festival, and review class. The classes will relate in a “many too many”  format using Object Relationship methods. We will also use an Active Record method to link the relationship of the models together.


Install ‘bundle install’ . Make sure to run your program through ‘ruby bin/run.rb’.

1. The first step is to ‘Fork and Clone’ the “Final Project Guidelines” from Git Hub.
2. We would then make sure to create a library folder in the toolbar, from there we could create the correct files for our three models consumer, festival, and review class.
3. The next step is to modify each model class with the (ActiveMethod :: Base). We also need to add the migrate method for each class.
4. We should create tables for each of the three models. The structure of the tables should include the following.
    1.  create_festival.rb.
    2.  create_cosumer.rb.
    3.  create_review.rb
  5. We first created a welcome method. The welcome method:
	puts ‘Welcome to Fest Tracker’
	puts ‘What would you like to do today?’
6. From the there we have created a main_menu method. The main_menu method establishes.
	print "1. LIst of locations of festival.
        print "2. add reviews.
        print "3. Update profile.
        puts  "4. Delete profile.
	- This allows the user to select from our start page of the application. To allow for the user to have easy access to the rest 		of the application.
 	- For example, if the user selects the 2nd option, they would be prompted to a second sequential question, This question 		would be ‘Do you have account with us? Yes/ No’.

7. The next method, is a list_locations method. When choosing the first option from the main_menu it will prompt you to pick a location that our application has been set for. The locations available are Atlanta, Ga and New York City, NY.
8. When the user chooses a location, it will then ask give options available for that city.
9. The categories that the user can choose from include art, music, and religious festivals.
10. After the user selects a category, the application then allows the user to select an event that our application has selected as an option.
11. The application allows the user to add_reviews from the profile. The user is allowed to enter the name of the event, a review description(content) and also a rating.
12. The application also allows its users to update their profile information (i.e.. email address).
13. The application is very user friendly in aspects of being able to create your account, also allowing the user to update/edit their account.
14. The application also allows for the user to easily delete their profile through a simple task.


The application allows for user to be able search through festivals through location suggestions. The application is a hallmark of user friendliness.
