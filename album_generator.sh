#!/bin/bash

# Exit on error
set -e

# Ensure ImageMagick is installed
if ! command -v magick &> /dev/null; then
    echo "Error: ImageMagick 'magick' not found. Please install it first."
    exit 1
fi

# Ensure we are inside an album directory with a 'raw' folder
album_dir=$(pwd)
album_name=$(basename "$album_dir")
raw_dir="$album_dir/raw"

if [ ! -d "$raw_dir" ]; then
    echo "Error: 'raw' folder not found in $album_dir"
    exit 1
fi

# Settings
quality=80
#resize="3150000@"
resize="100%"  # Keep original resolution; adjust if needed

# Start HTML
index_html="$album_dir/index.html"
cat > "$index_html" <<EOF
<!DOCTYPE html>
<html>
<head>
        <title>$album_name</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes" />
        <style>
                img {
                        object-fit: contain;
                        display: block;
                        margin-left: auto;
                        margin-right: auto;
                }
                .landscape {
                        width: 100%;
                        height: auto;
                }
                .portrait {
                        width: 60%;
                        height: auto;
                }
                body {
                        margin: 1em auto;
                        max-width: 60%;
                        padding: 0.62em;
                        font: 1.0em/1.6 serif;
                }
                header {
                        margin-bottom: 4em;
                        text-align: center;
                }
                footer {
                        text-align: right;
                        margin-top: 80px;
                        padding-bottom: 20px;
                }
        </style>
</head>
<body>
        <header>
                <h1>$album_name</h1>
                <h3>$(date +"%b %Y")</h3>
                <p></p>
        </header>
EOF

# Compress and append HTML entries
shopt -s nullglob
for img in "$raw_dir"/*.{jpg,jpeg,JPG,JPEG,png,PNG}; do
    base=$(basename "$img")
    name="${base%.*}"
    compressed="${name}_compressed.jpg"

    echo "Compressing $base..."
    magick "$img" -resize "$resize" -quality "$quality" "$album_dir/$compressed"

    # Get orientation
    dimensions=$(magick identify -format "%w %h" "$img")
    width=$(echo $dimensions | cut -d' ' -f1)
    height=$(echo $dimensions | cut -d' ' -f2)
    if [ "$height" -gt "$width" ]; then
        class="portrait"
    else
        class="landscape"
    fi

    # Append to HTML
    echo "        <p><a href=\"./raw/$base\"><img src=\"$compressed\" loading=\"lazy\" class=\"$class\"></a></p>" >> "$index_html"
done

# Finish HTML
cat >> "$index_html" <<EOF

  <footer>
    <a href="../../albums.html">← Back to Albums</a><br>
  </footer>
</body>
</html>
EOF

echo "Done. index.html generated in $album_dir"

# cd /Users/cbarrett/site/camb/albums/montana
# bash /path/to/generate_album.sh
