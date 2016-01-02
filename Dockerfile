FROM ruby:2.3

MAINTAINER Karol Jastrzebowski <karol.jastrzebowski@gmail.com>

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD RUN bundle install
ONBUILD COPY . /usr/src/app

ENTRYPOINT ["jekyll"]

CMD ["serve"]
