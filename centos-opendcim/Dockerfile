# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM centos:7
ENV OPENDCIM_HOME /opt/OPENDCIM
## Core OS and dependencies install & configure
RUN yum -y update
RUN yum -y install epel-release
RUN yum install -y http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum-config-manager --enable remi-php73
RUN yum install -y php-curl gcc perl-modules make php perl libapache2-mod-perl2 libapache2-mod-php libio-compress-perl libxml-simple-perl libdbi-perl libdbd-mysql-perl libapache-dbi-perl libsoap-lite-perl libnet-ip-perl php-mysql php-gd php-dev php-mbstring php-soap php-xml php-pclzip libarchive-zip-perl php-zip perl-Switch perl-CPAN perl-YAML perl-Plack perl-Mojolicious php-gd  php-common  php-pecl-zip  php php-mcrypt php-cli php-gd php-curl php-mysql php-PHPMailer php-ldap php-zip php-fileinfo php-curl php-mbstring php-soap php-xml mod_perl perl-XML-Entities perl-Apache2-SOAP perl-Mojolicious-Lite dmidecode pciutils make gcc gcc-c++ perl-XML-Simple perl-Net-IP  perl-Digest-MD5 perl-Net-SSLeay perl-Data-UUID perl-LWP-UserAgent-DNS-Hosts perl-Compress-LZ4 perl-devel perl-IO-Socket-SSL perl-Crypt-SSLeay perl-LWP-Protocol-https perl-Proc-Daemon perl-Proc-PID perl-Net-SNMP perl-Net-Netmask perl-Nmap-Parser perl-Module-Install perl-Net-CUPS perl-Parse-EDID nmap  perl-Crypt-SSLeay perl-Net-SNMP perl-Proc-Daemon perl-Proc-PID-File perl-Sys-Syslog pciutils smartmontools monitor-edid
RUN yum -y install gcc gcc-c++ libffi-devel \
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
	libtool \
	make
RUN rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Kolkata /etc/localtime 

RUN mkdir -p $OPENDCIM_HOME/entrypoint.d
ADD entrypoint.d/* ${OPENDCIM_HOME}/entrypoint.d/
ADD entrypoint.sh ${OPENDCIM_HOME}/entrypoint.sh
RUN chmod +x $OPENDCIM_HOME/entrypoint.sh \
    && chmod +x $OPENDCIM_HOME/entrypoint.d/*

RUN mkdir -p $OPENDCIM_HOME/app_files
ADD app_files/* ${OPENDCIM_HOME}/app_files/
RUN cp -rf $OPENDCIM_HOME/app_files/httpd.conf /etc/httpd/conf/httpd.conf
RUN cp -rf $OPENDCIM_HOME/app_files/index.html /var/www/html/

ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8


EXPOSE 80 443
WORKDIR ${OPENDCIM_HOME}
ENTRYPOINT ["/bin/bash"]
