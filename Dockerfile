FROM  centos:latest
MAINTAINER welcomejumbo@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum update -y
RUN yum install -y httpd \
 zip \
 unzip
ADD https:https://www.free-css.com/assets/files/free-css-templates/download/page275/the7.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip the7.zip
RUN cp -rvf the7/* .
RUN rm -rf the7 the7.zip
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
