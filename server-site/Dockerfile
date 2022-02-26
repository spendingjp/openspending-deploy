FROM node:16

RUN cd / && git clone https://github.com/spendingjp/openspending-lp.git 
RUN ln -s /openspending-lp /server-site

RUN cd /server-site && yarn install

COPY ./docker-entrypoint.sh /
EXPOSE 3000
ENTRYPOINT ["/docker-entrypoint.sh"]
