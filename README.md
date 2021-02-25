[![CI](https://github.com/oittaa/imagemagick-docker/actions/workflows/main.yml/badge.svg)](https://github.com/oittaa/imagemagick-docker/actions/workflows/main.yml)

# imagemagick-docker

## Overview

Delivers the latest version of the [ImageMagick](https://github.com/ImageMagick/ImageMagick) 7 to your environment in Docker container.

The purpose of that image is to be able to run the latest version of ImageMagick in stable
Linux environment with supporting modern web formats.

## Usage

By default, container will run `magick` command

```
$ docker run --rm -v /your/images:/imgs oittaa/imagemagick convert /imgs/sample.png -resize 100x100 /imgs/resized-sample.png
```

```
$ docker run --rm -v /your/images:/imgs oittaa/imagemagick identify /imgs/sample.png
```
