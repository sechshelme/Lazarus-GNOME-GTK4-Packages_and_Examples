unit gst124_gl_x11;

interface

uses
  {$ifdef Linux}
  x, xlib,
  {$endif}
  glib280,
  gst124,
  gst124_base,
  gst124_video,
  gst124_gl,
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
