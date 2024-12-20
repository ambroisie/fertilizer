FROM python:3.11-slim-buster

WORKDIR /app

COPY pyproject.toml docker_start ./
COPY src src

RUN apt-get update \
  && echo "----- Installing python requirements" \
  && pip install --trusted-host pypi.python.org . \
  && echo "----- Preparing directories" \
  && mkdir /config /data /torrents \
  && echo "----- Cleanup" \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 9713

ENTRYPOINT ["./docker_start"]
