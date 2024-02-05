# CentOS 7 + ShellInABox

FROM andrefernandes/docker-centos7-base

MAINTAINER Andre Fernandes

WORKDIR /opt

RUN yum install -y openssl sudo shellinabox --enablerepo=epel && \
    yum install -y passwd && \
    yum clean all
    
RUN useradd -u 5001 -G users -m root && \
    echo "Kantutbau-0000" | passwd root --stdin && \
    sed -i '/pam_loginuid.so/c\#session    required     pam_loginuid.so' /etc/pam.d/login && \
    sed -i '/pam_loginuid.so/c\#session    required     pam_loginuid.so' /etc/pam.d/remote
    
ENV USERPWD password
RUN useradd -u 5001 -G users -m user && \
    echo "$USERPWD" | passwd user --stdin && \
    sed -i '/pam_loginuid.so/c\#session    required     pam_loginuid.so' /etc/pam.d/login && \
    sed -i '/pam_loginuid.so/c\#session    required     pam_loginuid.so' /etc/pam.d/remote

#USER user

EXPOSE 4200

WORKDIR /tmp

ADD startshell.sh /opt/startshell.sh
ADD black-on-white.css /usr/share/shellinabox/black-on-white.css

CMD /opt/startshell.sh

