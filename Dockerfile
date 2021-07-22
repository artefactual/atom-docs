FROM alpine:latest
WORKDIR /etc/

COPY requirements.txt .
RUN mkdir -p Sphinx/build

RUN apk add --no-cache python3 py3-pip make git
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt && \
    pip3 install sphinx-autobuild

CMD sphinx-autobuild -b html --host 0.0.0.0 --port 80 Sphinx/source Sphinx/build
