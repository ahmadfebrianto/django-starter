FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /django
COPY . .
RUN pip install -r requirements.txt

RUN adduser --disabled-password --no-create-home django
USER django
