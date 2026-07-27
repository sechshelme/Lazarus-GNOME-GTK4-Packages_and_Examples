unit fp_gst_transcoder;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_pbutils;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PGstTranscoder = type Pointer;



  {$DEFINE read_interface}
  {$include gst/transcoder/transcoder_enumtypes.inc}
  {$include gst/transcoder/gsttranscoder_signal_adapter.inc}
  {$include gst/transcoder/gsttranscoder.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/transcoder/transcoder_enumtypes.inc}
{$include gst/transcoder/gsttranscoder_signal_adapter.inc}
{$include gst/transcoder/gsttranscoder.inc}
{$UNDEF read_implementation}

end.
