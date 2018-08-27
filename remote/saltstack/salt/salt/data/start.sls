{% set data = salt['pillar.get']('jibjib:lookup:data') %}
{% set data_root_user = salt['pillar.get']('data_root_user:user') %}
{% set data_root_pw = salt['pillar.get']('data_root_user:pw') %}
{% set data_read_user = salt['pillar.get']('data_read_user:user') %}
{% set data_read_pw = salt['pillar.get']('data_read_user:pw') %}

ensure_data_dir:
  file.directory:
    - name: {{ data.dir }}/data
    - makedirs: True

ensure_latest_data_image:
  dockerng.image_present:
    - name: {{ data.image }}
    - force: True

start_data_container:
  dockerng.running:
    - name: {{ data.container_name }}
    - image: {{ api.image }}
    - force: True
    - environment:
      - ROOT_USER={{ data_root_user }}
      - ROOT_PW={{ data_root_pw }}
      - READ_USER={{ data_read_user }}
      - READ_PW={{ data_read_pw }}
      - DB={{ data.db_name }}
    - port_bindings:
      - {{ api.host_port }}:8080
    - binds:
      - {{ data.dir }}/data:/data/db
    - entrypoint: "/initdb/docker-entrypoint.sh"
    - command: "mongod --config /etc/mongo/mongod.conf --auth"
    - restart_policy: always