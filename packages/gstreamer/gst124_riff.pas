unit gst124_riff;

interface

uses
  glib280,
  gst124,
  gst124_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/riff/riff_ids.inc}
{$include gst/riff/riff_read.inc}
{$include gst/riff/riff_media.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/riff/riff_ids.inc}
{$include gst/riff/riff_read.inc}
{$include gst/riff/riff_media.inc}
{$UNDEF read_implementation}

end.
