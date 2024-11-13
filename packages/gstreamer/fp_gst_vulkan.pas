unit fp_gst_vulkan;

interface

uses
  glib280,
  fp_gst,
  fp_gst_video,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_gst_vulkan_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_gst_vulkan_includes.inc}
{$UNDEF read_implementation}

end.
