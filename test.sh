#!/bin/sh
set -e
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 500 /imgs/test.jpg /imgs/test-resize.jpg
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 500 /imgs/test.jpg webp:/imgs/test-jpg.webp
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 500 /imgs/test.jpg avif:/imgs/test-jpg.avif
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.png /imgs/test-resize.png
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.png webp:/imgs/test-png.webp
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.png avif:/imgs/test-png.avif
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.heic /imgs/test-resize.heic
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.heic webp:/imgs/test-heic.webp
docker run --rm -v $(pwd)/test:/imgs imagemagick convert -resize 100 /imgs/test.heic avif:/imgs/test-heic.avif
docker run --rm -v $(pwd)/test:/imgs imagemagick convert /imgs/test.pdf /imgs/test-pdf.png
docker run --rm -v $(pwd)/test:/imgs imagemagick convert /imgs/jpg-with-metadata.jpg /imgs/jpg-with-metadata.webp
