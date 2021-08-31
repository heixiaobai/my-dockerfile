#!/bin/bash
cluster="World2"
command="./dontstarve_dedicated_server_nullrenderer -console -persistent_storage_root /dst -conf_dir world -cluster $cluster -shard Master"
screen -S "dst_$cluster" "$command"