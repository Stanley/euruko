# Euruko

Minimal conference handling app that allows to:

* register users interested in Euruko
* send notifications to registered users
* register speakers
* pay for participation
* issue invoices

## Installation

Make sure you have RubyGems 1.3.5 and bundler gem installed.

To run the application:

    bundle install
    rake db:migrate
    ./script/server

To run cucumber:

    RAILS_ENV=cucumber rake db:migrate
    rake cucumber

To run rspec:

    RAILS_ENV=test rake db:migrate
    rake spec


