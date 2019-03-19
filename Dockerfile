FROM hashicorp/terraform:0.11.13

RUN apk add --update --no-cache make
# install tflint

RUN curl -L -o /tmp/tflint.zip https://github.com/wata727/tflint/releases/download/v0.6.0/tflint_linux_amd64.zip && unzip /tmp/tflint.zip -d /usr/local/bin
RUN echo "4a8cfd03001c79cb9f4a85c8e195fff1a676656467acbc5d078d516df809f31a  /usr/local/bin/tflint" | sha256sum -c