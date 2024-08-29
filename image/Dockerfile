FROM alpine:3.19.0

# Set environment variables
ENV HOME=/root
ENV WORKDIR=/app

# Install packages
RUN apk --no-cache add findutils  \
    curl \
    bash-completion \
    git
RUN git config --global --add safe.directory /app

# Install apps here

# Adds shell commands
COPY ./commands/* /usr/bin/

# Workdir and entrypoint
WORKDIR ${WORKDIR}
ENTRYPOINT ["docker-entrypoint"]
