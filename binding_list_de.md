# Lazarus-GTK4-GStreamer-and-Modern-Bindings

Die ultimative, plattformübergreifende Mega-Sammlung von **FPC/Lazarus-Bindungen** und Beispielen für moderne C-Bibliotheken. Dieses Repository schlägt eine stabile Brücke von Object Pascal zu den mächtigsten Frameworks für Benutzeroberflächen, Multimedia, KI, Kryptographie und Wissenschaft (vollständig kompatibel mit Linux und Windows).

## 🚀 Das FPU-Interoperabilitäts-Highlight (Kein Absturz mehr!)

Klassischerweise reißt der Free Pascal Compiler Anwendungen beim Aufruf externer C-Bibliotheken gerne mit einem **Runtime Error 207** (Invalid Floating Point Operation) zu Boden. Während die FPC-Kernentwickler dieses starre Verhalten verteidigen und das klobige, speicherintensive Einbinden der `Math`-Unit erzwingen wollen, löst dieses Repository das Problem elegant, performant und ohne unnötigen Overhead direkt auf Hardware-Ebene.

In den Kern-Units ist standardmäßig ein **Assembler-Fix für das MXCSR-Register** integriert:

```pascal
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var w2: word = 8064; // Maskiert alle 6 FPU-Ausnahmen im SSE-Kontrollregister
begin
  asm Ldmxcsr w2 end;
end;
{$ENDIF}
```

**Das bedeutet für dich:** Alle Bindungen laufen *out of the box* absolut stabil. Keine unerwarteten Abstürze bei Divisionen durch Null, Unterläufen oder `NaN`-Werten in den C-Bibliotheken!

---

## 📦 Enthaltene Pakete & Bindungen

Hier sind alle in `Packages_2024` enthaltenen Ordner nach logischen Themengebieten geordnet aufgeführt, damit du sofort findest, was du brauchst:

### 🎨 Grafikoberflächen & Desktop (GNOME / GTK4)
* **`adapta_1.5.0`** / **`adwaita-1.5.0`** – Moderne Theme- und Widget-Komponenten
* **`appstream_1.0.2`** – AppStream-Metadatenbibliothek
* **`gdk-pixbuf-2.40.2`** – Bildpuffer-Manipulation
* **`gtk-4.14.2`** / **`gtkhex_46.0`** – Das GIMP Toolkit 4 & Hex-Editor-Widget
* **`gtksourceview-5.12.0`** – Editor-Widget mit Syntax-Highlighting
* **`gweather_4.4.2`** – Wetter-Informationsdienst
* **`ibus-1.5.29`** – Intelligentes Eingabebussystem
* **`nma_1.10.6`** – NetworkManager Applet-Bibliothek
* **`packagekit_1.2.8`** – Installations- und Paketverwaltungsdienst
* **`pango-1.52.1`** – Internationalisiertes Text-Layout und Rendering
* **`peas-2.0.1`** – Leistungsstarkes Plugin-Engine-Framework
* **`portal_0.7.1`** – Flatpak-XDG-Portalschnittstellen
* **`shumate_1.2`** – Interaktives GTK4-Karten-Widget (GtkChoreographer)
* **`spelling_0.2.0`** – Rechtschreibprüfung für Editoren
* **`vte-2.91-gtk4-0.76`** – Eingebettetes, virtuelles Terminal für GTK4
* **`webkitgtk-6.0_2.4x`** – High-End HTML5 Web-Browser-Engine

### 🎬 Video, Audio & Multimedia
* **`asound2_1.2.11_(alsa)`** – Advanced Linux Sound Architecture
* **`canberra_0.30`** – Einfache Wiedergabe von System-Audio-Events
* **`espeak-ng_1.51`** – Open-Source Sprachsynthesizer (Text-to-Speech)
* **`gsound_1.0.3`** – GObject-Bibliothek für Sound-Meldungen
* **`gstreamer-gst-1.24.2`** – Das mächtige Core-Multimedia-Framework
* **`mpv_0.37.0`** – High-End Videoplayer-Einbindung
* **`portmidi_217-6.1`** – Echtzeit-MIDI-Eingabe/Ausgabe
* **`rist_0.2.10`** – Reliable Internet Stream Transport für Video
* **`sndfile_1.2.2`** – Lesen und Schreiben von unkomprimierten Audiodateien
* **`soundio_2.0.0`** – Robuste, plattformübergreifende Audio-Echtzeit-Bibliothek
* **`vlc_3.0.20`** – Native Steuerung des VLC-Mediaplayers

### 👁️ Grafikverarbeitung, KI, OCR & Barcodes
* **`apriltag_3.3.0`** – High-Yield Kanten- und Robotik-Erkennung für visuelle Tags
* **`caca_0.99`** – Farbige ASCII-Art Text-Grafikausgabe
* **`cairo_1.18.0`** – Vektorbasierte 2D-Grafikbibliothek
* **`chafa_1.14.0-1`** – Hochentwickelter Bild-zu-Text Konverter fürs Terminal
* **`dmtx_0.7.7`** – Lesen und Schreiben von DataMatrix-Barcodes
* **`epoxy_1.5.10`** – OpenGL-Funktionszeiger-Management
* **`freetype-2.13.2`** / **`fribidi_1.0.13`** – Schriftartenrasterung & bidirektionaler Text
* **`gegl_0.4.48`** – Graphbasierte Bildverarbeitungs-Engine
* **`glew_2.2.0`** / **`glfw3_3.3.10`** – OpenGL Extension Wrangler & Fenstersystem
* **`gphoto2_2.5.31`** – Steuerung und digitaler Bildimport von Kameras
* **`graphene-1.10.8`** – Optimierte mathematische Typen für 2D- und 3D-Grafik
* **`graphite2_1.3.14`** / **`harfbuzz-8.3.0`** – Text-Shaping für komplexe Schriftsysteme
* **`graphviz_2.42.2`** – Automatisierte Diagramm- und Graph-Visualisierung
* **`heif_1.17.6`** / **`jxl_0.7.0`** – Moderne Bildformate (HEIF & JPEG-XL)
* **`leptonica_1.82.0`** – Umfassende Bildanalyse- und Bildverarbeitungsbibliothek
* **`lerc_4.0.0`** – Begrenzte Fehler-Rasterkompression (Geodaten)
* **`mgl2_8.0.1_(mathgl)`** – Wissenschaftliche Daten-Grafiken und Plots
* **`pixman-1_0.42.2`** – Low-Level Pixelmanipulation und Pixel-Komposition
* **`plplot_5.15.0`** – Wissenschaftliches Standard-Plot-System
* **`poppler_24_02_0`** / **`hpdf_2.4.5_(haru)`** – PDF-Rendering und PDF-Generierung
* **`qrencode_4.1.1`** / **`zint_2.13.0`** – Generierung von QR-Codes und Barcodes
* **`raw_0.21.2`** – RAW-Bilddaten-Import von Digitalkameras
* **`SFML_2.6.0`** – Simple and Fast Multimedia Library (Spiele/Multimedia)
* **`shaderc_2023.8`** – Vulkan/GLSL-Shader-Kompilierung
* **`sixel_1.10.3`** – Sixel-Grafikausgabe für moderne Terminal-Emulatoren
* **`tesseract_5.3.4`** – KI-basierte optische Texterkennung (OCR)
* **`vips_8.15.1`** – Extrem schnelle Bildverarbeitungsbibliothek mit geringem RAM-Bedarf
* **`vulkan_1.3.275.0`** – High-Performance 3D-Grafik-API

### 🧮 Mathematik, Geodaten & Wissenschaft
* **`cblas_openblas_0.3.26`** / **`lapack_3.12.0`** – Lineare Algebra in Höchstgeschwindigkeit
* **`cglm_0.9.2`** – Optimierte 3D-Mathematik für Grafik (speziell für C)
* **`geocode-glib_3.26.3`** / **`geos_3.12.1`** – Geocoding-Dienste und Geometrie-Engines
* **`graphblas_7.4.0`** – Graph-Algorithmen über Matrix-Algebren
* **`gsl_2.7.1`** – GNU Scientific Library (Umfangreiche numerische Funktionen)
* **`hdf5_1.10.10`** – Hierarchical Data Format für massive wissenschaftliche Daten
* **`laszip_3.5.0`** – Verlustfreie Kompression von LiDAR-Punktwolken
* **`matio_1.5.26`** – Lesen und Schreiben von MATLAB-MAT-Dateien
* **`mpc_1.3.1`** / **`mpfi_1.5.3`** / **`mpfr_4.2.1`** – Rechnen mit komplexen Zahlen / Intervallen / hoher Präzision
* **`gmp_6.3.0`** / **`tommath`** – Arithmetik mit beliebig großen Ganzzahlen
* **`ode_0.16.2`** – Open Dynamics Engine (Starrkörper-Physiksimulation)
* **`polylib_5.22.5`** – Operationen auf polyedrischen Domänen
* **`qhull_2020.2-6`** – Berechnung von konvexen Hüllen und Delaunay-Triangulierungen
* **`suitesparse_7.6.1`** – Komplexe Algorithmen für dünnbesetzte Matrizen
* **`zfp_1.0.1`** – Kompression für numerische Arrays

### 🌐 Netzwerk, IPC, Web & Sicherheit
* **`avahi_0.8.13`** – Zeroconf-Netzwerk-Architektur (mDNS/DNS-SD)
* **`curl_8.5.0`** – Client-seitiges URL-Transfer-Bibliothek-Framework
* **`dbus-1.14.10`** – Interprozesskommunikation (IPC-Systembus)
* **`event2.1.12`** – Asynchrone Event-Benachrichtigungs-Bibliothek
* **`gnutls_3.8.3`** – Sichere Transportschicht-Protokolle (TLS/SSL)
* **`ldap_2.6.7`** – Lightweight Directory Access Protocol
* **`microhttpd-1.0.0`** – Leichtgewichtiger, eingebetteter HTTP-Server
* **`mongoc_1.26.0`** / **`bson_1.26.0`** – Native Treiber für MongoDB & BSON-Daten
* **`proxy_0.5.4`** – Automatische Proxy-Konfiguration
* **`rabbitmq_0.11.0`** – AMQP-Messaging Broker-Anbindung
* **`security_1.5.3_(PAM)`** – Pluggable Authentication Modules (System-Sicherheit)
* **`soup-3.4.4`** – HTTP-Client/Server-Bibliothek für GNOME
* **`ssh_0.10.6`** – Secure Shell (SSHv2) Protokoll-Einbindung
* **`zmq_4.3.5`** – ZeroMQ (High-Performance Asynchronous Messaging)

### 🗄️ Datenformate, Systemsteuerung & Audio-Plugins
* **`aa_1.4p5-51.1`** – ASCII Art Text-Rendering-Bibliothek
* **`blkid_2.39.3`** – Identifikation von Blockgeräten und Dateisystemen
* **`brotli_1.1.0`** / **`zstd_1.5.5`** – Hochleistungs-Kompressionsalgorithmen
* **`bytesize_2.1`** – Erleichtertes Rechnen mit Datengrößen (KiB, MiB etc.)
* **`colord-1.4.7(0.3.1)`** – System-Farbmanagement (ICC-Profile)
* **`crypt_4.4.36`** – Daten- und Passwortverschlüsselung
* **`datrie_0.2.13`** – Double-Array Trie-Struktur zur Text-Indexierung
* **`decor_0.2.2`** – Server-Side Window Decorations für Wayland
* **`edit_3.1-20230828`** / **`readline_8.2`** – Terminal-Kommandozeilen-Editierung
* **`expat_2.6.1`** / **`xml2.9.14`** / **`xmlb-2_0.3.18`** – XML-Parser und Binär-XML-Strukturen
* **`ffi-3.4.6`** – Foreign Function Interface (Laufzeit-Funktionsaufrufe)
* **`fontconfig_2.15.0`** – Systemweite Schriftarten-Konfiguration und -Auswahl
* **`fuse3.14`** – Dateisysteme im Userspace (FUSE)
* **`fwupd-1.9.34`** – Firmware-Update-Systemsteuerungs-Daemon
* **`glib-2.80.0`** / **`gmime_3.2.13`** / **`gobject-introspection_1.80.1`** – Das GLib-Fundament, MIME-Parsing & GObject-Typen
* **`gtop-2.41.3`** – Auslesen von System- und Prozess-Auslastungen (Top)
* **`gumbo_0.12.0`** – Konformer HTML5-Parsing-Algorithmus von Google
* **`gusb_0.4.8`** / **`usb_1.0.27`** – USB-Gerätesteuerung und GObject-Wrapper
* **`hidapi_0.14.0`** – USB/Bluetooth Human Interface Devices (HID) Schnittstelle
* **`input_1.25.0`** – Linux-Eingabegeräte-Handling (libinput)
* **`json-glib-1.8.0`** – JSON-Parsing mit GObject-Unterstützung
* **`libc`** – Native System-C-Laufzeitumgebungs-Typen
* **`lilv_0.24.22_(lv2)`** / **`serd_0.32.2`** / **`sord_0.16.16`** / **`sratom_0.6.16`** – LV2-Audio-Plugin-Host-Infrastruktur & RDF-Zustandsgraphen
* **`ltdl_2.4.7`** – Libtool modularer dynamischer Library-Loader
* **`lua_5.1.5`** / **`lua_5.2.4`** – Eingebettete Lua-Skript-Engines
* **`magic_5.45`** – Automatische Dateityp-Erkennung anhand von "Magic Bytes"
* **`magick_6.9.12.98`** – Bildkonvertierung und Bildbearbeitung (ImageMagick)
* **`manette_0.2.7`** – Gamepad- und Controller-Eingaben für GNOME

