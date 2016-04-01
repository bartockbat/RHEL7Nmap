FROM registry.access.redhat.com/rhel7:latest
#Maintainer
MAINTAINER Glen Millard "gmillard@redhat.com"

#
#Install the necessities

RUN yum clean all -y
RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install git

#Install Nmap

RUN yum -y install nmap
