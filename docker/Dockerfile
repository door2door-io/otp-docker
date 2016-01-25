FROM ubuntu:14.04
MAINTAINER Uli Stroetz <uli@allyapp.com>

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0x219BD9C9
RUN echo "deb http://repos.azulsystems.com/ubuntu `lsb_release -cs` main" >> /etc/apt/sources.list.d/zulu.list
RUN apt-get -qq update
RUN apt-get -qqy install zulu-8=8.9.0.4
RUN apt-get install -y wget


RUN echo "[Credentials]" > ~/.boto
RUN echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >>  ~/.boto
RUN echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >>  ~/.boto

RUN curl https://gist.githubusercontent.com/shevron/6204349/raw/cw-monitor-memusage.py | sudo tee /usr/local/bin/cw-monitor-memusage.py

RUN chmod +x /usr/local/bin/cw-monitor-memusage.py
RUN echo "* * * * * ec2-user /usr/local/bin/cw-monitor-memusage.py" | sudo tee /etc/cron.d/cw-monitor-memusage


#OTP
RUN mkdir /otp
WORKDIR /otp
RUN wget -O otp-0.19.0.jar https://s3.eu-central-1.amazonaws.com/d2d-otp/otp-0.19.0.jar

ADD run.sh /run.sh
RUN chmod +x /*.sh
EXPOSE 8080

CMD ["/run.sh"]
