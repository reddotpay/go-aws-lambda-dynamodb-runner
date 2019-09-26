# Base image:
FROM golang:1.13.1
LABEL maintainer="daryl.n.w.k@gmail.com"

# Install golint
ENV GOPATH /go
ENV PATH ${GOPATH}/bin:$PATH
ENV DEP_VERSION 0.5.0

RUN go version

RUN go get golang.org/x/lint/golint \
    github.com/aws/aws-sdk-go \
    github.com/aws/aws-dax-go \
    github.com/antlr/antlr4/runtime/Go/antlr \
    github.com/aws/aws-lambda-go/lambda \
    github.com/awslabs/aws-lambda-go-api-proxy/handlerfunc \
    github.com/aws/aws-xray-sdk-go/... \
    github.com/stretchr/testify \
    github.com/gusaul/go-dynamock \
    go.uber.org/zap \
    github.com/go-playground/validator \
    github.com/satori/go.uuid \
    github.com/asaskevich/govalidator \
    github.com/gomodule/redigo/redis \
    github.com/rafaeljusto/redigomock \
    github.com/hubcash/cards \
    github.com/newrelic/go-agent \
    github.com/reddotpay/awskms \
    github.com/reddotpay/redis \
    github.com/reddotpay/logger \
    github.com/reddotpay/api \
    github.com/reddotpay/retry \
    github.com/reddotpay/currency \
    github.com/reddotpay/metrics \
    github.com/reddotpay/lambda-warmer \
    github.com/gorilla/schema \
    github.com/pariz/gountries \
    golang.org/x/net/context/ctxhttp \
    github.com/hashicorp/go-retryablehttp \ 
    github.com/gianebao/n36 \
    golang.org/x/oauth2/clientcredentials \
    github.com/jinzhu/copier \ 
    github.com/google/go-querystring/query \
    golang.org/x/text/encoding \
    golang.org/x/text/encoding/charmap \
    golang.org/x/text/encoding/htmlindex \
    golang.org/x/text/transform \
    gopkg.in/go-playground/validator.v9 \
    gopkg.in/square/go-jose.v2 \
    github.com/shopspring/decimal \ 
    github.com/gofrs/uuid

RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py --user
RUN ~/.local/bin/pip --version
RUN ~/.local/bin/pip install awscli --upgrade --user
RUN ~/.local/bin/aws --version

RUN apt-get update
RUN apt-get install jq -y
RUN apt-get install zip -y

# Download the binary to bin folder in $GOPATH
RUN curl -L -s https://github.com/golang/dep/releases/download/v${DEP_VERSION}/dep-linux-amd64 -o $GOPATH/bin/dep
# Make the binary executable
RUN chmod +x $GOPATH/bin/dep

ENV PATH $PATH:~/.local/bin:$GOPATH/bin/dep
