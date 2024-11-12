unit gst124_vulkan_xcb;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_video,
  gst124_vulkan,
  gst124_gl,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}

  {$IFDEF LINUX}
  {$include gst/vulkan/xcb/gstvkdisplay_xcb.inc}
  {$ENDIF}

  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}

{$IFDEF LINUX}
{$include gst/vulkan/xcb/gstvkdisplay_xcb.inc}
{$ENDIF}

{$UNDEF read_implementation}

end.
