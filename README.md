# [gojibjib/deploy](https://github.com/gojibjib/deploy)

This repository holds intrusctions to deploy the JibJib stack.

## Repo layout
The complete list of JibJib repos is:

- [jibjib](https://github.com/gojibjib/jibjib): Our Android app. Records sounds and looks fantastic.
- [deploy](https://github.com/gojibjib/deploy): Instructions to deploy the JibJib stack.
- [jibjib-api](https://github.com/gojibjib/jibjib-api): Main API to receive database requests & audio files.
- [jibjib-data](https://github.com/gojibjib/jibjib-data): A MongoDB instance holding information about detectable birds.
- [jibjib-query](https://github.com/gojibjib/jibjib-query): A thin Python Flask API that handles communication with the [TensorFlow Serving](https://www.tensorflow.org/serving/) instance.


## Setup

First clone the repo:

```
git clone https://github.com/gojibjib/deploy
```

Then choose how you wish to deploy it:

- [Locally](https://github.com/gojibjib/deploy/tree/master/local), via [docker-compose](https://docs.docker.com/compose/)
- Remotely, to AWS via [Terraform](https://www.terraform.io/) and [SaltStack](https://saltstack.com/)