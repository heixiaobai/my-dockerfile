#!/bin/bash
clusters=$*
APPDIR=/dst
CONF_DIR_NAME=world
CONFDIR=$APPDIR/$CONF_DIR_NAME


for cluster in $clusters;
do
    if [ -x $CONFDIR/$cluster/cluster.ini ];then
        command="./dontstarve_dedicated_server_nullrenderer -console -persistent_storage_root $APPDIR -conf_dir $CONF_DIR_NAME -cluster $cluster -shard Master"
        screen -dmS "dst_$cluster" $command
        echo "Screen start: dst_$cluster"
    else
        echo "ERROR: $CONFDIR/$cluster/cluster.ini:  No such file"
    fi 
done

echo $(screen -list dst_)

# TODO 引导启动
function dst_stop(){
    # 向DST Screen会话传入Ctrl + C
    screen -list dst_   |
    grep -i "dst_"      |
    awk '{print $1}'    |
    xargs -I @ screen -S @ -X stuff "^C"
    echo "尝试关闭"
    # 检查DST screen会话是否关闭
    while true;
    do
        if [ "`screen -list |  grep dst`" != "" ];then
            sleep 1
        else
            break
        fi
    done
}

function xxx(){
    echo "SIGTERM!"
}

trap dst_stop SIGTERM

# 前台阻断
while true;do
    if [ "`screen -list | grep dst`" != "" ];then
        echo "sleep..."
        sleep 65535
    else
        break
    fi
done