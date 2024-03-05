FROM python:3.10-slim-buster

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --upgrade pip && \
    pip install -r requirements.txt


EXPOSE 4000

CMD ["/bin/bash"]
