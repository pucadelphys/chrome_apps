#!/bin/sh

source ~/.cache/wal/colors.sh
source ~/memes.log

DIR=$(dirname "${BASH_SOURCE[0]}")
THEME="${DIR}/theme"
SOURCES="${DIR}/homepage/sources"

[[ -f "${THEME}/Cached Theme.pak" ]] && rm "${THEME}/Cached Theme.pak" 

magick -size 128x128 -define gradient:center=85,35 -define gradient:extent=diagonal -define gradient:radii=90,90 radial-gradient:${color11}-${color1} "${SOURCES}/gradient.png"
magick "${SOURCES}/mask.png" -alpha off "${SOURCES}/gradient.png" +swap -compose copyalpha -composite "${SOURCES}/favicon.png"

cp ${system_background} "${SOURCES}/background.png"

cat > "${DIR}/homepage/theme.css" << EOF
#time{
    color: ${color15};
}
.grid > a::after {
    color: ${color15};
}
input[type="text"] {
    color: ${color15};
}
::-webkit-input-placeholder {
    color: ${color15};
}
.search {
    border-bottom: 1px solid ${color15};
}
EOF

cat > "${THEME}/manifest.json" << EOF
{
    "manifest_version": 3,
    "version": "1.0",
    "name": "Brave Theme",
    "theme": {
        "colors": {
        "frame": [${rgbbackground}],
        "frame_inactive": [${rgbbackground}],
        "toolbar": [${rgbcolor3}],
        "button_background": [${rgbforeground}],
        "toolbar_button_icon": [${rgbforeground}],
        "toolbar_text": [${rgbforeground}],
        "omnibox_background": [${rgbbackground}],
        "omnibox_text": [${rgbforeground}]
        }
    }
}
EOF
