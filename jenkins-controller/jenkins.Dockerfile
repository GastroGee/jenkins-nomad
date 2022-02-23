FROM jenkins/jenkins:2.319.2-lts-alpine
USER root
RUN apk update && apk -v add bash git docker
RUN mkdir -p /etc/jenkins
COPY *.yaml /etc/jenkins/
RUN chmod 755 /etc/jenkins/*
COPY plugins.yml /tmp/
RUN chown jenkins:jenkins /tmp/plugins.yml
USER jenkins
RUN jenkins-plugin-cli --verbose --plugin-file /tmp/plugins.yml
USER root
RUN rm -f /tmp/plugins.yml
