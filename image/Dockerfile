FROM alpine:3.20.2

# Set environment variables
ENV HOME=/root

# Install packages
RUN apk --no-cache add findutils  \
    curl \
    bash-completion \
    jq \
    envsubst

# Directory to save resources files
RUN mkdir -p /opt/resources
RUN mkdir -p /opt/templates
COPY ./templates/* /opt/templates/

# Adds shell commands
COPY ./commands/* /usr/bin/

# Entrypoint
ENTRYPOINT ["docker-entrypoint"]
