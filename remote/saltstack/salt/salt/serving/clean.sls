{% set serving = salt['pillar.get']('jibjib:lookup:serving') %}

include:
  - .stop

remove_serving_image:
  dockerng.image_absent:
    - name: {{ serving.image }}

remove_serving_dir:
  file.absent:
    name: {{ serving.dir }}