# VERSION 0.1.0
# AUTHOR: Ezhillarasan

FROM centos8_opendcim_upt:latest

## Core OS and dependencies install & configure
RUN yum -y update
EXPOSE 80
CMD ["-D", "FOREGROUD"]
ENTRYPOINT ["/usr/sbin/httpd"]

