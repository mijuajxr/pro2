FROM python:3.11-slim

ARG BLUTTER_REPOSITORY=https://github.com/dedshit/blutter-termux.git
ARG BLUTTER_REF=main

RUN apt-get update && apt-get install -y --no-install-recommends git cmake ninja-build build-essential pkg-config libicu-dev libcapstone-dev libfmt-dev unzip curl ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone --depth 1 --branch "$BLUTTER_REF" "$BLUTTER_REPOSITORY" blutter
WORKDIR /opt/blutter
RUN pip install --no-cache-dir requests pyelftools

COPY scripts/entrypoint.sh /usr/local/bin/blutter-run
RUN chmod +x /usr/local/bin/blutter-run

ENTRYPOINT ["/usr/local/bin/blutter-run"]
