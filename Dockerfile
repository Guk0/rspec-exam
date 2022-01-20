FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /rspec-study
WORKDIR /rspec-study

COPY Gemfile /rspec-study/Gemfile
COPY Gemfile.lock /rspec-study/Gemfile.lock

RUN gem install bundler:2.3.5

RUN bundle install

COPY . /rspec-study
