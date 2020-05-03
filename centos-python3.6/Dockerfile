
# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM centos:7

## Core OS and dependencies install & configure
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install epel-release 
RUN	yum -y install python3-pip centos-release-scl rh-python36 scl-utils python3-setuptools python3-libs python36 python36-devel python36-chardet python36-idna python36-pysocks python36-six python36-urllib3 python36-requests  \  
	nmap-ncat \
	python-pip \
	python-devel \
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
	

RUN pip3 install --upgrade pip

RUN yum install -y gcc-c++ gcc make gcc-devel libtool
RUN pip3 install --upgrade pip setuptools  
RUN pip3 install  'wheel'
RUN pip3 install 'configparser' 'pandas' 'pymysql' 'mysql-connector-python'
RUN python3 -m pip install 'cryptography'
		
RUN pip3 install pytz  pyOpenSSL ndg-httpsclient pyasn1 celery apache-airflow  flask_bcrypt 
RUN pip3 install --upgrade backports.ssl-match-hostname 

RUN  python3 -m pip install apache-airflow==1.10.10 \
 --constraint https://raw.githubusercontent.com/apache/airflow/1.10.10/requirements/requirements-python3.7.txt
 
RUN pip3 install 'apache-airflow[celery]' 'apache-airflow[rabbitmq]' 'apache-airflow[mysql]' 'apache-airflow[async]' 'apache-airflow[password]' 'apache-airflow[crypto]' 'apache-airflow[kerberos]' 'apache-airflow[jdbc]' 'apache-airflow[docker]'




RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime && \
    localedef --quiet -c -i en_US -f UTF-8 en_US.UTF-8


