FROM ubuntu:14.04
MAINTAINER Sam Grimee "sgrimee@gmail.com"

ENV REFRESHED_AT 2016-02-02
ENV AGENT_PACKAGE mongodb-mms-automation-agent-manager_2.5.15.1526-1_amd64.deb

ENV AGENT_PACKAGE_URL https://cloud.mongodb.com/download/agent/automation/$AGENT_PACKAGE

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qqy update && \
    apt-get install -qqy \
        ca-certificates \
        curl \
        libsasl2-2

# MMS automation
VOLUME /var/lib/mongodb-mms-automation
RUN cd /tmp \
  && curl --silent -L $AGENT_PACKAGE_URL  -o $AGENT_PACKAGE \
  && dpkg -i $AGENT_PACKAGE \
  && rm -f $AGENT_PACKAGE

# MongoDB data volume
VOLUME /data
RUN chown mongodb:mongodb /data

ENTRYPOINT ["/opt/mongodb-mms-automation/bin/mongodb-mms-automation-agent"]
