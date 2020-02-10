FROM hashicorp/terraform:0.12.20

RUN apk add --update --no-cache \
    bash \
    make \
    g++ \
    git \
    openssl \
    openssl-dev \
    curl

# install tflint
RUN curl -L -o /tmp/tflint.zip https://github.com/wata727/tflint/releases/download/v0.14.0/tflint_linux_amd64.zip && unzip /tmp/tflint.zip -d /usr/local/bin
RUN echo "4908d30078ecbd3b732ce5c2caabad77b6b768d46397ae009dd8dab8a1cbf6ac /usr/local/bin/tflint" | sha256sum -c

# install git-crypt
RUN curl -L -o /tmp/git-crypt.tar.gz https://www.agwa.name/projects/git-crypt/downloads/git-crypt-0.6.0.tar.gz
RUN echo "6d30fcd99442d50f4b3c8d554067ff1d980cdf9f3120ee774131172dba98fd6f  /tmp/git-crypt.tar.gz" | sha256sum -c
RUN tar -zxf /tmp/git-crypt.tar.gz
RUN cd git-crypt-0.6.0 && make && make install PREFIX=/usr/local
