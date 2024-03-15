FROM python:3.13.0a5-alpine3.19

ENV VERSION=1.0

WORKDIR /usr/src/app


COPY Docker/requirements.txt ./

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


EXPOSE 4000

CMD ["/bin/bash"]
