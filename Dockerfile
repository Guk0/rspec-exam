FROM ruby:2.6.5
RUN apt-get update -qq && apt-get install -y nodejs build-essential postgresql-client
WORKDIR /rspec-study
COPY Gemfile /rspec-study/Gemfile
COPY Gemfile.lock /rspec-study/Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
