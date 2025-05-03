FROM ubuntu AS builder-base

ARG MAKEMKV_VERSION=1.18.1
ARG FFMPEG_VERSION=7.1.1
ARG MAKEMKV_OSS_URL=https://www.makemkv.com/download/makemkv-oss-${MAKEMKV_VERSION}.tar.gz
ARG MAKEMKV_BIN_URL=https://www.makemkv.com/download/makemkv-bin-${MAKEMKV_VERSION}.tar.gz
ARG FFMPEG_URL=https://ffmpeg.org/releases/ffmpeg-${FFMPEG_VERSION}.tar.xz

WORKDIR /sources

RUN apt -y update && apt -y install \
    build-essential \
    pkg-config \
    libc6-dev \
    libssl-dev \
    libexpat1-dev \
    libavcodec-dev \
    libgl1-mesa-dev \
    qtbase5-dev \
    zlib1g-dev \
    autoconf \
    automake \
    cmake \
    git-core \
    libass-dev \
    libfreetype6-dev \
    libgnutls28-dev \
    libmp3lame-dev \
    libsdl2-dev \
    libtool \
    libva-dev \
    libvdpau-dev \
    libvorbis-dev \
    libxcb1-dev \
    libxcb-shm0-dev \
    libxcb-xfixes0-dev \
    meson \
    ninja-build \
    texinfo \
    wget \
    yasm \
    nasm \
    libx264-dev \
    libx265-dev libnuma-dev \
    libvpx-dev \
    libfdk-aac-dev \
    libopus-dev \
    libdav1d-dev

ADD ${MAKEMKV_OSS_URL} makemkv-oss.tar.gz
ADD ${MAKEMKV_BIN_URL} makemkv-bin.tar.gz
ADD ${FFMPEG_URL} ffmpeg.tar.xz

RUN tar -xzf makemkv-oss.tar.gz && mv makemkv-oss-${MAKEMKV_VERSION} makemkv-oss
RUN tar -xzf makemkv-bin.tar.gz && mv makemkv-bin-${MAKEMKV_VERSION} makemkv-bin
RUN tar -xf ffmpeg.tar.xz && mv ffmpeg-${FFMPEG_VERSION} ffmpeg

FROM builder-base AS builder-ffmpeg
COPY --from=builder-base /sources/ffmpeg /ffmpeg/
WORKDIR /ffmpeg
RUN ./configure \
      --prefix="./dist" \
      --enable-gpl \
      --enable-gnutls \
      --enable-libass \
      --enable-libfdk-aac \
      --enable-libfreetype \
      --enable-libmp3lame \
      --enable-libopus \
      --enable-libdav1d \
      --enable-libvorbis \
      --enable-libvpx \
      --enable-libx264 \
      --enable-libx265 \
      --enable-nonfree \
      --enable-static \
      --disable-shared \
      --enable-pic \
    && make \
    && make install

FROM builder-base AS builder-makemkv
COPY --from=builder-base /sources/makemkv-oss /makemkv-oss/
COPY --from=builder-base /sources/makemkv-bin /makemkv-bin/
COPY --from=builder-ffmpeg /ffmpeg/dist /ffmpeg/dist
WORKDIR /makemkv-oss
ENV PKG_CONFIG_PATH=/ffmpeg/dist/lib/pkgconfig
RUN  ./configure && make && make install

WORKDIR /makemkv-bin
RUN apt -y update && apt -y install jq
RUN echo yes > yes
RUN make < yes
RUN make install
COPY parseinfo.sh /usr/bin/parseinfo
RUN chmod a+x /usr/bin/parseinfo
#RUN install -d /usr/share/MakeMKV
#RUN install -d /usr/bin
#RUN install -t /usr/bin bin/$ARCH/makemkvcon
#RUN install -m 644 -t /usr/share/MakeMKV src/share/appdata.tar
#RUN install -m 644 -t /usr/share/MakeMKV src/share/blues.jar
#RUN install -m 644 -t /usr/share/MakeMKV src/share/blues.policy
WORKDIR /
ENTRYPOINT ["/usr/bin/makemkvcon"]
VOLUME ["/rips"]