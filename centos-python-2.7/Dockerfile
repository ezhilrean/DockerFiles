
# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM centos:7

## Core OS and dependencies install & configure
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release 
RUN	yum -y install python-pip gcc gcc-c++ libffi-devel  python-setuptools python-libs python python-devel    \  
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

RUN pip install --upgrade pip

RUN yum install -y gcc-c++ gcc make  libtool
RUN pip install --upgrade pip setuptools  
RUN pip install  'wheel'
RUN pip install 'configparser' 'pandas' 'pymysql' 'mysql-connector-python'
RUN python -m pip install 'cryptography'
	

 
RUN pip install MySQL-python
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8

