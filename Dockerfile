FROM ruby:2.3.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
#ADD Gemfile.lock /myapp/Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler --version '1.3.0'

ADD . /myapp
RUN bundle install
