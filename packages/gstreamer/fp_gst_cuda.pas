unit fp_gst_cuda;

interface

uses
  {$IFDEF WINDOWS}
  windows,
  {$ENDIF}
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
{$include gst/cuda/gstcudanvrtc.inc}        // io.
{$include gst/cuda/gstcudaloader.inc}       // io.
{$include gst/cuda/gstcudacontext.inc}      // io.
{$include gst/cuda/gstcudastream.inc}       // io. -> gstcudacontext
{$include gst/cuda/gstcudamemory.inc}       // io. -> gstcudacontext, gstcudastream
{$include gst/cuda/gstcudabufferpool.inc}   // io. -> gstcudacontext, gstcudastream, gstcudamemory
{$include gst/cuda/gstcudautils.inc}        // io. -> gstcudacontext
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/cuda/gstcudanvrtc.inc}        // io.
{$include gst/cuda/gstcudaloader.inc}       // io.
{$include gst/cuda/gstcudacontext.inc}      // io.
{$include gst/cuda/gstcudastream.inc}       // io. -> gstcudacontext
{$include gst/cuda/gstcudamemory.inc}       // io. -> gstcudacontext, gstcudastream
{$include gst/cuda/gstcudabufferpool.inc}   // io. -> gstcudacontext, gstcudastream, gstcudamemory
{$include gst/cuda/gstcudautils.inc}        // io. -> gstcudacontext
{$UNDEF read_implementation}

end.
