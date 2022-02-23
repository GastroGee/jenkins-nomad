# Docker and Docker Compose
#
FROM amidos/dcind:2.1.0 as dcind

ARG BUILD_DATE
ARG VERSION
ARG VCS-REF

# Labels.
LABEL maintainer="sksegha@gmail.com"
LABEL build-date="$BUILD_DATE"
LABEL vcs-url="https://github.com/GastroGee/jenkins/"
LABEL vcs-ref="$VERSION"
LABEL dockerfile-location="Dockerfile"

# Inspired by https://github.com/mumoshu/dcind and https://github.com/meAmidos/dcind/blob/master/Dockerfile
FROM adoptopenjdk/openjdk11:alpine-jre

USER root

ENV DOCKER_VERSION=18.09.8 \
    DOCKER_COMPOSE_VERSION=1.26.2

WORKDIR /

# Install Docker and Docker Compose
RUN apk --no-cache update && \
    apk --no-cache add --upgrade \
        sudo \
        bash \
        git \
        openssh \
        curl \
        jq \
        util-linux \
        py-pip \
        openssl-dev \
        python3-dev \
        libffi-dev \
        cargo \
        libc-dev \
        make \
        python3 py3-pip \
        zip \
        iptables && \
    curl https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKER_VERSION}.tgz | tar zx && \
    mv /docker/* /bin/ && \
    chmod +x /bin/docker* && \
    pip install docker-compose==${DOCKER_COMPOSE_VERSION}

# Remove packages that we used for installing and configuring Docker but no longer need.
RUN apk --no-cache del \
        py-pip\
        libffi-dev \
        python3-dev \
        libc-dev \
        cargo \
        make && \
    rm -rf /root/.cache

# Add these git config settings so we are able to push git tags and know it came from Jenkins.
RUN  git config --global user.email "sksegha@gmail.com" ;  git config --global user.name "Jenkins"

# Include useful functions to start/stop Docker daemon.
# Example: source /docker-lib.sh && start_docker
COPY --from=dcind /docker-lib.sh /docker-lib.sh

# Include entrypoint to simplify contract for pipeline usage.
COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]
CMD ["/bin/bash"]
