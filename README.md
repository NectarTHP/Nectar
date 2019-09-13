
# NECTAR

## Links


Staging link: https://nectar-staging.herokuapp.com/


Project link: https://nectar-project.herokuapp.com/

## Presentation


Your artistic social network to Create, Share and Sell your artwork.



Our website is THE place for starting and confirmed artists that are looking to share, show and sell your artwork made easy. No middle man, no galleries, 


everything accessible from your pc, tablet or smartphone.    



To start the user has to create a profile by providing personal information. This information may be edited from the user page. 

During this process the user will have a choice to opt for a Standard profile or an Artist profile that will allow adding 

artworks and consequently, share and/or sell them. 


Standard users have the ability to browse existing content of the site, comment, like and buy artworks. Artist users also have 

an access to "seller" function, 


simply allowing them to add and sell their artwork through our online store. 


New artwork pieces and existing ones can be added, eddited or deleted from within the Artists profile page. 


The payment system uses an external service that provides a secure transaction for our users.


Thank you for your time and we hope that you will enjoy our application.


# The Nectar Team




Thibault Collard

Frédéric Lugbull

Jerome Lena

Azzedine MENGUIT

José Polit


----------
## Installation:


To start the application, launch the following commands:


Step 1: bundle install

Step 2: rails db:create

Step 3: rails db:migrate

Step 4: rails db:seed

Step 5: rails server


further:

Step 1: heroku restart

Step 2: heroku pg:reset DATABASE (no need to change the DATABASE)

Step 3: heroku run rake db:migrate

Step 4: heroku run rake db:seed (if you have seed)


----------

## Notes:

 - after_create for Sendgrid was dissactivated, as it created a conflict with the sign-up function.


Dependencies and gems used :


source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'dotenv-rails'

gem 'rails', ' 5.2.3'

gem 'pg', ' 0.18', '< 2.0'

gem 'puma', ' 3.11'

gem 'sass-rails', ' 5.0'

gem 'uglifier', ' 1.3.0'

gem 'coffee-rails', ' 4.2'

gem 'turbolinks', ' 5'

gem 'jbuilder', ' 2.5'

gem 'bootsnap', '1.1.0', require: false

gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

gem 'faker'

gem 'web-console', '3.3.0'

gem 'listen', '3.0.5', '< 3.2'

gem 'spring'

gem 'spring-watcher-listen', '2.0.0'

gem 'letter_opener'

gem 'capybara', '2.15'

gem 'selenium-webdriver'

gem 'rspec-rails'

gem 'chromedriver-helper'

gem 'rspec-rails'

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'pry' 

gem 'dotenv'

gem 'table_print'

gem 'activerecord' 

gem 'stripe'

gem 'bootstrap', ' 4.3.1'

gem 'devise', '4.7.1'

gem 'jquery-rails'

gem 'aws-sdk-s3', require: false


