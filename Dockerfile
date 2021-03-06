FROM ruby:2.5.1
ENV LANG C.UTF-8

RUN apt-get update && \
    apt-get install -y cron \
    				   nodejs \
                       vim \
                       mysql-client \
                       --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

#Cache bundle install
WORKDIR /tmp
ADD ./Gemfile Gemfile
ADD ./Gemfile.lock Gemfile.lock
RUN bundle install

ENV APP_ROOT /workspace
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
COPY . $APP_ROOT

EXPOSE  3001
CMD rm -f tmp/pids/server.pid && rails s -b '0.0.0.0' -p 3001