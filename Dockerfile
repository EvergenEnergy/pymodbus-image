# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

WORKDIR /

EXPOSE 8080
EXPOSE 5020

RUN pip3 install --no-cache-dir pymodbus[repl]==3.1.0

CMD [ "pymodbus.server", "--host", "0.0.0.0", "--web-port", "8080", "--verbose", "--no-repl", "run", "--modbus-port", "5020", "--modbus-server", "tcp" ]
