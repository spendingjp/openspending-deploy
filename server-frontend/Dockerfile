FROM node:16
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/frontend /server-frontend

RUN cd /server-frontend && yarn install
