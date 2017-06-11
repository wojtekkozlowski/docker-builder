FROM centos
RUN yum -y update

RUN yum install -y wget
RUN yum install -y telnet
RUN yum install -y which

RUN yum install -y java-1.8.0-openjdk-devel-1:1.8.0.131-3.b12.el7_3.x86_64

RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
RUN yum install -y apache-maven-3.3.3-4.el7

RUN yum -y install mariadb-server
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY configure_mysql.sh /tmp/configure_mysql.sh
CMD /tmp/configure_mysql.sh