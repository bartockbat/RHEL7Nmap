FROM registry.access.redhat.com/rhel7:latest
#Maintainer
MAINTAINER Glen Millard "gmillard@redhat.com"

#
#Install the necessities - satisfy the label requirements
LABEL name="rhel72/nmap"
LABEL vendor="Glen"
LABEL release="0.01"
LABEL version="oss"

#Copy the help file - atomic help
COPY help.1 /
RUN mkdir /licenses
COPY license /licenses

#satisfy the run and stop label
LABEL stop docker stop IMAGE
LABEL run='docker run -tdi --name ${NAME} -u 123456 ${IMAGE}' 

#Expose TCP ports - satisfy expose_ports

EXPOSE 80

#Install Nmap

RUN yum -y install nmap

#Satisfy all updates, security etc
RUN yum -y update-minimal --disablerepo "*" --enablerepo rhel-7-server-rpms --setopt=tsflags=nodocs \
      --security --sec-severity=Important --sec-severity=Critical 

RUN yum clean all -y
