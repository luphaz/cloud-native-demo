# CNCF Demo

# Manual build & modifications

## Build go applications

Build both go applications for linux :

Linux build :
```
cd backend
env GOOS=linux GOARCH=amd64 go build
cd ../frontend
env GOOS=linux GOARCH=amd64 go build
cd ..
```

Powershell build :
```
function golinux {$env:GOOS="linux";$env:GOARCH="amd64";go build;$env:GOOS=$null;$env:GOARCH=$null}
cd backend
golinux
cd ../frontend
golinux
cd ..
```

> Be sure GOARCH correspond to the underlying system you run your container into

## Build go applications in container

To avoid installing and configuring go on your machine :

```
docker build -t backend-build -f build/Dockerfile --build-arg APP_PATH=backend .
docker run -d backend-build tail -f /dev/null
docker cp "$(docker ps -q -f ancestor=backend-build):/go/bin/backend" bin/backend
docker rm -fv $(docker ps -q -f ancestor=backend-build)

docker build -t frontend-build -f build/Dockerfile --build-arg APP_PATH=frontend .
docker run -d frontend-build tail -f /dev/null
docker cp "$(docker ps -q -f ancestor=frontend-build):/go/bin/frontend" bin/frontend
docker rm -fv $(docker ps -q -f ancestor=frontend-build)

```

## Build docker containers

When once of previous steps has been completed, you can now build final lighweight containers

Build both docker containers :

```
docker build -t kelseyhightower/backend:1.0.0 -f backend/Dockerfile .

docker build -t kelseyhightower/frontend:1.0.0 -f frontend/Dockerfile .

```
