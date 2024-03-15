FROM python:3.10-slim-buster

ENV VERSION=1.0

RUN apt-get update && apt-get install -y \
    build-essential 

WORKDIR /usr/src/app

COPY Docker/requirements.txt ./

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


EXPOSE 4000

CMD ["/bin/bash"]
