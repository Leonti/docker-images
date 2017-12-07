FROM alpine:3.7

MAINTAINER https://github.com/Leonti

#install dependencies
RUN apk add --update ca-certificates wget curl
RUN update-ca-certificates
RUN apk add openjdk8-jre-base bash
RUN apk add --update openjdk8
ENV JAVA_HOME /usr/lib/jvm/default-jvm

# sbt
ENV SBT_VERSION=1.0.4
ENV SBT_HOME=/usr/share/sbt

WORKDIR /usr/share
RUN wget -O sbt.tgz https://github.com/sbt/sbt/releases/download/v${SBT_VERSION}/sbt-${SBT_VERSION}.tgz
RUN tar xvf sbt.tgz
RUN ls
RUN ln -s "${SBT_HOME}/bin/"* "/usr/bin/"

RUN rm sbt.tgz

WORKDIR /

COPY wait_for_it.sh wait_for_it.sh

ENTRYPOINT ["sh", "/wait_for_it.sh"]
