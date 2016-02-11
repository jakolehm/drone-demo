FROM ruby:2.2-alpine

ADD Gemfile /app/
ADD Gemfile.lock /app/

RUN apk --update add --virtual build-dependencies build-base openssl-dev && \
    gem install bundler && \
    cd /app ; bundle install --without development test && \
    apk del build-dependencies

ADD . /app
RUN chown -R nobody:nogroup /app
USER nobody

ENV RACK_ENV production

WORKDIR /app

CMD ["ruby", "api.rb"]
