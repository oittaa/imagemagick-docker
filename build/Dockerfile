FROM debian:bullseye-slim

ARG IM_VERSION=7.1.0-17
ARG LIB_HEIF_VERSION=v1.12.0
ARG LIB_AOM_VERSION=v3.2.0
ARG IM_GIT=https://github.com/ImageMagick/ImageMagick.git
ARG LIB_HEIF_GIT=https://github.com/strukturag/libheif.git
ARG LIB_AOM_GIT=https://aomedia.googlesource.com/aom
ARG BUILD_DIR=/build
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR $BUILD_DIR
RUN apt-get -y update && \
    # Build tools
    apt-get install -y autoconf g++ gcc git make pkg-config \
    # libaom
    cmake yasm \
    # libheif
    libde265-0 libde265-dev libjpeg62-turbo libjpeg62-turbo-dev libtool libx265-dev x265 \
    # ImageMagick
    ghostscript libgomp1 libjpeg62-turbo libjpeg62-turbo-dev libpng16-16 libpng-dev libtiff-dev libwebp6 libwebp-dev libwebpdemux2 libwebpmux3 libxml2-dev libxml2-utils && \
    # Building libaom
    git clone --branch ${LIB_AOM_VERSION} --depth 1 --shallow-submodules --recurse-submodules ${LIB_AOM_GIT} && \
    mkdir build_aom && \
    cd build_aom && \
    cmake ../aom/ -DENABLE_TESTS=0 -DBUILD_SHARED_LIBS=1 && make && make install && \
    ldconfig /usr/local/lib && \
    cd $BUILD_DIR && \
    # Building libheif
    git clone --branch ${LIB_HEIF_VERSION} --depth 1 --shallow-submodules --recurse-submodules ${LIB_HEIF_GIT} && \
    cd libheif && \
    ./autogen.sh && ./configure && make && make install &&  \
    ldconfig /usr/local/lib && \
    cd $BUILD_DIR && \
    # Building ImageMagick
    git clone --branch ${IM_VERSION} --depth 1 --shallow-submodules --recurse-submodules ${IM_GIT} && \
    cd ImageMagick && \
    ./configure --without-magick-plus-plus --disable-docs --disable-static && \
    make && make install && \
    ldconfig /usr/local/lib && \
    # Cleanup
    cd / && \
    apt-get remove --autoremove --purge -y gcc make cmake g++ yasm git autoconf pkg-config build-essential '*-dev' && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf $BUILD_DIR

ENTRYPOINT ["magick"]
