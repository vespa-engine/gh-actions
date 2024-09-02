ARG RUBY_VERSION=3.3
FROM ruby:$RUBY_VERSION-slim

RUN apt-get update \
  && apt-get install -y \
  build-essential \
  git \
  locales

COPY Gemfile Gemfile

ENV NOKOGIRI_USE_SYSTEM_LIBRARIES=true

RUN gem env && \
  bundle install --jobs 20 --retry 5

RUN \
  echo "en_US UTF-8" > /etc/locale.gen && \
  locale-gen en-US.UTF-8

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

COPY entrypoint.sh /entrypoint.sh

RUN mkdir -p /opt/jekyll/plugins
COPY vespa_index_generator.rb /opt/jekyll/plugins/vespa_index_generator.rb

ENTRYPOINT ["/entrypoint.sh"]
