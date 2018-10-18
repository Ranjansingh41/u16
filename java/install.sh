#!/bin/bash -e

export ORACLEJDK_VERSION=11
echo "================ Installing oracle-java"$ORACLEJDK_VERSION"-installer ================="
mkdir -p /usr/lib/jvm && cd /usr/lib/jvm
wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/11+28/55eed80b163941c8885ad9298e6d786a/jdk-"$ORACLEJDK_VERSION"_linux-x64_bin.tar.gz
tar -xzf jdk-"$ORACLEJDK_VERSION"_linux-x64_bin.tar.gz
mv jdk-"$ORACLEJDK_VERSION"/ java-"$ORACLEJDK_VERSION"-oraclejdk-amd64
echo "export JAVA_HOME=/usr/lib/jvm/java-${ORACLEJDK_VERSION}-oraclejdk-amd64" >> /etc/drydock/.env
echo "export PATH=\$PATH:/usr/lib/jvm/java-${ORACLEJDK_VERSION}-oraclejdk-amd64/bin" >> /etc/drydock/.env

sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-"$ORACLEJDK_VERSION"-oraclejdk-amd64/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/java-"$ORACLEJDK_VERSION"-oraclejdk-amd64/bin/javac 1

export OPENJDK_VERSION=11
echo "================ Installing openjdk"$OPENJDK_VERSION"-installer ============================="
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt install -y openjdk-"$OPENJDK_VERSION"-jdk --allow-unauthenticated
