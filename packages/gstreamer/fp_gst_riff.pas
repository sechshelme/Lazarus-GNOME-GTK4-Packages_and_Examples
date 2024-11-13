unit fp_gst_riff;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
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
