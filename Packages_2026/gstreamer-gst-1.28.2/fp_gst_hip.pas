unit fp_gst_hip;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/hip/gsthip_enums.inc}
  {$include gst/hip/gsthipevent.inc}
  {$include gst/hip/gsthipstream.inc}
  {$include gst/hip/gsthipdevice.inc}
  {$include gst/hip/gsthipbufferpool.inc}
  {$include gst/hip/gsthip_interop.inc}
  {$include gst/hip/gsthip_interop_gl.inc}
  {$include gst/hip/gsthiploader.inc}
  {$include gst/hip/gsthipmemory.inc}
  {$include gst/hip/gsthiprtc.inc}
  {$include gst/hip/gsthiputils.inc}
  {$include gst/hip/hip_gst.inc}
  {$include gst/hip/hip_gst_gl.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/hip/gsthip_enums.inc}
{$include gst/hip/gsthipevent.inc}
{$include gst/hip/gsthipstream.inc}
{$include gst/hip/gsthipdevice.inc}
{$include gst/hip/gsthipbufferpool.inc}
{$include gst/hip/gsthip_interop.inc}
{$include gst/hip/gsthip_interop_gl.inc}
{$include gst/hip/gsthiploader.inc}
{$include gst/hip/gsthipmemory.inc}
{$include gst/hip/gsthiprtc.inc}
{$include gst/hip/gsthiputils.inc}
{$include gst/hip/hip_gst.inc}
{$include gst/hip/hip_gst_gl.inc}
{$UNDEF read_implementation}

end.
