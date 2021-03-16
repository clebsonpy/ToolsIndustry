FROM python:3.8

ENV PYTHONUNBUFFERED 1
ARG DJANGO_ENV
ENV DJANGO_ENV $DJANGO_ENV

WORKDIR /backend

COPY requirements /backend/requirements

RUN apt-get update && apt-get install -y --no-install-recommends wait-for-it && \
    pip install --no-cache-dir -U pip && \
    pip install --no-cache-dir -r requirements/$DJANGO_ENV.txt