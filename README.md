[![CI](https://github.com/oittaa/imagemagick-docker/actions/workflows/main.yml/badge.svg)](https://github.com/oittaa/imagemagick-docker/actions/workflows/main.yml)

# imagemagick-docker

## Overview

Delivers the latest version of the [ImageMagick](https://github.com/ImageMagick/ImageMagick) 7 to your environment in a Docker container.

The purpose of this container is to be able to run the latest version of ImageMagick with modern web image formats like [WebP](https://caniuse.com/webp) and [AVIF](https://caniuse.com/avif) in a stable Linux environment.

## Usage

By default, container will run `magick` command.

```
$ docker run --rm -v /your/images:/imgs oittaa/imagemagick convert /imgs/sample.png -resize 100x100 /imgs/resized-sample.avif
```

```
$ docker run --rm -v /your/images:/imgs oittaa/imagemagick identify /imgs/sample.png
```
