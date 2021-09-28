FROM ubuntu:18.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y \
    curl \
    unzip \
    git-crypt \
    postgresql-client

# install tflint
RUN curl -L -o /tmp/tflint.zip https://github.com/terraform-linters/tflint/releases/download/v0.14.0/tflint_linux_amd64.zip
RUN echo "4908d30078ecbd3b732ce5c2caabad77b6b768d46397ae009dd8dab8a1cbf6ac  /tmp/tflint.zip" | sha256sum -c
RUN unzip /tmp/tflint.zip -d /usr/local/bin

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

RUN curl -O https://releases.hashicorp.com/terraform/0.13.7/terraform_0.13.7_linux_amd64.zip
RUN unzip terraform_0.13.7_linux_amd64.zip
RUN mv terraform /usr/local/bin/


