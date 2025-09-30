#!/bin/bash

# Farben definieren
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

packages=(
    "glib-2.0"
    "gio-2.0"
    "cairo"
    "freetype2"
    "graphene-1.0"
    "harfbuzz"
    "pango"
    "gdk-pixbuf-2.0"
    "gtk4"
    "gstreamer-1.0"
    "gst-editing-services-1.0"
    "chafa"
    
    "libxml-2.0" 
    "libmicrohttpd"
)

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}       Paket-Versions-Überprüfung     ${NC}"
echo -e "${BLUE}======================================${NC}"

max_length=$(printf '%s\n' "${packages[@]}" | wc -L)

for package in "${packages[@]}"; do
    version=$(pkg-config --modversion "$package" 2>/dev/null)
    printf "%-*s : " $((max_length+2)) "$package"
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}$version${NC}"
    else
        echo -e "${RED}nicht gefunden${NC}"
    fi
done

echo -e "${BLUE}======================================${NC}"

