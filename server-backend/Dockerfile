FROM python:3.8

RUN cd / && git clone https://github.com/spendingjp/openspending-backend.git 
RUN ln -s /openspending-backend/backend /server-backend

RUN cd /server-backend && \
    pip install -U pip && \
    pip install -e '.[prod]'

COPY ./docker-entrypoint.sh /
EXPOSE 8000
ENTRYPOINT ["/docker-entrypoint.sh"]
