FROM python:3.10.5-alpine

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV USER=django

WORKDIR /django
COPY . .

RUN buildDeps='gcc python3-dev musl-dev postgresql-dev' \
    && apk update \
    && apk add --no-cache libpq \
    && apk add --virtual temp --no-cache $buildDeps \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del temp

RUN adduser \
    --disabled-password \
    --gecos "" \
    --no-create-home \
    "$USER"

USER $USER

CMD ["python", "manage.py", "runserver", "0.0.0.0:6000"]
