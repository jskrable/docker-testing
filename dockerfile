# TO BUILD:
# docker build . -t test -f dockerfile

FROM ubuntu:latest
MAINTAINER Jack Skrable "https://github.com/jskrable"

RUN apt-get update -y 
 # && apt-get upgrade -y 

# TODO fix the python PATH
RUN apt-get install python3 python3-pip curl unzip openjdk-8-jre -y
RUN echo 'alias python="python3"' >> .bashrc
RUN echo 'alias pip="pip3"' >> .bashrc
RUN cat .bashrc

RUN curl http://apache.osuosl.org/spark/spark-2.4.4/spark-2.4.4-bin-without-hadoop.tgz -o spark-2.4.4-bin-without-hadoop.tgz
RUN curl https://www.apache.org/dist/spark/KEYS -o KEYS
RUN curl https://www.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-without-hadoop.tgz.asc -o spark.asc
RUN gpg --import KEYS
RUN gpg --verify spark.asc spark-2.4.4-bin-without-hadoop.tgz
RUN tar -xvzf spark-2.4.4-bin-without-hadoop.tgz -C /opt
RUN rm -rf spark-2.4.4-bin-without-hadoop.tgz
RUN rm KEYS

RUN curl http://mirror.metrocast.net/apache/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz -o hadoop-3.1.2.tar.gz
RUN curl https://www.apache.org/dist/hadoop/common/KEYS -o KEYS
RUN curl https://www.apache.org/dist/hadoop/common/hadoop-3.1.2/hadoop-3.1.2.tar.gz.asc -o hadoop.asc
RUN gpg --import KEYS
RUN gpg --verify hadoop.asc hadoop-3.1.2.tar.gz
RUN tar -xvzf hadoop-3.1.2.tar.gz -C /opt
RUN rm -rf hadoop-3.1.2.tar.gz
RUN rm KEYS

# TODO fix the ENV variables and symbolic links