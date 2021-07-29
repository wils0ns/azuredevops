FROM ado-agent:2.189.0

ENV DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update && apt-get install -y \
  python3 python3-dev python3-pip python3-venv

RUN python3 -m pip install -U \
  pip \
  virtualenv \
  pytest \
  pytest-cov \
  pytest-azurepipelines \
  pylint

USER adoagent
