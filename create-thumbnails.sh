#!/bin/bash
media_dir="$( dirname "$0" )";
echo "Media dir: $media_dir"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for video_file in $(find "${media_dir}" -type f -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv");
do
    echo "${video_file}";
    thumbnail_file=${video_file}.cover.jpg;
    if ! [ -f "${thumbnail_file}" ]
    then
        echo "- create ${thumbnail_file}";
        ffmpegthumbnailer -s 160 -i "${video_file}" -o "${thumbnail_file}";
    fi
done;
# Clean Up
for thumbnail_file in $(find "${media_dir}" -type f -iname "*.mov.cover.jpg" -o -iname "*.avi.cover.jpg" -o -iname "*.mkv.cover.jpg");
do
    echo "${thumbnail_file}";
    video_file=${thumbnail_file}.cover.jpg;
    if ! [ -f "${video_file}" ]
    then
        echo "- remove ${thumbnail_file}";
        rm "${video_file}";
    fi
done;
