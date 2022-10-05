# django-starter
My personal django starter project with Docker Compose


## How to run
```bash
docker-compose -f development.yml up --build
```

## Further development
Installing new python packages should take place inside the django app container. We can do that by accessing the container shell.
```bash
docker exec -it -u 0 <django app container name> ash
```

Alternatively, we can issue a command directly from the host terminal to execute inside the django app container.
```bash
docker exec -u 0 <django app container name> <command>
```
