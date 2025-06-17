#!/bin/bash

# Ensure ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick 'magick' not found. Please install it first."
    exit 1
fi

# Settings
input_dir="./uncompressed"
quality=80            # Compression quality (1–100)
resize="50%"         # Resize value (e.g., 50%, 1024x768, or leave as "100%" for no scaling)

shopt -s nullglob
for img in "$input_dir"/*.{jpg,JPG,jpeg,JPEG,png,PNG}; do
    base_name="$(basename "$img")"
    name="${base_name%.*}"
    output="./compressed/${name}.jpg"

    echo "Compressing: $img -> $output (quality=$quality, resize=$resize)"
    magick "$img" -resize "$resize" -quality "$quality" "$output"
done

echo "Done."
