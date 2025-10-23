unit fp_gst_gl_x11;

interface

uses
  {$ifdef Linux}
  x, xlib,
  {$endif}
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  fp_gst_gl,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$ifdef Linux}
  {$DEFINE read_interface}
  {$include gst/gl/x11/gstgldisplay_x11.inc}
  {$UNDEF read_interface}
  {$endif}

implementation

{$ifdef Linux}
{$DEFINE read_implementation}
{$include gst/gl/x11/gstgldisplay_x11.inc}
{$UNDEF read_implementation}
{$endif}

end.
