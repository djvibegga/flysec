FROM ubuntu:14.04

RUN apt-get update -y

#install build tools
RUN apt-get install -y \
	gcc \
	autoconf \
	g++ \
	make \
	cmake
	
#install dev tools
RUN apt-get install -y \
	git \
	nmap \
	htop \
        wget \
        nano
        
#install dev libraries
RUN apt-get install -y \
	libboost-thread-dev \
	libboost-system-dev \
	libboost-filesystem-dev \
	libboost-serialization-dev \
	libboost-locale-dev \
	libboost-regex-dev \
	libpthread-workqueue-dev libpthread-workqueue0 libpthread-stubs0-dev \
	libcrypto++-dev \
	libfcgi-dev \
	libpugixml-dev \
        libmysqlclient-dev \
        libcurl4-gnutls-dev

#install SQLAPI proprietary library
RUN mkdir /opt/lib && cd /opt/lib && wget https://www.sqlapi.com/Download/sqlapi_trial.tar.gz \
	&& tar -xvzf sqlapi_trial.tar.gz \
	&& rm sqlapi_trial.tar.gz \
	&& cd SQLAPI \
	&& tar -xvzf binaries-g++-4.8-amd64.tar.gz \
	&& cp -R ./lib/* /lib64 && cp -R ./lib/* /usr/local/lib \
	&& mkdir /usr/local/include/sqlapi \
	&& cp -R ./include/* /usr/local/include/sqlapi \
        && rm -rf /opt/lib/SQLAPI
        
#install library CTPP2 2.8.3
RUN cd /opt/lib && git clone https://github.com/moneymanagerex/ctpp.git \
	&& cd /opt/lib/ctpp && cmake . && make \
	&& mkdir /usr/include/ctpp2 && cp -r include/* /usr/include/ctpp2/ \
	&& cp ctpp2c /usr/bin/ \
	&& cp ctpp2i /usr/bin/ \
	&& cp ctpp2json /usr/bin/ \
	&& cp ctpp2vm /usr/bin/ \
	&& cp simple-compiler /usr/bin/ \
	&& cp simple-vm /usr/bin/ \
	&& cp libctpp2.so.2.8.3 /usr/lib/ \
	&& ln -s /usr/lib/libctpp2.so.2.8.3 /usr/lib/libctpp2.so.2 \
	&& ln -s /usr/lib/libctpp2.so.2 /usr/lib/libctpp2.so \
	&& rm -rf /opt/lib/ctpp
	
        
#build yii-cws library
#RUN cd /opt/lib \
#	&& git clone https://github.com/djvibegga/yii-cws.git \
#	&& cd yii-cws/Release \
#	&& make clean \
#	&& make -f makefile all \
#	&& cp libyii-cws.so /usr/lib

#build flysec app
#RUN cd /opt/src/Debug \
#	&& make clean \
#	&& make -f makefile all

#install nginx webserver
RUN apt-get install -y nginx

#install mysql server & client
RUN apt-get install -y \
	mysql-client-5.6 \
	mysql-server-5.6

#copy configuration files inside the system
COPY docker-entrypoint.sh /
RUN chmod a+x /docker-entrypoint.sh

EXPOSE 80

#entry point
CMD ["/docker-entrypoint.sh"]
