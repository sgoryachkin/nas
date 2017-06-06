#!/bin/bash
media_dir="$( dirname "$0" )";
echo "Media dir: $media_dir"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for video_file in $(find "${media_dir}" -type f -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv");
do
    thumbnail_file=${video_file}.cover.jpg;
    echo "${video_file}";
    if ! [ -f "${thumbnail_file}" ]
    then
        echo "- create ${thumbnail_file}";
        ffmpegthumbnailer -s 160 -i "${video_file}" -o "${thumbnail_file}";
    fi
done;
