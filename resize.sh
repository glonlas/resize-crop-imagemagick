#!/bin/bash

echo "Resize, crop and thumbnail"

for i in `ls orig*`; do
        fname=$(basename $i .gif)
		echo "$i"
		echo "  - Resize"
        convert $i -coalesce -layers OptimizeTransparency -resize 350x211 compiled/$fname-resize-350x211.gif
        
        echo "  - Crop"
        convert $i -coalesce -layers OptimizeTransparency -resize 350x211  -delete 1--1 compiled/$fname-resize-first-350x211.gif
        
        echo "  - Thumbnail"
        convert $i -coalesce -layers OptimizeTransparency -gravity center -crop 250x250+0+0 +repage compiled/$fname-crop.gif
done
