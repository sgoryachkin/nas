#!/bin/bash
ffmpegthumbnailer -i "${TR_TORRENT_DIR}"/"${TR_TORRENT_NAME}" -o "${TR_TORRENT_DIR}/${TR_TORRENT_NAME}.jpeg"
