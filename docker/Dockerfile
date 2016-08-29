FROM openjdk:8-jre-alpine
MAINTAINER Marcel Radischat <marcel@door2door.io>

RUN apk update
RUN apk add wget ca-certificates bashd
RUN update-ca-certificates

#OTP
WORKDIR /otp
RUN wget -O otp-1.0.0-SNAPSHOT.jar https://s3.eu-central-1.amazonaws.com/d2d-otp/otp-1.0.0-SNAPSHOT.jar

ADD logback.xml /otp/logback.xml
ADD run.sh /run.sh
RUN chmod +x /run.sh
EXPOSE 8080

ENTRYPOINT ["/run.sh"]