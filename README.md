# October

## Requirements
* Docker
* Fig

## First Run

```
fig up

docker run \
    -d \
    --restart always \
    --name proxy \
    -p 80:80 \
    -v /var/run/docker.sock:/tmp/docker.sock \
    jwilder/nginx-proxy || true
```

## Concatanous runs

```
fig start
docker start proxy
```
### Add entries to the hosts file:
```127.0.0.1 october.local```

database host: db
database username: ocrober
database name: october
database default password: g7453ng4fj23djgfnHIOB8jG87gUJ  
#change locally!in provision/postgresql/prepareDB.sh
