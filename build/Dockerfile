# Inspired from https://github.com/docker-library/golang/blob/master/1.7/onbuild/Dockerfile
FROM golang:1.7

ARG APP_PATH=app

RUN mkdir -p /go/src/$APP_PATH
WORKDIR /go/src/$APP_PATH

COPY $APP_PATH .
RUN go get -d -v
RUN env GOOS=linux CGO_ENABLED=0 go build -v -o /go/bin/$APP_PATH

# ONBUILD COPY $SOURCE /go/src/app
# ONBUILD RUN go-wrapper get -d- v
# ONBUILD RUN env GOOS=linux CGO_ENABLED=0 go-wrapper build -v

# Other options found
# GO_EXTLINK_ENABLED=0 CGO_ENABLED=0
# -extldflags "-static"
# -ldflags "-s" -a