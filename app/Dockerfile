FROM node:16 as build-client-frontend

ARG API_URL
ENV API_URL=${API_URL}
RUN cd / && git clone https://github.com/spendingjp/openspending-frontend.git 
RUN ln -s /openspending-frontend /client-frontend

RUN cd /client-frontend && yarn install && yarn generate

FROM node:16 as build-server-frontend

COPY --from=build-client-frontend /client-frontend/dist/ /client-frontend/
ARG API_URL
ENV API_URL=${API_URL}
RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/frontend /server-frontend

RUN cd /server-frontend && yarn install && yarn generate

FROM node:16 as build-server-site

COPY --from=build-server-frontend /client-frontend/ /client-frontend/
COPY --from=build-server-frontend /server-frontend/dist/ /server-frontend/
ARG API_URL
ARG SITE_URL_DOMAIN
ARG SITE_URL_PROTOCOL
ENV API_URL=${API_URL}
ENV SITE_URL_DOMAIN=${SITE_URL_DOMAIN}
ENV SITE_URL_PROTOCOL=${SITE_URL_PROTOCOL}
RUN cd / && git clone https://github.com/spendingjp/openspending-lp.git 
RUN ln -s /openspending-lp /server-site

RUN cd /server-site && yarn install && yarn generate

FROM python:3.8

COPY --from=build-server-site /client-frontend/ /client-frontend/
COPY --from=build-server-site /server-frontend/ /server-frontend/
COPY --from=build-server-site /server-site/dist/ /server-site/

RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/backend /server-backend

RUN cd /server-backend && \
    pip install -U pip && \
    pip install -e '.[prod]'

COPY ./docker-entrypoint.sh /
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
