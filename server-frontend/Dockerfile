FROM node:16

RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/frontend /server-frontend

RUN cd /server-frontend && yarn install

COPY ./docker-entrypoint.sh /
EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint.sh"]
