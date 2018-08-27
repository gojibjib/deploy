{% set serving = salt['pillar.get']('jibjib:lookup:serving') %}

ensure_serving_directory:
  file.directory:
    - name: {{ serving.dir }}

fetch_and_extract_model:
  archive.extracted:
    - source: {{ salt['pillar.get']('jibjib:lookup:files:model_proto') }}
    - name: {{ serving.dir }}
    - skip_verify: True

ensure_latest_serving_image:
  dockerng.image_present:
    - name: {{ serving.image }}

start_serving_container:
  dockerng.running:
    - name: {{ serving.container_name }}
    - image: {{ serving.image }}
    - force: True
    - binds:
      - {{ serving.dir }}:/serve
    - port_bindings:
      - {{ serving.host_port }}:9000
    - command: "tensorflow_model_server --port=9000 --model_name={{ serving.model_name }} --model_base_path=/serve/{{ serving.model_name }}"
    - restart_policy: always