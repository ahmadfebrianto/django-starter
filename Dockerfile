FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /django
COPY . .

RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .build-deps build-base postgresql-dev musl-dev 
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
RUN apk del .build-deps

RUN adduser --disabled-password --no-create-home django
USER django
