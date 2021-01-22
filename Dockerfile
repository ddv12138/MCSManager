FROM node
RUN echo "docker:x:${dockerGid}:jenkins">>/etc/group \
cd /opt/ && \
wget https://npm.taobao.org/mirrors/node/v12.16.1/node-v12.16.1-linux-x64.tar.gz && \
tar -zxvf node-v12.16.1-linux-x64.tar.gz && \
ln -s /opt/node-v12.16.1-linux-x64/bin/node /usr/bin/node && \
ln -s /opt/node-v12.16.1-linux-x64/bin/npm /usr/bin/npm && \
# apk add git --repository http://nl.alpinelinux.org/alpine/edge/testing/ && \
git clone https://github.com/suwings/mcsmanager.git && \
cd mcsmanager/ && \
npm install
WORKDIR /opt/mcsmanager/
VOLUME /opt/mcsmanager/server/server_core/
VOLUME /usr/bin/docker
VOLUME /var/run/docker.sock
EXPOSE 23333 20010-20200
CMD cd /opt/mcsmanager/ && npm start
