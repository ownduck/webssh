FROM python:3.10.5-alpine3.16

LABEL maintainer='<author>'
LABEL version='0.0.0-dev.0-build.0'

ADD . /service
WORKDIR /service
RUN \
  apk add --no-cache libc-dev libffi-dev gcc && \
  pip install -r requirements.txt --no-cache-dir && \
  apk del gcc libc-dev libffi-dev && \
  addgroup webssh && \
  adduser -Ss /bin/false -g webssh webssh && \
  chown -R webssh:webssh /service

EXPOSE 8888/tcp
USER webssh
CMD ["/usr/local/bin/python", "/service/run.py"]
