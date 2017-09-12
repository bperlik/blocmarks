#Blocmarks

Blocmarks is an application that allows users to
* bookmark URLS via
* email, peruse other's bookmarks and
* maintain a personal index of categorize bookmarks.

Blocmarks organizes bookmarks by topic.

This app was made with my mentor as part of the Software Engineering Track at [Bloc](http://bloc.io).

## Blocmarks is a Ruby on Rails application

The source code is here on GitHub: https://github.com/bperlik/blocmarks

The app is deployed on Heroku:

# Features

1. Users can sign up for a free account with email
2. Users can sign in and out 
3. Users can email an URL to Blocmarks and have it saved in a database
4. Users can see an index of all topics and bookmarks
5. Users can create, read, update, and delete bookmarks
6. Only users can delete and update their bookmarks.
7. Users can like/unlike bookmarks created by other users.
8. Users can see a list of bookmarks
 they've added or liked on a personal profile.

# Setup and Configuration

**Languages and Frameworks**: Ruby on Rails and Bootstrap

**Ruby version 2.43
**Rails 5.0.2

**Databases**: SQLite (Test, Development)

**Development Tools and Gems include**:

+ Devise for authorizations
+ BCrypt for secure passwords
+ SendGrid for email confirmation
+ Rspec-rails for testing
+ FactoryGirl for test suite success

**Setup:**

+ Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

+ The config/application.example.yml file illustrates how environment variables should be stored.

**To run Blocmarks locally:**

+ Clone the repository
+ Run bundle install
+ Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
+ Start the server using `rails server`
+ Run the app on `localhost:3000`

