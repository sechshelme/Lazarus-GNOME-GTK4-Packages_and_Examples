unit fp_gst_gl_egl;

interface

uses
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

{$DEFINE read_interface}
{$include gst/gl/egl/gstegl.inc}                   // io.
{$include gst/gl/egl/gstgldisplay_egl.inc}         // io.
{$include gst/gl/egl/gstgldisplay_egl_device.inc}  // io. -> gstgldisplay_egl
{$include gst/gl/egl/gsteglimage.inc}              // io.
{$include gst/gl/egl/gstglmemoryegl.inc}           // io. -> gsteglimage
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/gl/egl/gstegl.inc}                   // io.
{$include gst/gl/egl/gstgldisplay_egl.inc}         // io.
{$include gst/gl/egl/gstgldisplay_egl_device.inc}  // io. -> gstgldisplay_egl
{$include gst/gl/egl/gsteglimage.inc}              // io.
{$include gst/gl/egl/gstglmemoryegl.inc}           // io. -> gsteglimage
{$UNDEF read_implementation}

end.
