FROM ubuntu:latest
MAINTAINER Jack Skrable "https://github.com/jskrable"

RUN apt-get update -y 
 # && apt-get upgrade -y 

RUN apt-get install python3 python3-pip curl unzip openjdk-8-jre -y

RUN curl http://mirror.olnevhost.net/pub/apache/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz -o spark-2.4.4-bin-without-hadoop.tgz
RUN curl https://www.apache.org/dist/spark/KEYS -o KEYS
RUN curl https://www.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz.asc -o spark.asc
RUN gpg --import KEYS
RUN gpg --verify spark.asc spark-2.4.4-bin-without-hadoop.tgz
# RUN sha512sum spark-2.4.4-bin-without-hadoop.tgz | diff spark-sha512 -
RUN tar -xvzf spark-2.4.4-bin-without-hadoop.tgz -C /opt

