FROM ubuntu
CMD /bin/bash
MAINTAINER Stu Cunliffe,UK s_cunliffe@uk.ibm.com
RUN apt-get update
RUN apt-get install -y npm
RUN mkdir -p /usr/src/node-red
COPY ./motd /etc/motd
WORKDIR /usr/src/node-red
RUN groupadd --force node-red
RUN useradd --home /usr/src/node-red --gid node-red node-red
RUN chown -R node-red:node-red /usr/src/node-red
USER node-red
RUN npm install node-red
EXPOSE 1880/tcp
COPY ./package.json /usr/src/node-red/package.json
CMD npm start node-red
