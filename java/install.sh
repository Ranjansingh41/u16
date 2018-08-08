#!/bin/bash -e

echo "================= Installing default-jdk & jre ==================="
apt-get install -q -y  default-jre=2:1.8*
apt-get install -q -y default-jdk=2:1.8*

echo "================= Installing openjdk-10-jdk ==================="
add-apt-repository -y ppa:openjdk-r/ppa
apt-get update
apt-get install -q -y openjdk-10-jdk
update-alternatives --set java /usr/lib/jvm/java-10-openjdk-amd64/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-10-openjdk-amd64/bin/javac
add-apt-repository ppa:maarten-fonville/ppa
apt-get update
apt-get install -y -q icedtea-10-plugin=1.6*
update-alternatives --set javaws /usr/lib/jvm/java-10-openjdk-amd64/jre/bin/javaws

echo "================ Installing oracle-java10-installer ================="
echo oracle-java10-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
add-apt-repository -y ppa:webupd10team/java
apt-get update
apt-get install -y -q oracle-java10-installer
update-alternatives --set java /usr/lib/jvm/java-10-oracle/jre/bin/java
update-alternatives --set javac /usr/lib/jvm/java-10-oracle/bin/javac
update-alternatives --set javaws /usr/lib/jvm/java-10-oracle/jre/bin/javaws
echo 'export JAVA_HOME=/usr/lib/jvm/java-10-oracle' >> /etc/drydock/.env
echo 'export PATH=$PATH:/usr/lib/jvm/java-10-oracle/jre/bin' >> /etc/drydock/.env
