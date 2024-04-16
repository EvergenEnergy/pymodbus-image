# syntax=docker/dockerfile:1

FROM python:3.9-slim-buster

WORKDIR /pymodbus

EXPOSE 8080
EXPOSE 5020

COPY pymodbus .

RUN pip3 install --no-cache-dir -r requirements.txt && pip3 install --no-cache-dir -e .

CMD [ "pymodbus.server", "--host", "0.0.0.0", "--web-port", "8080", "verbose", "--no-repl", "run", "--modbus-port", "5020", "--modbus-server", "tcp" ]
