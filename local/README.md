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

Change the default users and passwords in `db.env`. Leave the `DB` value by its default, unless you have manually changed that value during the [jibjib-data](https://github.com/jibjib-data) build.

Next you can start the stack with:

```
docker-compose up -d
```