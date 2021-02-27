#!/bin/sh
set -e
latest_tag() {
    printf "%s" "$(git ls-remote --tags --exit-code --refs "$1" | grep -oP '^[[:xdigit:]]+[[:space:]]+refs\/tags\/\Kv?[0-9\._-]*$' | sort -V | tail -n1)"
}
TAG=$(latest_tag "https://github.com/ImageMagick/ImageMagick.git")
sed -i "s/^ARG IM_VERSION=.*/ARG IM_VERSION=${TAG}/" Dockerfile
TAG=$(latest_tag "https://github.com/strukturag/libheif.git")
sed -i "s/^ARG LIB_HEIF_VERSION=.*/ARG LIB_HEIF_VERSION=${TAG}/" Dockerfile
TAG=$(latest_tag "https://aomedia.googlesource.com/aom")
sed -i "s/^ARG LIB_AOM_VERSION=.*/ARG LIB_AOM_VERSION=${TAG}/" Dockerfile
