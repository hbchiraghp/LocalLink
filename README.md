LocalLink
====

## Setup LocalLink application in local

### Clone This Repo

	git clone git@github.com:hbchiraghp/LocalLink.git
 

### Change the branch

	git checkout hb-sravan

### Double-check your RVM installation
please check the [RVM integration page](https://rvm.io/integration) for steps needed for your terminal or environment.

### Install the ruby using rvm

    rvm insall 2.2.3
    
### Get into path of the application

    cd LocalLink

### Install the dependencies

    bundle install

### Configure config/database.yml as per your local credentials

	host: xxxxx
	username: xxxxx
	password: xxxxx

### Run the Migrations for development and test environment

    rake db:migrate
    rake db:migrate RAILS_ENV=test
    
### Run the test cases with below command

	bundle exec rspec spec

### Start the server in development environment
	
	rails s

### We can visit the path as follows from the browser

Access application from browser using the following url http://localhost:3000

