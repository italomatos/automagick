# automagick
This is a project that helps create cron jobs based on Web Services. You can schedule period to call some web services

Requisits
---
* Rails 3.12.3

## Getting Started

### Requirements
Automagick is built upon the following great community gems:

* [Rails 3.2](https://github.com/rails/rails)
* [Devise](https://github.com/plataformatec/devise)
* [Whenever](https://github.com/javan/whenever)


### Installation
Automagick is designed to run in the cloud or on dedicated hardware, whatever your organization is the most comfortable with. If you are looking for a hosting solution, we recommend [Heroku](http://www.heroku.com) for Rails hosting.

**Automagick currently only works with Ruby 1.9.3, Ruby 2.0 is not supported at this time**

1. Clone the repo to your computer or server
2. Configure your database for use with the Rails app
3. Run bundler
4. Create and seed the database with default data and a user account
5. Kick up a server with WEBrick running at [localhost:3000](http://localhost:3000)
6. Login!
	* username: admin@example.com
	* password: password
	
```
	$> git clone https://github.com/italomatos/automagick automagick
	$> cd automagick
	$> cp config/database.yml.sample config/database.yml
	$> bundle install --without production
	$> bundle exec rake db:setup
	$> rails s -p 3000
```