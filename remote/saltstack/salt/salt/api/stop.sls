stop_api_container:
  dockerng.stopped:
    - name: {{ salt['pillar.get']('jibjib:lookup:api:container_name') }}
    - stop_timeout: 10
    - error_on_absent: False
