  // {$include ../gnome_lib_const.inc}

  // ==== stdio

const
  {$IFDEF Linux}
  libc = 'c';
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  {$ENDIF}

  // ==== Cairo

const
  {$IFDEF Linux}
  cairo_lib = 'libcairo.so.2';
  {$ENDIF}

  {$IFDEF Windows}
  cairo_lib = 'libcairo-2.dll';
  {$ENDIF}

  // ==== Pango

const
  {$IFDEF Linux}
  libpango = 'libpango-1.0';
  libpangocairo = 'libpangocairo-1.0';
  libpangoft2 = 'libpangoft2-1.0';
  libpangoxft = 'libpangoxft-1.0';  // Nur Linux
  {$ENDIF}

  {$IFDEF Windows}
  libpango = 'libpango-1.0-0.dll';
  libpangocairo = 'libpangocairo-1.0-0.dll';
  libpangoft2 = 'libpangoft2-1.0-0.dll';
  {$ENDIF}



  // ==== glib2

const
  {$IFDEF Linux}
  libglib2 = 'libglib-2.0';
  libgobject2_0 = 'libgobject-2.0';
  libgio2 = 'libgio-2.0';
  libgmodule = 'libgmodule-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libglib2 = 'libglib-2.0-0.dll';
  libgobject2_0 = 'libgobject-2.0-0.dll';
  libgio2 = 'libgio-2.0-0.dll';
  libgmodule = 'libgmodule-2.0-0.dll';
  {$ENDIF}

  // ==== gdk2_pixbuf2

const
  {$IFDEF Linux}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0';
  {$ENDIF}

  {$IFDEF Windows}
  libgdk_pixbuf2 = 'libgdk_pixbuf-2.0-0.dll';
  {$ENDIF}

  // ==== GTK4

const
  {$IFDEF Linux}
  libgtk4 = 'libgtk-4';
  {$ENDIF}

  {$IFDEF Windows}
  libgtk4 = 'libgtk-4-1.dll';
  {$ENDIF}

  // ==== gstreamer

const
  {$ifdef Linux}
  libgstreamer = 'libgstreamer-1.0';
  libgstpbutils = 'libgstpbutils-1.0';
  libgstaudio = 'libgstaudio-1.0';
  libgstbadaudio = 'libgstbadaudio-1.0';
  libgstvideo = 'libgstvideo-1.0';
  libgstbase = 'libgstbase-1.0';
  libgstallocators = 'libgstallocators-1.0';
  libgstanalytics = 'libgstanalytics-1.0';
  libgstcheck = 'libgstcheck-1.0';
  libgstphotography = 'libgstphotography-1.0';
  libgstmse = 'libgstmse-1.0';
  libgstinsertbin = 'libgstinsertbin-1.0';
  libgstwebrtc = 'libgstwebrtc-1.0';
  libgstwebrtcnice = 'libgstwebrtcnice-1.0';
  libgstsdp = 'libgstsdp-1.0';
  libgstmpegts = 'libgstmpegts-1.0';
  libgsttag = 'libgsttag-1.0';
  libgstfft = 'libgstfft-1.0';
  libgstcodecparsers = 'libgstcodecparsers-1.0';
  libgstcontroller = 'libgstcontroller-1.0';
  libgstrtp = 'libgstrtp-1.0';
  libgstrtsp = 'libgstrtsp-1.0';
  libgstwayland = 'libgstwayland-1.0';
  libgstva = 'libgstva-1.0';
  libgstplayer = 'libgstplayer-1.0';
  libgstgl = 'libgstgl-1.0';
  libgstvulkan = 'libgstvulkan-1.0';
  libgstnet = 'libgstnet-1.0';
  libgstcuda = 'libgstcuda-1.0';
  libgstplay = 'libgstplay-1.0';
  libgstapp = 'libgstapp-1.0';
  libgstriff = 'libgstriff-1.0';
  libgstbasecamerabinsrc = 'libgstbasecamerabinsrc-1.0';
  libgsttranscoder = 'libgsttranscoder-1.0';
  libgsturidownloader = 'libgsturidownloader-1.0';
  libgstsctp = 'libgstsctp-1.0';
  libgstopencv = 'libgstopencv-1.0';
  libgstisoff = 'libgstisoff-1.0';
  {$endif}

  {$ifdef Windows}
  libgstreamer = 'libgstreamer-1.0-0.dll';
  libgstpbutils = 'libgstpbutils-1.0-0.dll';
  libgstaudio = 'libgstaudio-1.0-0.dll';
  libgstbadaudio = 'libgstbadaudio-1.0-0.dll';
  libgstvideo = 'libgstvideo-1.0-0.dll';
  libgstbase = 'libgstbase-1.0-0.dll';
  libgstallocators = 'libgstallocators-1.0-0.dll';
  libgstanalytics = 'libgstanalytics-1.0-0.dll';
  libgstcheck = 'libgstcheck-1.0-0.dll';
  libgstphotography = 'libgstphotography-1.0-0.dll';
  libgstmse = 'libgstmse-1.0-0.dll';
  libgstinsertbin = 'libgstinsertbin-1.0-0.dll';
  libgstwebrtc = 'libgstwebrtc-1.0-0.dll';
  libgstwebrtcnice = 'libgstwebrtcnice-1.0-0.dll';
  libgstsdp = 'libgstsdp-1.0-o.dll';
  libgstmpegts = 'libgstmpegts-1.0-0.dll';
  libgsttag = 'libgsttag-1.0-0.dll';
  libgstfft = 'libgstfft-1.0-0.dll';
  libgstcodecparsers = 'libgstcodecparsers-1.0-0.dll';
  libgstcontroller = 'libgstcontroller-1.0-0.dll';
  libgstrtp = 'libgstrtp-1.0-0.dll';
  libgstrtsp = 'libgstrtsp-1.0-0.dll';
  libgstwayland = 'liblstwayland-1.0-0.dll';
  libgstva = 'libgstva-1.0-0.dll';
  libgstplayer = 'libgstplayer-1.0-0.dll';
  libgstgl = 'libgstgl-1.0-.dll';
  libgstvulkan = 'libgstvulkan-1.0-0.dll';
  libgstnet = 'libgstnet-1.0-0.dll';
  libgstcuda = 'libgstcuda-1.0-0.dll';
  libgstplay = 'libgstplay-1.0-0.dll';
  libgstapp = 'libgstapp-1.0-0.dll';
  libgstriff = 'libgstriff-1.0-0.dll';
  libgstbasecamerabinsrc = 'libgstbasecamerabinsrc-1.0-0.dll';
  libgsttranscoder = 'libgsttranscoder-1.0-0.dll';
  libgsturidownloader = 'libgsturidownloader-1.0-0.dll';
  libgstsctp = 'libgstsctp-1.0-0.dll';
  libgstopencv = 'libgstopencv-1.0-0.gll';
  libgstisoff = 'libgstisoff-1.0-0.dll';
  {$endif}
