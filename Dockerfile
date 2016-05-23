FROM python:2.7
MAINTAINER Josh Cadruvi <jcadruvi78@yahoo.com>

RUN apt-get update && apt-get install -y \
        build-essential \
        curl \
        git \
        git-core \
        net-tools \
        vim \
        wget \
        gunicorn \
        supervisor

RUN mkdir -p /opt/docker_flask
WORKDIR /opt/docker_flask
RUN mkdir -p /opt/docker_flask/logs


COPY requirements.txt /opt/docker_flask/
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /opt/docker_flask

EXPOSE 5001

CMD ["supervisord", "-c", "/opt/docker_flask/supervisord.conf"]

