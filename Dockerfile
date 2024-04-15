# https://hub.docker.com/_/docker/tags?page=1&page_size=&ordering=&name=-dind%20
FROM docker:26.0.1-dind

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ARG TARGETPLATFORM
ARG TARGETARCH

# https://github.com/hashicorp/terraform/tags
ARG TERRAFORM_VERSION=1.8.0

# https://github.com/docker/buildx/releases
ARG DOCKER_BUILDX_VERSION=0.13.1

LABEL maintainer="hello@mazzotta.me" \
    org.label-schema.build-date=$BUILD_DATE \
    org.label-schema.name="Docker terraform" \
    org.label-schema.description="Docker for terraform" \
    org.label-schema.url="https://github.com/emazzotta/docker-terraform" \
    org.label-schema.vcs-ref=$VCS_REF \
    org.label-schema.vcs-url="https://github.com/emazzotta/docker-terraform" \
    org.label-schema.vendor="Emanuele Mazzotta" \
    org.label-schema.version=$VERSION \
    org.label-schema.schema-version="1.0"

RUN apk add --no-cache \
    bash \
    curl \
    git \
    jq \
    openssl

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-${TARGETARCH}" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Install Docker Buildx
RUN mkdir -p ~/.docker/cli-plugins && \
    curl -L "https://github.com/docker/buildx/releases/download/v${DOCKER_BUILDX_VERSION}/buildx-v${DOCKER_BUILDX_VERSION}.$(uname -s)-${TARGETARCH}" -o ~/.docker/cli-plugins/docker-buildx && \
    chmod a+x ~/.docker/cli-plugins/docker-buildx

# Install Terraform
RUN curl -LO https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip && \
    unzip terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip -d /usr/local/bin && \
    rm terraform_${TERRAFORM_VERSION}_linux_${TARGETARCH}.zip

ENTRYPOINT ["terraform"]
