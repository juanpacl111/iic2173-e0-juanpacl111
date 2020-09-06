FROM timbru31/ruby-node:2.5
ENV BUNDLER_VERSION=2.0.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

RUN gem install bundler -v 2.0.2

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle check || bundle install

RUN yarn install --check-files

COPY package.json yarn.lock ./

RUN yarn install --check-files

RUN rails generate simple_form:install

COPY . ./

RUN chmod +x entrypoints/docker-entrypoint.sh

RUN chmod +x init.sql

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]
