unit gst124_vulkan_wayland;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_video,
  gst124_vulkan,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/vulkan/wayland/gstvkdisplay_wayland.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/vulkan/wayland/gstvkdisplay_wayland.inc}
{$UNDEF read_implementation}

end.
