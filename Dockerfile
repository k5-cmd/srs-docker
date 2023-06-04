FROM ubuntu:latest

ENV TZ=Asia/Tokyo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -y make git gcc g++ unzip cmake pkg-config autoconf tclsh wget 

# RUN git clone -b 4.0release https://gitee.com/ossrs/srs.git
# RUN wget -q https://github.com/ossrs/srs/archive/refs/heads/4.0release.zip
# RUN unzip 4.0release
# RUN mkdir /usr/local/srs/ 
# RUN mv /srs-4.0release/* /srs-4.0release/.[^\.]* /opt/srs/ 
# RUN cd /usr/local/srs/trunk
# RUN ./configure
# RUN make

WORKDIR /usr/local/srs/trunk
