FROM ubuntu:20.04

ARG AGENT_VERSION=2.189.0

ENV DEBIAN_FRONTEND=noninteractive

COPY entrypoint.sh /etc/agent/
WORKDIR /etc/agent

RUN apt-get update && apt-get install -y \
  software-properties-common \
  wget \
  libcurl4 \
  git \
  petname && \
  wget -O libicu.deb  http://ftp.us.debian.org/debian/pool/main/i/icu/libicu69_69.1-2_amd64.deb  && \
  dpkg -i libicu.deb && \
  wget -O agent.tar.gz https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
  tar xfz agent.tar.gz && \
  rm libicu.deb agent.tar.gz

RUN groupadd -r adoagent -g 666 && \
  useradd -u 666 -r -g adoagent \
  -d /etc/agent -s /sbin/nologin \
  -c "Azure DevOps Agent user" adoagent && \
  chown adoagent:adoagent /etc/agent

RUN chmod -R 755 .
RUN chmod +x ./*.sh

USER adoagent

ENTRYPOINT [ "./entrypoint.sh" ]
