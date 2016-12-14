FROM golang:latest

ADD backend /go/src/github.com/app/backend
WORKDIR /go/src/github.com/app/backend
RUN go get ./...
RUN go install github.com/app/backend

ENTRYPOINT /go/bin/sample-consumer