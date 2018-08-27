{% set api = salt['pillar.get']('jibjib:lookup:api') %}
{% set data = salt['pillar.get']('jibjib:lookup:data') %}
{% set query = salt['pillar.get']('jibjib:lookup:query') %}
{% set data_read_user = salt['pillar.get']('data_read_user:user') %}
{% set data_read_pw = salt['pillar.get']('data_read_user:pw') %}
{% set data_ip = salt['pillar.get']('data_ip') %}
{% set query_ip = salt['pillar.get']('query:ip') %}

ensure_latest_api_image:
  dockerng.image_present:
    - name: {{ api.image }}
    - force: True

start_api_container:
  dockerng.running:
    - name: {{ api.container_name }}
    - image: {{ api.image }}
    - force: True
    - environment:
      - JIBJIB_DB_URL={{ data_read_user }}:{{ data_read_pw }}@{{ data_ip }}/{{ data.collection_name }}
      - JIBJIB_MODEL_URL=http://{{ query_ip }}:{{ query.host_port }}
    - port_bindings:
      - {{ api.host_port }}:8080
    - restart_policy: always
