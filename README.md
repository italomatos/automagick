# automagick
This is a project that helps create cron jobs based on Web Services. You can schedule period to call some web services

Requisits
---
* Rails 5.2.1
* Ruby 2.5.1

## Getting Started

### Requirements
Automagick is built upon the following great community gems:

* [Rails 5.2.1](https://github.com/rails/rails)
* [Devise](https://github.com/plataformatec/devise)
* [Whenever](https://github.com/javan/whenever)


### Installation
Automagick is designed to run in the cloud or on dedicated hardware, whatever your organization is the most comfortable with. If you are looking for a hosting solution, we recommend [Heroku](http://www.heroku.com) for Rails hosting.

**Automagick currently only works with Ruby 2.5.1 **

1. Clone the repo to your computer or server
2. Configure your database for use with the Rails app
3. Run bundler
4. Create and seed the database with default data and a user account
5. Kick up a server with Puma running at [localhost:3000](http://localhost:3000)
6. Login!
	* username: admin@example.com
	* password: password
	
```
	$> git clone https://github.com/italomatos/automagick automagick
	$> cd automagick
	$> cp config/database.yml.sample config/database.yml
	$> cp config/schedule.rb.sample config/schedule.rb
	$> bundle install --without production
	$> bundle exec rake db:setup
	$> rails s -p 3000 *if you use Vagrant and have some problem to access http://localhost:3000, try start rails server: rails s -p3000 -b 0.0.0.0
```

### Demo
Try Automagick with direct deployment on Heroku:
<p><a href="https://heroku.com/deploy?template=https://github.com/italomatos/automagick" rel="nofollow"><img src="https://camo.githubusercontent.com/83b0e95b38892b49184e07ad572c94c8038323fb/68747470733a2f2f7777772e6865726f6b7563646e2e636f6d2f6465706c6f792f627574746f6e2e737667" alt="Deploy" data-canonical-src="https://www.herokucdn.com/deploy/button.svg" style="max-width:100%;"></a></p>