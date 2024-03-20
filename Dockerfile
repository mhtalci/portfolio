FROM ruby:3.1

WORKDIR /home/portfolio

COPY Gemfile ./

RUN bundle install

COPY . .

CMD [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
