# Lazarus-GLIB2.80-Packages_and_Examples

## Paketinfo
- `pkg-config --cflags --libs gstreamer-1.0 gstreamer-pbutils-1.0`

## GLIB2 
https://github.com/wadester/wh_test_glib/blob/master/glib_test1.c

## gobject
https://github.com/ToshioCP/Gobject-tutorial?tab=readme-ov-file

## GTK4
https://github.com/ToshioCP/Gtk4-tutorial

## gstreamer
### Tools
Plugin-Infos:
- `gst-inspect-1.0 --plugin`
- `gst-inspect-1.0 --plugin alsa`

### Pakete
`sudo apt install libva-dev`

### C-Examples
- (https://gstreamer.freedesktop.org/documentation/tutorials/basic/hello-world.html?gi-language=c)
- (https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c)

### wine PATH
Folgende Datei editieren:
- `~/.bashrc`
Folgendes an Ende einfügen:
- `export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin;C:\gstreamer\1.0\msvc_x86_64\bin"`
Aktualisieren:
- `source ~/.bashrc`

### mp3 Tag Tools
- id3v2
- mp3tag
- kid3





