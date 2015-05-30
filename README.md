# Simple Migration for Postgres

### Example usage
Imagine the following scenario: You want to execute a sql file (for example for migrations) on a running postgres container.

Internally this image uses the really useful [shmig](https://github.com/naquad/shmig) tool by naquad. You can specify the following environment variables to configure it
```
DB_USER=postgres # the user of the database
DB_PASSWORD=s3cr3tPw # password to the database
DB_NAME=postgres # the database name
DB_HOST=postgres_host # the host of the database, usually the name of the db container
SLEEP=n # sleep n seconds before executing
```

You can set these either through the `-e` switches of `docker run` or with the supplied `docker-compose.yml`

Additionally, you have to link the container to a running postgres container. The `DB_HOST` variable is usually corresponds to the name of the linked container.

Finally, the image expects you to mount a volume to `/migrations` to store migrations.

### shmig usage

The default `CMD` of this image is `up`. If you want to run other commands, append the following options to your `docker run` or `docker-compose run`:

- `create my-migration` creates a new migration with the name `my-migration`
- `up` run your migrations
- `down` revert your migrations

The complete documentation of shmig is available at [`https://github.com/naquad/shmig`](https://github.com/naquad/shmig)
