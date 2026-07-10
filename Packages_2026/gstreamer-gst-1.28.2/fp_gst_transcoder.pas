unit fp_gst_transcoder;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_pbutils,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/transcoder/gsttranscoder.inc}                // io.
{$include gst/transcoder/gsttranscoder_signal_adapter.inc} // io. -> gsttranscoder
{$include gst/transcoder/transcoder_enumtypes.inc}         // io.
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/transcoder/gsttranscoder.inc}                // io.
{$include gst/transcoder/gsttranscoder_signal_adapter.inc} // io. -> gsttranscoder
{$include gst/transcoder/transcoder_enumtypes.inc}         // io.
{$UNDEF read_implementation}

end.
