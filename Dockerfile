FROM alpine:3.8

# Configure less
ENV PAGER="less -r"

# Install required packages
RUN set -ex; \
    apk --no-cache add \
      bash \
      less \
      curl \
      git \
      jq \
      groff \
      py-pip \
      python \
      nodejs \
      npm; \
    npm install -g npm;

# Install aws-shell (which also install aws-cli)
RUN pip install --upgrade \
      pip \
      aws-shell \
      awsebcli;

# Install ecs-cli
RUN curl -o /usr/local/bin/ecs-cli https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest && chmod u+x /usr/local/bin/ecs-cli

# Add aws cli command completion
RUN echo "complete -C '/usr/bin/aws_completer' aws" >> ~/.bashrc