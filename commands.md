# Magick commands for compression 
## Thumbnails
magick "./thumbnails/santa_barbara.JPG" -gravity Center -extent 1:1 +repage -resize "400000@" -quality "80%" "./thumbnails/santa_barbara_thumb.jpg"