{% set api = salt['pillar.get']('jibjib:lookup:api') %}

include:
  - .stop

remove_api_image:
  dockerng.image_absent:
    - name: {{ api.image }}

remove_api_dir:
  file.absent:
    name: {{ api.dir }}