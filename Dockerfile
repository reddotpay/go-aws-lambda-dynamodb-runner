# Base image:
FROM golang:latest
LABEL maintainer="daryl.n.w.k@gmail.com"

# Install golint
ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
RUN go get github.com/golang/lint/golint \
    github.com/aws/aws-sdk-go \
    github.com/aws/aws-dax-go \
    github.com/antlr/antlr4/runtime/Go/antlr \
    github.com/aws/aws-lambda-go/lambda \
    github.com/stretchr/testify \
    github.com/gusaul/go-dynamock \
    go.uber.org/zap \
    github.com/satori/go.uuid \
    github.com/asaskevich/govalidator \
    github.com/reddotpay/awskms

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
RUN ~/.local/bin/pip --version
RUN ~/.local/bin/pip install awscli --upgrade --user
RUN ~/.local/bin/aws --version

RUN apt-get update
RUN apt-get install jq -y
RUN apt-get install zip -y

ENV PATH $PATH:~/.local/bin