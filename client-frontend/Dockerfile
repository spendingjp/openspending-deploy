FROM node:16

RUN cd / && git clone https://github.com/spendingjp/openspending-frontend.git 
RUN ln -s /openspending-frontend /client-frontend

RUN cd /client-frontend && yarn install

COPY ./docker-entrypoint.sh /
EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint.sh"]
