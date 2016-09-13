
FROM centos:6.6
MAINTAINER Andrii Petruk <andrey.petruk@gmail.com>

# add epel
RUN rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# java
RUN curl -LO 'http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.rpm' -H 'Cookie: oraclelicense=accept-securebackup-cookie'
RUN rpm -i jdk-7u51-linux-x64.rpm
RUN rm jdk-7u51-linux-x64.rpm
ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin


# get unzip and knox
RUN yum install -y unzip
RUN mkdir /tmp/knox
RUN cd /tmp/knox && curl -o knox-0.9.1.zip http://www-us.apache.org/dist/knox/0.9.1/knox-0.9.1.zip 
RUN cd /tmp/knox && unzip -x knox-0.9.1.zip && mv knox-0.9.1 /opt/knox
RUN useradd -c 'Knox user' -m -d /opt/knox -s /bin/bash knox
RUN chown -R knox.knox /opt/knox
RUN mv /opt/knox/conf/topologies /opt/knox/conf/topologies.org

# set knox gateway home, add to path
ENV GATEWAY_HOME /opt/knox
ENV PATH $PATH:$GATEWAY_HOME/bin

# bootstrap-knox
ADD bootstrap-knox.sh /etc/bootstrap-knox.sh
RUN chown root:root /etc/bootstrap-knox.sh
RUN chmod 700 /etc/bootstrap-knox.sh

CMD ["/etc/bootstrap-knox.sh", "-d"]
