unit gst124_gl_wayland;

interface

uses
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

  {$DEFINE read_interface}
  {$include gst/gl/wayland/gstgldisplay_wayland.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/gl/wayland/gstgldisplay_wayland.inc}
{$UNDEF read_implementation}

end.
