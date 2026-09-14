# Lazarus-GTK4-GStreamer-and-Modern-Bindings

The ultimate, cross-platform mega-collection of **FPC/Lazarus bindings** and examples for modern C-libraries. This repository bridges Object Pascal with the most powerful frameworks for user interfaces, multimedia, AI, cryptography, and science (fully compatible with both Linux and Windows).

## 🚀 The FPU Interoperability Highlight (No More Crashes!)

Traditionally, the Free Pascal Compiler drops applications with a sudden **Runtime Error 207** (Invalid Floating Point Operation) as soon as an external C-library executes hardware-masked calculations. While the FPC core developers stubbornly defend this rigid behavior and force developers to include the bloated `Math` unit, this repository solves the problem elegantly, performantly, and without unnecessary overhead directly at the hardware level.

An **assembler fix for the MXCSR register** is natively integrated into the core units:

```pascal
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var w2: word = 8064; // Masks all 6 FPU exceptions in the SSE control register
begin
  asm Ldmxcsr w2 end;
end;
{$ENDIF}
```

**What this means for you:** All bindings work *out of the box* with absolute stability. No unexpected crashes caused by division-by-zero, underflows, or `NaN` values generated inside the C-libraries!

---

## 📦 Included Packages & Bindings

Here is the complete list of directories found within `Packages_2024`, grouped by logical categories to help you find exactly what you need:

### 🎨 Graphical User Interfaces & Desktop (GNOME / GTK4)
* **`adapta_1.5.0`** / **`adwaita-1.5.0`** – Modern theme and widget components.
* **`appstream_1.0.2`** – AppStream metadata library.
* **`gdk-pixbuf-2.40.2`** – Image buffer manipulation.
* **`gtk-4.14.2`** / **`gtkhex_46.0`** – The GIMP Toolkit 4 & Hex editor widget.
* **`gtksourceview-5.12.0`** – Source code editor widget with syntax highlighting.
* **`gweather_4.4.2`** – Weather information service.
* **`ibus-1.5.29`** – Intelligent Input Bus system.
* **`nma_1.10.6`** – NetworkManager applet library.
* **`packagekit_1.2.8`** – Package management suite wrapper.
* **`pango-1.52.1`** – Internationalized text layout and rendering.
* **`peas-2.0.1`** – Powerful plugin engine framework.
* **`portal_0.7.1`** – Flatpak XDG portal interfaces.
* **`shumate_1.2`** – Interactive GTK4 map widget (GtkChoreographer).
* **`spelling_0.2.0`** – Spellchecking support for text widgets.
* **`vte-2.91-gtk4-0.76`** – Embedded virtual terminal emulator widget for GTK4.
* **`webkitgtk-6.0_2.4x`** – High-end HTML5 web browser engine.

### 🎬 Video, Audio & Multimedia
* **`asound2_1.2.11_(alsa)`** – Advanced Linux Sound Architecture.
* **`canberra_0.30`** – Simple playback of desktop event sounds.
* **`espeak-ng_1.51`** – Open-source speech synthesizer (Text-to-Speech).
* **`gsound_1.0.3`** – GObject library for system sound notifications.
* **`gstreamer-gst-1.24.2`** – The mighty core multimedia framework.
* **`mpv_0.37.0`** – High-end video player integration.
* **`portmidi_217-6.1`** – Real-time MIDI input/output.
* **`rist_0.2.10`** – Reliable Internet Stream Transport for video streaming.
* **`sndfile_1.2.2`** – Reading and writing uncompressed audio files.
* **`soundio_2.0.0`** – Robust, cross-platform real-time audio library.
* **`vlc_3.0.20`** – Native control binding for the VLC media player.

### 👁️ Graphics Processing, AI, OCR & Barcodes
* **`apriltag_3.3.0`** – High-yield fiducial detection system for robotics and vision tags.
* **`caca_0.99`** – Color ASCII-art text graphics engine.
* **`cairo_1.18.0`** – Vector-based 2D graphics library.
* **`chafa_1.14.0-1`** – Advanced image-to-text converter for terminals.
* **`dmtx_0.7.7`** – Reading and writing DataMatrix barcodes.
* **`epoxy_1.5.10`** – OpenGL function pointer management.
* **`freetype-2.13.2`** / **`fribidi_1.0.13`** – Font rasterization & bidirectional text layout.
* **`gegl_0.4.48`** – Graph-based image processing engine.
* **`glew_2.2.0`** / **`glfw3_3.3.10`** – OpenGL Extension Wrangler & windowing framework.
* **`gphoto2_2.5.31`** – Digital camera control and image import interfaces.
* **`graphene-1.10.8`** – Optimized math types for 2D and 3D graphics canvas.
* **`graphite2_1.3.14`** / **`harfbuzz-8.3.0`** – Text shaping for complex script systems.
* **`graphviz_2.42.2`** – Automated diagram and graph layout visualization.
* **`heif_1.17.6`** / **`jxl_0.7.0`** – Modern image formats (HEIF & JPEG-XL).
* **`leptonica_1.82.0`** – Broad image analysis and image processing library.
* **`lerc_4.0.0`** – Limited Error Raster Compression (geospatial data).
* **`mgl2_8.0.1_(mathgl)`** – Scientific data graphics and mathematical plotting.
* **`pixman-1_0.42.2`** – Low-level pixel manipulation and composition.
* **`plplot_5.15.0`** – Scientific standard plotting library.
* **`poppler_24_02_0`** / **`hpdf_2.4.5_(haru)`** – PDF rendering and PDF document generation.
* **`qrencode_4.1.1`** / **`zint_2.13.0`** – QR-code and universal barcode generation.
* **`raw_0.21.2`** – RAW image data importing from digital cameras.
* **`SFML_2.6.0`** – Simple and Fast Multimedia Library (games/multimedia).
* **`shaderc_2023.8`** – Vulkan/GLSL shader compilation toolchain.
* **`sixel_1.10.3`** – Sixel graphics output encoder for modern terminal emulators.
* **`tesseract_5.3.4`** – AI-powered Optical Character Recognition (OCR).
* **`vips_8.15.1`** – Fast image processing library with minimal RAM footprint.
* **`vulkan_1.3.275.0`** – High-performance 3D graphics API.

### 🧮 Mathematics, Geospatial & Science
* **`cblas_openblas_0.3.26`** / **`lapack_3.12.0`** – High-speed linear algebra computations.
* **`cglm_0.9.2`** – Highly optimized 3D math for graphics (C-style).
* **`geocode-glib_3.26.3`** / **`geos_3.12.1`** – Geocoding services and geometry topology engines.
* **`graphblas_7.4.0`** – Graph algorithms built on matrix algebra.
* **`gsl_2.7.1`** – GNU Scientific Library (comprehensive numerical routines).
* **`hdf5_1.10.10`** – Hierarchical Data Format for massive scientific datasets.
* **`laszip_3.5.0`** – Lossless compression for LiDAR point clouds.
* **`matio_1.5.26`** – Reading and writing MATLAB MAT files.
* **`mpc_1.3.1`** / **`mpfi_1.5.3`** / **`mpfr_4.2.1`** – Complex numbers / Interval arithmetic / Arbitrary high-precision math.
* **`gmp_6.3.0`** / **`tommath`** – Multi-precision arithmetics for arbitrarily large integers.
* **`ode_0.16.2`** – Open Dynamics Engine (rigid body physics simulation).
* **`polylib_5.22.5`** – Operations on polyhedral domains.
* **`qhull_2020.2-6`** – Computing convex hulls and Delaunay triangulations.
* **`suitesparse_7.6.1`** – Complex algorithms for sparse matrices.
* **`zfp_1.0.1`** – Numerical array compression.

### 🌐 Network, IPC, Web & Security
* **`avahi_0.8.13`** – Zeroconf networking architecture (mDNS/DNS-SD).
* **`curl_8.5.0`** – Client-side URL transfer library framework.
* **`dbus-1.14.10`** – Inter-process communication (IPC system bus).
* **`event2.1.12`** – Asynchronous event notification library.
* **`gnutls_3.8.3`** – Secure transport layer protocols (TLS/SSL).
* **`ldap_2.6.7`** – Lightweight Directory Access Protocol.
* **`microhttpd-1.0.0`** – Lightweight, embedded HTTP server.
* **`mongoc_1.26.0`** / **`bson_1.26.0`** – Native drivers for MongoDB & BSON structured data.
* **`proxy_0.5.4`** – Automatic proxy configurations.
* **`rabbitmq_0.11.0`** – AMQP messaging broker binding.
* **`security_1.5.3_(PAM)`** – Pluggable Authentication Modules (Linux system security).
* **`soup-3.4.4`** – HTTP client/server library for GNOME.
* **`ssh_0.10.6`** – Secure Shell (SSHv2) protocol engine.
* **`zmq_4.3.5`** – ZeroMQ (High-performance asynchronous messaging).

### 🗄️ Data Formats, System Control & Audio Plugins
* **`aa_1.4p5-51.1`** – ASCII-art text rendering library.
* **`blkid_2.39.3`** – Block device and filesystem identification.
* **`brotli_1.1.0`** / **`zstd_1.5.5`** – High-performance compression algorithms.
* **`bytesize_2.1`** – Easy data size calculations (KiB, MiB, etc.).
* **`colord-1.4.7(0.3.1)`** – System color management (ICC profiles).
* **`crypt_4.4.36`** – Data and password encryption routines.
* **`datrie_0.2.13`** – Double-array trie structure for fast text indexation.
* **`decor_0.2.2`** – Server-side window decorations for Wayland.
* **`edit_3.1-20230828`** / **`readline_8.2`** – Terminal command-line editing interfaces.
* **`expat_2.6.1`** / **`xml2.9.14`** / **`xmlb-2_0.3.18`** – XML parsers and binary XML blobstores.
* **`ffi-3.4.6`** – Foreign Function Interface (runtime function calling).
* **`fontconfig_2.15.0`** – System-wide font configuration and customization.
* **`fuse3.14`** – Filesystems in Userspace (FUSE).
* **`fwupd-1.9.34`** – Firmware update control daemon.
* **`glib-2.80.0`** / **`gmime_3.2.13`** / **`gobject-introspection_1.80.1`** – Core GLib foundation, MIME parsing & GObject type systems.
* **`gtop-2.41.3`** – Fetching system resource and process utilization (Top).
* **`gumbo_0.12.0`** – Google's fully compliant HTML5 parsing algorithm.
* **`gusb_0.4.8`** / **`usb_1.0.27`** – USB device control and GObject wrappers.
* **`hidapi_0.14.0`** – USB/Bluetooth Human Interface Devices (HID) interface.
* **`input_1.25.0`** – Linux input device handling (libinput).
* **`json-glib-1.8.0`** – JSON parsing with GObject backend support.
* **`libc`** – Native System C-Runtime type allocations.
* **`lilv_0.24.22_(lv2)`** / **`serd_0.32.2`** / **`sord_0.16.16`** / **`sratom_0.6.16`** – LV2 audio plugin host infrastructure & RDF state graphs.
* **`ltdl_2.4.7`** – Libtool modular dynamic library loader.
* **`lua_5.1.5`** / **`lua_5.2.4`** – Embedded Lua scripting engines.
* **`magic_5.45`** – Automatic file type detection via "Magic Bytes".
* **`magick_6.9.12.98`** – Image conversion and manipulation suite (ImageMagick).

