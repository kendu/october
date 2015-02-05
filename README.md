# October

## Requirements
* Docker
* Fig

## First Run

```
./provision/setup.sh
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
