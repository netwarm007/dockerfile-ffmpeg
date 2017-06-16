FROM tim03/x264:last_stable
LABEL MAINTAINER Chen, Wenli <chenwenli@chenwenli.com>

ARG VER=snapshot
WORKDIR /usr/src/ffmpeg
RUN \
  curl http://ffmpeg.org/releases/ffmpeg-$VER.tar.xz | tar Jxv --strip-component=1 -f -

RUN \
 ./configure  --prefix=/usr \
 --enable-libx264 --enable-gpl \
 && make && make install && make clean

CMD ["/usr/bin/ffmpeg"]
