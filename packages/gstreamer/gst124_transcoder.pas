unit gst124_transcoder;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_pbutils,
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
