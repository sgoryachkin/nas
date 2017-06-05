#!/bin/bash
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for video_file in $(find `pwd` -type f -iname "*.mov" -o -iname "*.avi" -o -iname "*.mkv");
do
    thumbnail_file=${video_file}.jpg;
    #echo "${video_file}"
    if ! [ -f "${thumbnail_file}" ]
    then
        #echo "Create ${thumbnail_file}";
        ffmpegthumbnailer -i "${video_file}" -o "${thumbnail_file}";
    fi
done;
