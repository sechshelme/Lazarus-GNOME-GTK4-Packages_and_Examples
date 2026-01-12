https://registry.khronos.org/OpenGL-Refpages/gl4/html/radians.xhtml

glCopyBufferSubData(

https://www.opengl-tutorial.org/beginners-tutorials/
https://www.opengl-tutorial.org/intermediate-tutorials/

https://gist.github.com/roxlu/5090067
https://github.com/progschj/OpenGL-Examples/blob/master/06instancing2_buffer_texture.cpp

https://stackoverflow.com/questions/16463078/glclearbufferdata-usage-example
https://docs.google.com/viewer?url=http://education.siggraph.org/media/conference/S2012_Materials/ComputeShader_1pp.pdf

https://learnopengl.com/Advanced-OpenGL/Stencil-testing
https://en.wikibooks.org/wiki/OpenGL_Programming/Stencil_buffer
https://gist.github.com/sealfin/d22f4ba4d1022e1b89dd
https://lazyfoo.net/tutorials/OpenGL/26_the_stencil_buffer/index.php

https://www.khronos.org/opengl/wiki/Programming_OpenGL_in_Linux:_GLX_and_Xlib

https://gamedev.stackexchange.com/questions/119823/trouble-applying-a-texture-to-a-cube

https://docs.gl/gl4/glScissor

https://www.cs.cornell.edu/~kb/projects/epigpu/PixelClass.cg.html

https://www.ozone3d.net/tutorials/glsl_texturing_p08.php

https://registry.khronos.org/OpenGL-Refpages/gl4/

  {$ifndef GLES32}
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  {$endif GLES32}



# Vulkan
https://community.khronos.org/t/5-new-vulkan-samples/110160
https://vulkan-tutorial.com/Drawing_a_triangle/Setup/Instance

# Matrizen
https://studyflix.de/mathematik/drehmatrix-3814
https://www.youtube.com/watch?app=desktop&v=lDaQ3a43x8A

https://www.onlinemathe.de/aktivieren/Mathias1000

xtuzW&rgzc2@2i6


https://wiki.ubuntuusers.de/SimpleScreenRecorder/

https://www.omgubuntu.co.uk/install-notepad-editor-ubuntu
https://snapcraft.io/docs/installing-snap-on-linux-mint
sudo snap install notepad-plus-plus

# Jonits
https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/skeletalanimation/Tutorial%209%20-%20Skeletal%20Animation.pdf
https://research.ncl.ac.uk/game/mastersdegree/graphicsforgames/skeletalanimation/

https://moddb.fandom.com/wiki/OpenGL:Tutorials:Basic_Bones_System

https://www.youtube.com/watch?v=3CWsy4kP6wU

# Scherung
https://www.rhetos.de/html/lex/lineare_abbildung.htm



https://schneide.blog/2016/07/15/generating-an-icosphere-in-c/


$ sudo apt-get install openscad


# JavaScript
https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest/load_event
https://www.w3schools.com/js/js_ajax_http.asp
https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest_API/Sending_and_Receiving_Binary_Data
https://stackoverflow.com/questions/50255282/webgl2-has-anti-alias-automatically-built-in
https://developer.mozilla.org/en-US/docs/Web/API/WebGLRenderingContext/getContextAttributes
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmouseenter
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_onmousemove
https://www.w3schools.com/cssref/tryit.php?filename=trycss_border-color

https://www.w3schools.com/jsref/met_node_removechild.asp
https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_node_insertbefore
https://www.w3schools.com/cssref/tryit.php?filename=trycss_anim_border-color
https://stackoverflow.com/questions/59573722/how-can-i-set-a-css-keyframes-in-javascript


https://wiki.freepascal.org/Pas2JS_Version_Changes

# SDL
https://gist.github.com/gcatlin/b89e0efed78dd91364609ca4095da346

https://github.com/libsdl-org/SDL/commit/2fe1a6a27960126041590d7bbf8080fb5228b1fb



# mingw

sudo apt-get install gcc-mingw-w64
sudo apt-get install mingw-w64-x86-64-dev 
https://medium.com/@bhargav.chippada/how-to-setup-opengl-on-mingw-w64-in-windows-10-64-bits-b77f350cea7e



https://discourse.libsdl.org/t/sdl-remove-sdl-setwindowinputfocus/52467


## 3D Alpha
https://github.com/icculus/SDL/blob/gpu-api/include/SDL3/SDL_gpu.h
https://github.com/thatcosmonaut/SDL/tree/gpu/include/SDL3

# meson cross
https://mesonbuild.com/Cross-compilation.html
https://stackoverflow.com/questions/57436089/meson-can-not-find-windows-resource-compiler-on-linux

## Meson konfigurieren
- `meson configure ../gtk/ `

### Beispiel
- `meson ../gtk/ -Dbuild-tests=false -Dbuild-testsuite=false -Dbuild-examples=false -Dbuild-demos=false --reconfigure`
 



# GTK4
sudo apt-get install libclutter-gtk-1.0-dev 
sudo apt-get install libgee-0.8-dev
sudo apt-get install libgnome-games-support-1-dev
sudo apt-get install libgirepository1.0-dev
sudo apt install libadwaita-1-dev 

libxmlb-dev      // io.



https://repo.msys2.org/mingw/mingw64/



https://www.docs4dev.com/docs/gtk/4.0.0/gtkwindowcontrols.html#google_vignette


# VGA
https://int10h.org/oldschool-pc-fonts/fontlist/font?ibm_vga_8x16

https://man7.org/linux/man-pages/man3/getopt.3.html
## mingw windows
https://github.com/niXman/mingw-builds-binaries?tab=readme-ov-file


# wine PATH
~/.bashrc
export WINEPATH="$WINEPATH;C:\users\tux\mingw64\bin;C:\gstreamer\1.0\msvc_x86_64\bin"


# glib 
https://github.com/wadester/wh_test_glib/blob/master/glib_test1.c
https://www.perplexity.ai/search/gib-mir-ein-besipie-mit-g-sign-o.RYtsJDRY6LPTdT6u4ViQ

# gstreamer
meson ../gstreamer-1.24.8 -Dtests=disabled
ninja -j20
ninja install



gst-inspect-1.0 --plugin
gst-inspect-1.0 --plugin alsa


https://stackoverflow.com/questions/71470892/how-to-play-audio-with-gstreamer-in-c
https://gstreamer.freedesktop.org/documentation/gstreamer/gstelementfactory.html?gi-language=c


https://github.com/GStreamer/gst-docs/blob/master/examples/tutorials/basic-tutorial-6.c

https://discourse.gstreamer.org/t/interpipe-caps-not-accepted/2454
https://github.com/GStreamer/gst-plugins-good/blob/master/tests/check/elements/id3demux.c

# gtk opengl
https://docs.gtk.org/gtk4/class.GLArea.html

# Animationen
https://easings.net/de

# Zum ausprobieren

/usr/include/graphite2



https://docs.gtk.org/gtk4/migrating-4to5.html

https://wiki.gnome.org/Projects/Libgee
https://github.com/GNOME/libgee



Graphite2 

# webkit

https://www.perplexity.ai/search/ich-wolllte-webkit-6-bauen-und-cFoanQHyTVeyY3ASw28N7Q

sudo apt-get install libgcrypt20 libgcrypt20-dev
sudo apt-get install libtasn1-6 libtasn1-6-dev
sudo apt-get install libmanette-0.2-dev 
sudo apt-get install libxslt1-dev
sudo apt-get install libsecret-1-0 libsecret-1-dev


# FPC 

{$modeswitch functionreferences}
{$modeswitch anonymousfunctions}
{$ENDIF}
{$modeswitch advancedrecords}
/home/tux/fpcupdeluxe_trunk/fpcsrc/packages/fcl-passrc/src/pscanner.pp




# Fontutils

git clone https://git.zap.org.au/git/console-fonts-utils.git


https://discourse.gnome.org/t/gtk-box-new-returning-pointer-to-an-already-existing-gtkbox-in-gtk4/26423

# Linux Libary

https://www.linuxfromscratch.org/blfs/view/git/general/graphlib.html


=============

Ogre3D oder IrrLicht:  // Games Engines
libraylib-dev          // Games Engines

libcurl                            // io.
libraw                             // io.
libsoup2.2                          // glib
libsoup3                           // io
libpng-dev 
libshaderc-dev                     // io.
libbluetooth-dev
libopenal-dev
libalut-dev
libusb-1.0-0-dev                   // io.
libxkb
libhpdf-dev
libhdf5-dev
libhdf-dev
libgsl-dev                         // io.
libmgl                             // io.
libpciaccess
libunistring-dev

libopenblas             // io.
liblapacke              // io.
liblapack               // io.

libmpfr-dev             // io.
libmpfi-dev             // io.
libportmidi0            // io.

libev4 
libev-dev
libtasn1-bin
libtasn1-6-dev 

libfftw3-dev
libao-dev

libsystemd-dev                      // io.
libnss-systemd und libpam-systemd   // io.
libdbus                             // io. 
libcap-dev                          // io.

libdconf-dev
libdbusmenu-glib-dev
libdbusmenu-gtk3-dev

libevdev-dev 

libwinpr3-dev

libpoppler                          // io.
libxcb                              // io.

zlib
 libbrotli-dev   
 libselinux1  



 libfluidsynth3  
libhandy-1-0              // gtk3
libgedit-tepl             // gtk3

libavif16    
libxkbcommon
libhidapi                            // io.

libquadmath0                      /usr/lib/gcc/x86_64-linux-gnu/13/include/quadmath.h
libpipewire-0.3-dev     

ibsoundtouch-ocaml-dev


libgomp1                         // Nur in GCC verwendbar
libhwasan0                       // Nur in GCC verwendbar     
libitm1                          // Nur in GCC verwendbar         

libcrypt1                        // io.
libgcrypt1

libcupsfilters


/usr/include/libmount

libnotify-dev

liblapack-dev  // fortan  algebra            gcc main.c -o main -lblas -llapack


libgcr-4-4  &   libgck-2-2      // glib cyrypto

libgtkdatabox-dev   
libgtksheet-4.0-dev

libpeas-2-dev                  // io.
libpeasd-3-dev 
 glib-networking   
libglibmm-2.4-dev

# === RDF 
libserd              // io. 
libsord              // io.
liblilv              // io.
librdf               // io.
libsratom            // io.
# ====
libraptor2           // io.
libzix-dev 
librasqal3-dev  

libsqlite3-dev         // io.
librasterlite2-dev  

libdatrie1   

libupower-glib-dev 
libzstd-dev

libnspr4   // mozilla

libpackagekit-glib2-dev 




   

apt install blueprint-compiler


libfftw3 


/usr/include/x86_64-linux-gnu/cblas.h
/usr/include/unicode/char16ptr.h

sudo apt install libnss3 libnss3-dev

libreadline-dev          // io.

libportal-gtk4-dev   // io.

libnl-genl-3-dev 

liblodepng-dev
libltdl                            // io.  

libcogl                            // veraltet

 libswresample-dev  

 libboost-locale1.88.0 
liblangtag-common    
 libbinutils     
 libmount-dev  
libgusb2  
liborcus-0      // Excel Tabellen einlesen

libcolord-dev     
libcolord-gtk4-1t64  

libgoa-1.0-common  

 libgupnp-1.6-0  

  libblockdev       ( mit glib )

 libchromaprint-dev     ( audioerkennug ))
  libbytesize-common    ( bist byte berechnen )    
     libebur128-1  ( Lautheitsmessung )    
  libfluidsynth3      ( midi )

libexpat1-dev   ( xml lesen )   

libgphoto2              // io.

  libsuitesparseconfig7 ( matrix mathe )  libsuitesparse-dev

 librsvg2-2  
 libmm-glib0    

libmkl-full-dev  



libdfp-dev

libminiaudio-dev       
 libgupnp-dlna-2.0-4 

libxmlsec1-nss1  
libxmlsec1-1 

libgsm1   
libtevent0t64 
liburcu8t64

libgeocoding               // io.    
libasound2                 // io.
libsoundio                 // io.
libsane                    // io.

libmagickcore-dev
libogg0

 libatk1.0-dev       // Barrierenfreiheit

libgegl-dev
libvala-0.56-dev 
 libvalacodegen-0.56-0 
libyaml-dev              // io.
libappstream-dev

  liba52-0.7.4-dev      


liblua5.1-0-dev 

libmanette-0.2-dev       // io.
libavahi-core-dev        // io. 
libavahi-gobject-dev     // io. 
libavahi-glib-dev        // io.

libgdbm-dev
libdaemon-dev

libavif
gdk-pixbuf-csource 
/usr/lib/x86_64-linux-gnu/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders

libmagickwand-dev                // io.    ../ImageMagick/configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-hdri --enable-shared --with-quantum-depth=16 --disable-opencl
make distclean
../ImageMagick/configure --host=x86_64-w64-mingw32 --prefix=/mingw64 --disable-hdri --enable-shared=yes --enable-static=yes --with-quantum-depth=16 --with-magickwand=yes --without-magick-plus-plus --without-utilities --enable-static=no 


libmagic-dev                     // io.
libtre-dev                       // io.

libgraphblas                     // io.
libheif-dev     

 libpolkit-gobject-1-0


libfribidi-dev                    // io.
libraqm-dev                       // io.
libstb-dev                        // inline müll
 
libcaca-dev                       // io.
libaa1-dev 

libsodium

libopenimageio2.5
libnotify4 

libheif-dev 





libhyperscan-dev  // neu libvectorscan-dev

# Zeigt neuste Pakete an
aptitude




   

/home/tux/Schreibtisch/von_Git/gcc/gcc/libgomp/libgomp_g.h



# winboat

sudo apt install freerdp3-x11
sudo apt install docker-compose-v2
http://127.0.0.1:47270/







sudo apt install gtk-4-examples




# ===========   Brandneu, gibt es in LTS noch nicht

libglycin-2-0  
libglycin-gtk4

sudo apt install libglycin-gtk4-2-0                           
sudo apt install libglycin-gtk4-2-dev  # für Entwicklung
https://gitlab.gnome.org/GNOME/glycin/

--------------

libdialog               # https://invisible-island.net/archives/dialog/
../dialog-1.3-20260107/configure --with-shared


# =========================


COLUMNS=200 apt search '^lib.*-dev$' > test.txt






#include <getopt.h>
/usr/include/tjutils/tjcomplex.h




libgnuplot-iostream-dev      // Nur C++
https://github.com/longradix/gnuplot_i


/usr/include/nspr


# ==== ffmpeg

libavutil/ (Utils, Mathe, Logging) – immer.
libavcodec/ (Codecs) – immer.
libavformat/ (IO, Demux/Mux) – immer.

libswscale/ (Skalierung, Pixel-Format).
libswresample/ (Audio-Resampling).
libavfilter/ (Filter, z. B. scale, overlay).
libavdevice/ (Geräte-Input/Output).
libavresample/ (älteres Resampling, deprecated).
libpostproc/ (Post-Processing, optional).




sudo apt install libgif-dev 

# =========================


Gepflegte Widget-Sets in C (Stand 2025)
GTK: Wird aktiv weiterentwickelt und ist eines der modernsten und am weitesten verbreiteten C-Toolkits für grafische Oberflächen.

EFL (Enlightenment Foundation Libraries): Ebenfalls aktiv gepflegt und in der Entwicklung, vor allem im Umfeld der Enlightenment-Community.

IUP: Wird weiterhin betreut und regelmäßig aktualisiert, insbesondere für wissenschaftliche und technische Anwendungen.

Tcl/Tk: Auch wenn Tcl/Tk eng mit der Skriptsprache Tcl verbunden ist, wird das Toolkit (geschrieben in C) weiterhin gepflegt und erhält Updates.

libui: Ein leichtgewichtiges, modernes Toolkit in C, das noch aktiv weiterentwickelt wird.


kconfig // menuconfig vom kernel


meson setup build --wipe -Denable_tests=true -Denable_libcurl=true


# Ubuntu no LTS Upgraden

Um von Ubuntu 25.04 (kein LTS) auf Ubuntu 25.10 zu aktualisieren, kannst du wie folgt vorgehen:

1. Updates installieren und System vorbereiten

Öffne ein Terminal (Strg + Alt + T)

Führe folgende Befehle aus:

text
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
sudo apt-get install update-manager-core
sudo do-release-upgrade

2. Upgrade starten

Sobald Ubuntu 25.10 offiziell verfügbar ist, kannst du das Upgrade mit folgendem Befehl starten:

text
sudo do-release-upgrade
Falls das Upgrade noch nicht offiziell freigeschaltet ist, kannst du es mit dem Parameter -d erzwingen (auf eigenes Risiko):

text
sudo do-release-upgrade -d
Folge den Anweisungen im Terminal und bestätige nötige Rückfragen.


# Programm Zeilen auswerten.

sudo apt install cloc

# Paket Hitory

apt changelog libwebkitgtk-6.0-dev
dpkg -s libwebkitgtk-6.0-dev | grep Version
apt list --installed libwebkitgtk-6.0-dev

# cache aufräumen

ldconfig
hash -r

# Alle -dev Pakete Listen 

apt search '\-dev' | grep '^[a-zA-Z0-9].*-dev/' | cut -d'/' -f1 | while read pkg; do
  echo "=== $pkg ==="
  apt show "$pkg"
done



find . -type d -exec chmod 775 {} +
find . -type f -exec chmod 664 {} +

find . -type d -exec chmod 775 {} +; find . -type f -exec chmod 664 {} +







