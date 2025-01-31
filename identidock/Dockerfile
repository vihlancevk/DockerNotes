FROM python:3.12

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

COPY requirements.txt /
RUN pip install -r requirements.txt

COPY cmd.sh /

COPY app /app
WORKDIR /app

EXPOSE 9090 9191
USER uwsgi

CMD ["/cmd.sh"]
