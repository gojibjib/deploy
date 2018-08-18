# [gojibjib/deploy](https://github.com/gojibjib/deploy)

This repository holds intrusctions to deploy the JibJib stack:

- [jibjib-data](https://github.com/gojibjib/jibjib-data): a custom MongoDB instance with the necessary bird information pre-installed
- [jibjib-query](https://github.com/gojibjib/jibjib-query): a minimal Flask endpoint communicating with a Tensorflow Serving instance to infer the [jibjib-model](https://github.com/gojibjib/jibjib-model)
- [jibjib-api](https://github.com/gojibjib/jibjib-api): an API for users to send audio files to and query the database

## Setup

First clone the repo:

```
git clone https://github.com/gojibjib/deploy
```

Then choose how you wish to deploy it:

- [Locally](https://github.com/gojibjib/deploy/tree/master/local), via [docker-compose](https://docs.docker.com/compose/)
- Remotely, to AWS via [Terraform](https://www.terraform.io/) and [SaltStack](https://saltstack.com/)