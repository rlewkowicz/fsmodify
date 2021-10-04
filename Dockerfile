FROM node:14.17-slim

WORKDIR /

RUN apt update && apt install bash wget curl -y

RUN npm -g install gulp 
RUN npm install gulp 

COPY gulpfile.js /gulpfile.js
COPY prep.sh /prep.sh
COPY wrap.sh /wrap.sh
COPY control.sh /control.sh

ENTRYPOINT [ "sh", "-c", "/control.sh && gulp watch" ]
