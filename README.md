# README

### System Requirements:
* Ruby 2.3.3
* Rails 5.2
* Posgres

### How to Run:
* Install ruby and then rails.
* Go to project directory and run ```bundle install```
* Create database with ```bundle exec rake db:create```
* Migrate with ```bundle exec rake db:migrate```
* Seed with ```bundle exec rake db:seed``` for both ```RAILS_ENV=test``` and ```RAILS_ENV=dev```
* Run ```rails s```
* Quiz is accessible at the index and the CRUD app at ```/admin```.