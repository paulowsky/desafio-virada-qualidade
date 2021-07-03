# **********************************************************************************************************************
# HOW TO BUILD THIS IMAGE
# -----------------------
# build:
#   docker build . -t automation-ui
# **********************************************************************************************************************
FROM ruby:2.5.3-stretch

ENV DEBIAN_FRONTEND noninteractive

#|================================|
#|          dependencies          |
#|================================|
RUN apt-get -yqq update &&\
    apt-get -yqq --no-install-recommends install curl unzip wget &&\
    apt-get -yqq --no-install-recommends install xvfb tinywm xauth &&\
    apt-get -yqq --no-install-recommends install gnupg software-properties-common &&\
    apt-get -yqq --no-install-recommends install fonts-liberation libappindicator1 libasound2 libnss3 libappindicator3-1 &&\
    apt-get -yqq --no-install-recommends install libatk-bridge2.0-0 libatk1.0-0 libcups2 libgtk-3-0 libnspr4 &&\
    apt-get -yqq --no-install-recommends install libxss1 libxtst6 xdg-utils &&\
    rm -rf /var/lib/apt/lists/* &&\
    echo "America/Sao_Paulo" > /etc/timezone  &&\
    dpkg-reconfigure -f noninteractive tzdata

#|================================|
#|          Google Chrome         |
#|================================|
ARG CHROME_VERSION="91.0.4472.114-1_amd64"
RUN wget https://github.com/webnicer/chrome-downloads/raw/master/x64.deb/google-chrome-stable_$CHROME_VERSION.deb  &&\
    dpkg -i google-chrome-stable_*.deb || true  &&\
    dpkg --configure -a  &&\
    apt-get install -y -f  &&\
    rm -rf /var/lib/apt/lists/*


#|================================|
#|        Chrome webdriver        |
#|================================|
ARG CHROME_DRIVER_VERSION="91.0.4472.101"
RUN echo "Using chromedriver version: "$CHROME_DRIVER_VERSION &&\
    mkdir -p /opt/automation &&\
    curl http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -o /opt/automation/chromedriver_linux64.zip &&\
    cd /opt/automation &&\
    unzip /opt/automation/chromedriver_linux64.zip &&\
    rm -rf chromedriver_linux64.zip &&\
    ln -fs /opt/automation/chromedriver /usr/local/bin/chromedriver

RUN dpkg-divert --add --rename --divert /opt/google/chrome/google-chrome.real /opt/google/chrome/google-chrome &&\
    echo "#! /bin/bash\nexec /opt/google/chrome/google-chrome.real --no-sandbox --disable-setuid-sandbox \"\$@\"" > /opt/google/chrome/google-chrome &&\
    chmod 755 /opt/google/chrome/google-chrome

#|================================|
#|            folders             |
#|================================|

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

ENTRYPOINT \
  xvfb-run --server-args="-screen 0:0 1440x900x24" \
  bundle exec parallel_cucumber features/ -n 8 -o "-p parallel"
