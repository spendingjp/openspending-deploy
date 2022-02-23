FROM node:16
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

RUN cd / && git clone https://github.com/spendingjp/openspending-frontend.git 
RUN ln -s /openspending-frontend /client-frontend
RUN cd /client-frontend && yarn install
