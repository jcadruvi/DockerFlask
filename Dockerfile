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
RUN mkdir -p /opt/docker_flask/logs

WORKDIR /opt/docker_flask

RUN pip install --upgrade pip

COPY . /opt/docker_flask

EXPOSE 5000

CMD ["python", "app.py"]

