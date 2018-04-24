FROM ubuntu:16.04


RUN apt-get update
RUN apt-get install -y build-essential python2.7-dev libffi-dev \
                       python-pip python-setuptools sqlite3 \
                       libssl-dev libjpeg-dev libxslt1-dev
RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install https://github.com/matrix-org/synapse/tarball/master

WORKDIR /opt/synapse
ENTRYPOINT "/opt/synapse/run_server.sh"

EXPOSE 8008
