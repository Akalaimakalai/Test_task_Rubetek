FROM ruby:2.6
ARG SECRET_TOKEN

WORKDIR /rubetek

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -qy nodejs
RUN gem install bundler -v '1.17.3'

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install --jobs 20 --retry 5 --without development test

COPY ./ .
RUN cp config/database.yml.sample config/database.yml

ENV RAILS_ENV=production
ENV SECRET_KEY_BASE=$SECRET_TOKEN
RUN bundle exec rake assets:precompile
