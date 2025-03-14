unit fp_gst_mse;

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
  {$include gst/mse/mse_enumtypes.inc}
  {$include gst/mse/gstmsesrc.inc}
  {$include gst/mse/gstsourcebuffer.inc}
  {$include gst/mse/gstsourcebufferlist.inc}     // io. -> gstsourcebuffer
  {$include gst/mse/gstmediasource.inc}          // io. -> gstsourcebufferlist, gstsourcebuffer, gstmsesrc
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/mse/mse_enumtypes.inc}
{$include gst/mse/gstmsesrc.inc}
{$include gst/mse/gstsourcebuffer.inc}
{$include gst/mse/gstsourcebufferlist.inc}     // io. -> gstsourcebuffer
{$include gst/mse/gstmediasource.inc}          // io. -> gstsourcebufferlist, gstsourcebuffer, gstmsesrc
{$UNDEF read_implementation}

end.
