# Community Calendar Application

This is Community Calendar Application for sharing events.

* Uses Ruby on Rails version 5.0
* Currently hard-coded to use Central Time Zone

To run locally:
* Install Ruby
* Install Ruby on Rails
* In the console, clone this repository by typing git clone git@github.com:bengolden/community_calendar.git
* In the console, run bin/bundle install
* In the console, create and migrate the database by running bin/rake db:create and bin/rake db:migrate
* In the console, start the server with bin/rails s
* Visit localhost:3000 in any web browser

Notes:
* This is a prototype, with minimal test coverage
* The way this application handles time, and enforcing the Central Time Zone, is, ahem, not exactly using best coding practices