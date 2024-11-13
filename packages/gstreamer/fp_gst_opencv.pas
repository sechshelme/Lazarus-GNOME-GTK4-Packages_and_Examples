unit fp_gst_opencv;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/opencv/gstopencvutils.inc}
{$include gst/opencv/gstopencvvideofilter.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/opencv/gstopencvutils.inc}
{$include gst/opencv/gstopencvvideofilter.inc}
{$UNDEF read_implementation}

end.
