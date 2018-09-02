{% set data = salt['pillar.get']('jibjib:lookup:data') %}

include:
  - .stop

remove_data_image:
  dockerng.image_absent:
    - name: {{ data.image }}
    - force: True
    
remove_data_dir:
  file.absent:
    - name: {{ data.dir }}