FROM python:3.8-alpine

ENV B2_VERSION=2.0.2

RUN apk --no-cache --update add bash postgresql-client
RUN pip3 install --no-cache-dir b2==${B2_VERSION}

COPY backup.sh /

CMD ["/backup.sh"]

