FROM node
ARG dockGid="cut -d: -f3 < <(getent group docker)"
RUN echo "docker:x:${dockerGid}:jenkins">>/etc/group \
cd /opt/ && \
#wget https://npm.taobao.org/mirrors/node/v12.16.1/node-v12.16.1-linux-x64.tar.gz && \
#tar -zxvf node-v12.16.1-linux-x64.tar.gz && \
#ln -s /opt/node-v12.16.1-linux-x64/bin/node /usr/bin/node && \
#ln -s /opt/node-v12.16.1-linux-x64/bin/npm /usr/bin/npm && \
apt-get update && apt-get install openjdk-8-jdk -y &&\
git clone https://gitee.com/Suwingser/MCSManager.git /opt/mcsmanager && \
cd /opt/mcsmanager/ && \
npm install
WORKDIR /opt/mcsmanager/
VOLUME /opt/mcsmanager/server/server_core/
VOLUME /usr/bin/docker
VOLUME /var/run/docker.sock
EXPOSE 23333 20010-20100 10022
CMD cd /opt/mcsmanager/ && npm start
