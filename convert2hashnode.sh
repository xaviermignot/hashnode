#!/bin/bash

IMG_RELATIVE_PATH="$(sed -r -n 's/^img_path:\s*(.*)/\1/p' $1)"
URL_PREFIX="https:\/\/blog.xmi.fr${IMG_RELATIVE_PATH//\//\\\/}"

# Replace images relative URLs with absolute ones
sed -i -r "s/!\[(.*)\]\(\/(.*)\)/![\1]($URL_PREFIX\/\2)/g" $1

# Remove image width
sed -i -r 's/\{:\s*width="[0-9]+"\s*\}//g' $1

# Remove tool tips and do not use quote for content
sed -i -r 'N;s/>\s(.*)\n\{:\s*\.prompt-(info|warning|error|tip)\s*\}/\1/gm' $1
