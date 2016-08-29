FROM ubuntu:14.04
MAINTAINER Uli Stroetz <uli@allyapp.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN echo "deb http://repos.azulsystems.com/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list.d/zulu.list
RUN apt-get -qq update
RUN apt-get -qqy install zulu-8=8.9.0.4
RUN apt-get install -y wget

#OTP
WORKDIR /otp
RUN wget -O otp-1.0.0-SNAPSHOT.jar https://s3.eu-central-1.amazonaws.com/d2d-otp/otp-1.0.0-SNAPSHOT.jar

ADD logback.xml /otp/logback.xml
ADD run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8080

CMD ["/run.sh"]
