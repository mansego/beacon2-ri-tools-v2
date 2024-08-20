FROM python:3.11-buster AS build

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE=1

WORKDIR /usr/src/app

RUN apt-get update
#RUN apt-get upgrade -y
RUN apt-get install -y --no-install-recommends \
    ca-certificates pkg-config make \
    libssl-dev libffi-dev libpq-dev
COPY . .
COPY ./requirements.txt .
RUN pip install --upgrade pip
RUN pip install wheel setuptools pip --upgrade
RUN pip install -r requirements.txt
ENTRYPOINT ["tail", "-f", "/dev/null"]