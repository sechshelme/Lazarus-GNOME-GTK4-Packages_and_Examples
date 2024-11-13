unit fp_gst_vulkan_wayland;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  fp_gst_vulkan,
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
