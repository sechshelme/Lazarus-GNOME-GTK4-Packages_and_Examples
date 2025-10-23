unit fp_gst_vulkan_xcb;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_vulkan;


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
