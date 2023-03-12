FROM python:3.11.2-alpine3.17 

WORKDIR /app

COPY requirements.txt /app/

RUN apk update \
    && apk add --no-cache mariadb-connector-c-dev build-base \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del build-base

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]