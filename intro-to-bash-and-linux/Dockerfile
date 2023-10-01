FROM ubuntu:latest

RUN apt update

RUN DEBIAN_FRONTEND=noninteractive apt install ubuntu-minimal ubuntu-standard vim openssl openssh-server -y

COPY sshd_config /etc/ssh/sshd_config

EXPOSE 2222

RUN mkdir /run/sshd

COPY init.sh /init.sh
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /init.sh
RUN chmod +x /entrypoint.sh
RUN /init.sh

ENTRYPOINT ["/entrypoint.sh"]
