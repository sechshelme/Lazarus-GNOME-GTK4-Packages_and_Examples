unit fp_gst_fft;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/fft/gstfft.inc}
{$include gst/fft/gstfftf32.inc}
{$include gst/fft/gstfftf64.inc}
{$include gst/fft/gstffts16.inc}
{$include gst/fft/gstffts32.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/fft/gstfft.inc}
{$include gst/fft/gstfftf32.inc}
{$include gst/fft/gstfftf64.inc}
{$include gst/fft/gstffts16.inc}
{$include gst/fft/gstffts32.inc}
{$UNDEF read_implementation}

end.
