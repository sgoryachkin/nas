#!/bin/bash
media_dir="$( dirname "$0" )";
echo "Media dir: $media_dir"
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

# Create thumbnails
echo "Create thumbnails";
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
echo "Clen Up thumbnails";
for thumbnail_file in $(find "${media_dir}" -type f -iname "*.mov.cover.jpg" -o -iname "*.avi.cover.jpg" -o -iname "*.mkv.cover.jpg");
do
    echo "${thumbnail_file}";
    video_file=${thumbnail_file%.cover.jpg};
    echo "${video_file}";
    if ! [ -f "${video_file}" ]
    then
        echo "- remove ${thumbnail_file}";
        rm "${thumbnail_file}";
    fi
done;

# Clean Up Empty dirs
find "${media_dir}" -type d -empty -delete
