stop_serving_container:
  dockerng.stopped:
    - name: {{ salt['pillar.get']('jibjib:lookup:serving:container_name') }}
    - stop_timeout: 10
    - error_on_absent: False
