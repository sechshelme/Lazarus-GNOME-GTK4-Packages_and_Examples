unit gdk_pixbuf_features;

interface

uses
  glib280;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  GDK_PIXBUF_MAJOR = 2;
  GDK_PIXBUF_MINOR = 42;
  GDK_PIXBUF_MICRO = 10;
  GDK_PIXBUF_VERSION_ = '2.42.10';

var
  gdk_pixbuf_major_version: Tguint; cvar;external libgdk_pixbuf2;
  gdk_pixbuf_minor_version: Tguint; cvar;external libgdk_pixbuf2;
  gdk_pixbuf_micro_version: Tguint; cvar;external libgdk_pixbuf2;
  gdk_pixbuf_version: pansichar; cvar;external libgdk_pixbuf2;

  // === Konventiert am: 7-11-24 19:15:26 ===

implementation


end.
