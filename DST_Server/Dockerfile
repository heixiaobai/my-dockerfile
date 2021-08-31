FROM centos:7

ENV USER root
ENV APPDIR /dst
ENV APPBIN ${APPDIR}/bin
ENV MODEDIR ${APPDIR}/mods
ENV CONFDIR ${APPDIR}/world

WORKDIR ${APPDIR}

VOLUME ${MODEDIR}
VOLUME ${CONFDIR}

# 安装DST相关依赖
RUN yum -y update && \
yum -y install glibc.i686 libstdc++.i686 libcurl.i686 screen && \
yum clean all

# 通过SteamCMD安装DST服务端
RUN mkdir /steam && \
cd /steam && \
curl https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -o steamcmd_linux.tar.gz && \
tar -zxf steamcmd_linux.tar.gz && \
echo -e "login anonymous\nforce_install_dir ${APPDIR}\napp_update 343050 validate\nquit\n" | \
/steam/steamcmd.sh runscript && \
ln -s /usr/lib/libcurl.so.4 ${APPBIN}/lib32/libcurl-gnutls.so.4 && \
cd / && \ 
rm -rf /steam 

# RUN echo '#!/bin/bash \
# CONFDIR="${CONFDIR}" \
# cluster="$1" \
# command="./dontstarve_dedicated_server_nullrenderer -console -persistent_storage_root ${APPDIR} -conf_dir ${CONFDIR} -cluster \$cluster -shard Master" \
# screen -S "dst_\$cluster" "\$command"' > ${APPBIN}/start.sh

COPY start.sh ${APPBIN}

# # Share端口
# EXPOSE 10888

# # Master端口
# EXPOSE 10999

WORKDIR ${APPBIN}

ENTRYPOINT [ "bash", "./start.sh" ]
CMD [ "default" ]
