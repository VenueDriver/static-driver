FROM ruby:2.2.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
RUN gem update --system 2.6.4
ADD Gemfile /myapp/Gemfile
#ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
