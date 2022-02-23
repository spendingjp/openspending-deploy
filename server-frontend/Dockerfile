FROM node:16
LABEL maintainer "TAKANO Mitsuhiro <takano32@gmail.com>"

RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/frontend /server-frontend

RUN cd /openspending-backend/frontend && yarn install

COPY ./docker-entrypoint.sh /
EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint.sh"]
