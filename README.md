# Installation 
## Optional Postgres Service 
docker-compose.yml defines simple configuration for 
a local database service running the latest version of 
postgres on localhost:5432 with default password 'postgres'
and user 'postgres'
```bash
# download the postgres image
docker compose pull
# start the container on port 5432
docker compose up
```

