unit fp_gdk_pixbuf_xlib2;

interface


{$IFDEF LINUX}
uses
  x, xlib, xutil,
  fp_glib2,
  fp_gmodule,
  fp_gdk_pixbuf2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include pixbuf_xlib/gdk_pixbuf_xlibrgb.inc}
{$include pixbuf_xlib/gdk_pixbuf_xlib.inc}
{$UNDEF read_interface}

{$ENDIF}

implementation

{$IFDEF LINUX}

{$DEFINE read_implementation}
{$include pixbuf_xlib/gdk_pixbuf_xlibrgb.inc}
{$include pixbuf_xlib/gdk_pixbuf_xlib.inc}
{$UNDEF read_implementation}

{$ENDIF}

end.
