# CNCF Demo

# Manual build & modifications

## Build go applications

Build both go applications for linux :

Linux build :
```
cd backend
env GOOS=linux GOARCH=arm go build
cd ../frontend
env GOOS=linux GOARCH=arm go build
cd ..
```

Powershell build :
```
function golinux {$env:GOOS="linux";$env:GOARCH="arm";go build;$env:GOOS=$null;$env:GOARCH=$null}
cd backend
golinux
cd ../frontend
golinux
cd ..
```

## Build go applications in container

To avoid installing and configuring go on your machine :

Linux :
```
docker build -t build-backend -f backend/build/Dockerfile backend
id=$(docker run -d build-backend tail -f /dev/null)
docker cp $id:/go/bin/app backend/backend
docker rm -f -v $id

docker build -t build-frontend -f frontend/build/Dockerfile frontend
id=$(docker run -d build-frontend tail -f /dev/null)
docker cp $id:/go/bin/app frontend/frontend
docker rm -f -v $id

```

Powershell :
```
docker build -t build-backend -f backend/build/Dockerfile backend
$id=$(docker run -d build-backend tail -f /dev/null)
docker cp ${id}:/go/bin/app backend/backend
docker rm -f -v $id

docker build -t build-frontend -f frontend/build/Dockerfile frontend
$id=$(docker run -d build-frontend tail -f /dev/null)
docker cp ${id}:/go/bin/app frontend/frontend
docker rm -f -v $id

```

## Build docker containers

When once of previous steps has been completed, you can now build final lighweight containers

Build both docker containers :

```
docker build -t kelseyhightower/backend:1.0.0 .\backend\

docker build -t kelseyhightower/frontend:1.0.0 .\frontend\

```
