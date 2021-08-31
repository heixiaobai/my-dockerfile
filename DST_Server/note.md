./dontstarve_dedicated_server_nullrenderer -console -persistent_storage_root $APPDIR -conf_dir world -cluster Cluster_1 -shard Master
./dontstarve_dedicated_server_nullrenderer -console -persistent_storage_root $APPDIR -conf_dir world -cluster Cluster_1 -shard Caves

https://accounts.klei.com/account/game/servers?game=DontStarveTogether

bind_ip 127.0.0.1 默认
port 10998-11018
player 8 默认
steam_master_server_port
steam_authentication_port

```bash
podman run -d --name dst_server -v /data/dst/mods:/dst/mods -v /data/dst/world:/dst/world -p 10888:10888 localhost/dst
```

podman run -d --name dst_server -v /data/dst/mods:/dst/mods -v /data/dst/world:/dst/world -p 10888:10888/udp -p 10999:10999/udp localhost/dst_tmp

