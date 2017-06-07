# README

LITTLE SHOP

The purpose of this project is to design and implement an e-commerce site.
Our site is influenced by the book "Ready Player One", and as such, we sell
virtual items for a virtual world. We have users, admins, and guests that
can all access the application.

The version of Rails we are using is 5.1.1. The styling was done primarily with
CSS, and a bit of flexbox. Our database is accessed via Active Record queries.
For this project, we used HAML instead of ERB.
There are also about 20 lines of JQuery present.

PREREQUISITES
Rails version 5.1.1
site: http://installrails.com/

Ruby version 2.4.1
https://www.ruby-lang.org/en/documentation/installation/

INSTALLING
You can clone this app down onto your machine using the git clone command and copying and pasting the SSH key. From there you should work on installing some gems.

We have a lot of gems in our Gemfile so instead of installing them one by one, the easiest way to get them all up and running at once is with bundle. The website is listed below. It is pretty informative on how to get bundle installed.

http://bundler.io/

Once you install bundle, just run the command "bundle" or "rake exec bundle install" in the console to get all the gems installed.

DATABASE CREATION AND INITIALIZATION
To get the database set up correctly for the app follow these commands:

rake db:setup
-this will migrate and seed the database

rake db:test:prepare
-this will prepare your environment for running TESTS

Also it's not a bad idea to run a bundle just in case.

RUNNING THE TESTS
For this app we are using RSpec 3.6. To run the test suite simply write rspec into your console and that will run all the tests.

If you are looking only to run a handful of test or perhaps just a single test, follow the file tree down to your preferred specifications.

SERVICES
Heroku

DEPLOYMENT
For this app we deployed to Heroku. That can be accessed here:

https://safe-bastion-43545.herokuapp.com/

BUILT WITH
Ruby on Rails version 5.1.1 - The framework for web app we used
Ruby version 2.4.1 - The version of ruby we used to take care of the logic in our app.
Active Record - The way we manipulated and made queries to the database.

We used the following for styling:
CSS
SASS
Flex-box
HAML

For those of you unfamiliar with HAML: http://haml.info/tutorial.html

AUTHORS
-Sarah Kirk linkedin: http://www.linkedin.com/in/sarahelizabethkirk
-Charlie Corrigan linkedin:
https://www.linkedin.com/in/charliepscorrigan
-Padraic O'neill linkedin:
https://www.linkedin.com/in/padraiconeill
-Ben Jacobs linkedin:
https://www.linkedin.com/in/benjaminpjacobs

ACKNOWLEDGEMENTS
We were inspired by the book "Ready Player One" by Ernest Cline.

The wikipedia page can be found here:
https://en.wikipedia.org/wiki/Ready_Player_One

We would also like to thank the Stack Overflow community for being an abundant resource for all of our questions be it styling to rails errors.
