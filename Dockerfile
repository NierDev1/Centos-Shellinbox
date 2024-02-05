# CentOS 7 + ShellInABox

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

WORKDIR /opt

RUN yum install -y openssl sudo shellinabox --enablerepo=epel && \
    yum install -y passwd && \
    yum clean all

RUN echo "Kantutbau-0000" | passwd root --stdin

EXPOSE 4200

WORKDIR /tmp

ADD startshell.sh /opt/startshell.sh
ADD black-on-white.css /usr/share/shellinabox/black-on-white.css

CMD /opt/startshell.sh

