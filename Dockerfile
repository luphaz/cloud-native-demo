FROM golang:alpine

RUN apk update
RUN apk upgrade
RUN apk add --no-cache bash git openssh

ADD backend /go/src/github.com/app/backend
WORKDIR /go/src/github.com/app/backend
RUN go get ./...
RUN go install github.com/app/backend

ENTRYPOINT /go/bin/backend
