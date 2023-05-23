
########################## 基础软件 ##########################
# 基础命令
# yum update -y
yum install -y lrzsz
yum install -y telnet  # telnet
yum install -y install dos2unix*
yum install net-tools

# wireguard
# yum install -y yum-utils epel-release
# yum-config-manager --setopt=centosplus.includepkgs=kernel-plus --enablerepo=centosplus --save
# sed -e 's/^DEFAULTKERNEL=kernel$/DEFAULTKERNEL=kernel-plus/' -i /etc/sysconfig/kernel
# yum install -y kernel-plus wireguard-tools

# git
yum install -y git

# ssh
ssh-keygen
cat ~/.ssh/id_rsa.pub

# miniconda
cd ~
mkdir soft 2>/dev/null
yum install -y wget
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
# sh Miniconda3-latest-Linux-x86_64.sh
wget https://mirrors.aliyun.com/anaconda/miniconda/Miniconda3-py38_4.9.2-Linux-x86_64.sh
sh Miniconda3-py38_4.9.2-Linux-x86_64.sh
# /usr/local/bin/miniconda3

# python 环境
conda create -n miluo python=3.7

# mysql
cd ~/soft/
wget https://downloads.mysql.com/archives/get/p/23/file/mysql-8.0.32-1.el7.x86_64.rpm-bundle.tar
mkdir mysql
tar -xvf mysql-8.0.32-1.el7.x86_64.rpm-bundle.tar -C mysql
cd mysql
yum install -y openssl-devel
rpm -ivh mysql-community-common-8.0.32-1.el7.x86_64.rpm 
rpm -ivh mysql-community-client-plugins-8.0.32-1.el7.x86_64.rpm 
rpm -e mariadb-libs --nodeps
rpm -ivh mysql-community-libs-8.0.32-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-compat-8.0.32-1.el7.x86_64.rpm
rpm -ivh  mysql-community-devel-8.0.32-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-8.0.32-1.el7.x86_64.rpm
rpm -ivh mysql-community-icu-data-files-8.0.32-1.el7.x86_64.rpm
yum install -y libaio
rpm -ivh  mysql-community-server-8.0.32-1.el7.x86_64.rpm
systemctl start mysqld
pwd=`cat /var/log/mysqld.log|grep root@localhost | awk -F ":" '{print $NF}'`
echo $pwd

# mysql -u root -p"${pwd}"
# ALTER  USER  'root'@'localhost'  IDENTIFIED BY 'MySQL_123';
# create user 'test'@'%' IDENTIFIED WITH mysql_native_password BY 'MySQL_123';
# grant all on *.* to 'test'@'%';
# grant all on *.* to 'root'@'%';

# java 20
cd ~/soft/
wget https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.rpm
rpm -ivh jdk-20_linux-x64_bin.rpm

# maven
cd ~/soft/
wget https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz --no-check-certificate
tar -zvxf apache-maven-3.9.2-bin.tar.gz -C /usr/local/bin
echo "PATH=$PATH:/usr/local/bin/apache-maven-3.9.2/bin" >> ~/.bash_profile
echo "export PATH" >> ~/.bash_profile
source ~/.bash_profile
mvn -v

# nginx
yum install -y gcc
yum install -y pcre-devel
yum install -y zlib zlib-devel
cd ~/soft/
wget http://nginx.org/download/nginx-1.24.0.tar.gz
tar -xzvf nginx-1.24.0.tar.gz -C .
cd nginx-1.24.0
./configure --prefix=/usr/local/nginx
make && make install
/usr/local/nginx/sbin/nginx

# docker


# redis


# node.js


# tomcat
cd ~/soft/
wget https://dlcdn.apache.org/tomcat/tomcat-10/v10.1.9/bin/apache-tomcat-10.1.9.tar.gz
tar -zxvf apache-tomcat-10.1.9.tar.gz -C /usr/local
# 在/etc/profile添加：
export TOMCAT_HOME=/usr/local/apache-tomcat-10.1.9
export PATH=$TOMCAT_HOME/bin:$PATH
export JAVA_HOME=/usr/java/jdk-20
# /etc/proile << EOF
# export TOMCAT_HOME=/usr/local/apache-tomcat-10.1.9
# export PATH=$TOMCAT_HOME/bin:$PATH
# EOF
startup.sh
curl localhost:8080