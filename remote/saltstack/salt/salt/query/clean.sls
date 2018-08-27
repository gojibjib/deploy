{% set query = salt['pillar.get']('jibjib:lookup:query') %}

include:
  - .stop

remove_query_image:
  dockerng.image_absent:
    - name: {{ query.image }}

remove_query_dir:
  file.absent:
    name: {{ query.dir }}