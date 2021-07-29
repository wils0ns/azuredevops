FROM ubuntu:20.04

ARG AGENT_VERSION=2.189.0


COPY entrypoint.sh /etc/agent/
WORKDIR /etc/agent

RUN groupadd -r adoagent -g 666 && \
  useradd -u 666 -r -g adoagent \
  -d /etc/agent -s /sbin/nologin \
  -c "Azure DevOps Agent user" adoagent && \
  chmod 755 /etc/agent

RUN apt-get update && apt-get install -y wget && \
  wget -O agent.tar.gz https://vstsagentpackage.azureedge.net/agent/${AGENT_VERSION}/vsts-agent-linux-x64-${AGENT_VERSION}.tar.gz && \
  tar xfz agent.tar.gz && \
  rm agent.tar.gz

RUN chmod +x ./*.sh

USER adoagent

ENTRYPOINT [ "./entrypoint.sh" ]
