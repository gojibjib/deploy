# [JibJib](https://github.com/gojibjib): Local installation

Install the JibJib stack locally via Docker Compose.

## Prerequisites

- Install [Docker](https://docs.docker.com/install/)
- Install [Docker Compose](https://docs.docker.com/install/)

## Setup 

After you have cloned the repository, enter this folder:

```
cd deploy/local
```

Run `init.sh` to grab external files such as the model:

```
./init.sh
```

Change the default users and passwords in `db.env` to the values you would like to initialize the [jibjib-data](https://github.com/jibjib-data) instance with. Leave the `DB` value by its default, unless you have manually changed that value during the  build. Then export the environment variables:

```
export $(grep -v '^#' db.env | xargs)
``` 

Next you can start the stack:

```
docker-compose up -d
```