unit fp_gst_vulkan_xcb;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  fp_gst_vulkan,
  fp_gst_gl,
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
