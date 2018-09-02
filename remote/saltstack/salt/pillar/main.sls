system:
  lookup:
    pkg:
      required:
        - curl
        - vim
        - wget
        - apt-transport-https
        - ca-certificates
        - software-properties-common
        - python-apt
        - python-pip
    users:
      - ubuntu

docker:
  lookup:
    pkg:
      name: docker-ce
      key_url: https://download.docker.com/linux/ubuntu/gpg
    users:
      - ubuntu

docker-compose:
  lookup:
    version: 1.21.2

jibjib:
  lookup:
    files:
      birds_json: https://raw.githubusercontent.com/gojibjib/voice-grabber/master/meta/birds.json
      model_proto: https://s3-eu-west-1.amazonaws.com/jibjib/model/jibjib_model_serving_v1.tgz 
      mappings: https://s3-eu-west-1.amazonaws.com/jibjib/pickle/mapping_pickles.tgz
    api:
      dir: /jibjib-api
      image: obitech/jibjib-api:1.0.0
      container_name: jibjib-api
      host_port: 8080
    data:
      dir: /jibjib-data
      image: obitech/jibjib-data:1.0.0
      container_name: jibjib-data
      db_name: birds
      collection_name: birds
      host_port: 27017
    query:
      dir: /jibjib-query
      image: obitech/jibjib-query:1.0.0
      container_name: jibjib-query
      host_port: 8081
      pickle_dir: /jibjib-query/data/pickle
    serving:
      dir: /serve
      image: obitech/tensorflow-serving:devel-cpu
      container_name: serving
      host_port: 9000
      model_name: jibjib_model
      ip: localhost
