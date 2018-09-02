{% set query = salt['pillar.get']('jibjib:lookup:query') %}
{% set serving = salt['pillar.get']('jibjib:lookup:serving') %}

ensure_query_dir:
  file.directory:
    - name: {{ query.pickle_dir }}
    - makedirs: True

fetch_and_extract_pickle_file:
  archive.extracted:
    - source: {{ salt['pillar.get']('jibjib:lookup:files:mappings') }}
    - name: {{ query.pickle_dir }}
    - skip_verify: True
    - enforce_toplevel: False

ensure_latest_query_image:
  dockerng.image_present:
    - name: {{ query.image }}
    - force: True

start_query_container:
  dockerng.running:
    - name: {{ query.container_name }}
    - image: {{ query.image }}
    - force: True
    - environment:
      - SERVING_URL={{ serving.ip }}
      - SERVING_PORT={{ serving.host_port }}
    - binds:
      - {{ query.pickle_dir }}:/app/input/pickle
    - port_bindings:
      - {{ query.host_port }}:8081
    