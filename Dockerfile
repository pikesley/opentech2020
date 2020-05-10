FROM node:stretch

RUN apt-get update && apt-get install -y make

ENV PROJECT opentech2020

WORKDIR /opt/${PROJECT}
COPY ${PROJECT} /opt/${PROJECT}

COPY docker-config/bashrc /root/.bashrc

COPY ./entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint
ENTRYPOINT ["/usr/local/bin/entrypoint"]
