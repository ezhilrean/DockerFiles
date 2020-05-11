# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM centos:7

## Core OS and dependencies install & configure
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release
RUN yum -y install python36-pip python36-devel gcc gcc-c++ libffi-devel  python36-setuptools python36-libs python36 python36-pysocks   \
	nmap-ncat \
	krb5-devel \
	cyrus-sasl \
	cyrus-sasl-devel \
	cyrus-sasl-gs2 \
	cyrus-sasl-gssapi \
	cyrus-sasl-lib \
	cyrus-sasl-md5 \
	cyrus-sasl-plain \
	openssl-devel \
	libffi-devel \
	krb5-workstation \
	java-1.8.0-openjdk \
	which \
	cronie-noanacron \
	sudo \
	mariadb-libs \
	mariadb-devel




RUN yum install -y gcc-c++ gcc make gcc-devel libtool
RUN pip3 install --upgrade setuptools
RUN pip3 install  'wheel'
RUN pip3 install 'configparser' 'pandas' 'pymysql' 'mysql-connector-python'
RUN python3.6 -m pip install 'cryptography'



RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8


