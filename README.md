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

## Build docker containers

Build both docker containers :

```
docker build .\backend\ -t kelseyhightower/backend:1.0.0
docker build .\frontend\ -t kelseyhightower/frontend:1.0.0
```
