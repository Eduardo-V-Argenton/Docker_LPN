FROM python:3.11.2-alpine3.17 

WORKDIR /app

COPY requirements.txt /app/

RUN apk update \
    && apk add --no-cache mariadb-connector-c-dev build-base \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del build-base

ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_EMAIL=admin@example.com
ENV DJANGO_SUPERUSER_PASSWORD=password
ENV DJANGO_SUPERUSER_NAME=admin

COPY startup.sh /opt
RUN chmod +x /opt/startup.sh

CMD ["sh", "/opt/startup.sh"]