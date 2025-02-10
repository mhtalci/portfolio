FROM ruby:3.1-alpine

LABEL name="mhtalci"

ARG PACKAGES="build-dependencies build-base"

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache --virtual $PACKAGES

WORKDIR /home/portfolio
COPY Gemfile ./

RUN bundle install

COPY . .

CMD [ "bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]