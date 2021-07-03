# **********************************************************************************************************************
# HOW TO BUILD THIS IMAGE
# -----------------------
# build:
#   docker build . -t beckend
# **********************************************************************************************************************

FROM ruby:2.5.3-stretch

RUN mkdir /tests &&\
    mkdir /tests/reports

WORKDIR /tests

#|================================|
#|      Install dependencies      |
#|================================|
COPY Gemfile ./
RUN gem install bundler &&\
    bundle install

#|================================|
#|          Copy project          |
#|================================|
COPY features/ features/
COPY cucumber.yml ./

ENTRYPOINT [ "bundle", "exec", "cucumber", "-p", "parallel" ]
