FROM ruby:3.0.2

RUN apt-get update -qq
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get install -y nodejs
RUN npm install --global yarn

WORKDIR /app

COPY Gemfile Gemfile.lock /app/
RUN bundle install

CMD ["rails", "server", "-b", "0.0.0.0"]
