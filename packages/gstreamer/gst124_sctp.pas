unit gst124_sctp;

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
{$include gst/sctp/sctpreceivemeta.inc}
{$include gst/sctp/sctpsendmeta.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/sctp/sctpreceivemeta.inc}
{$include gst/sctp/sctpsendmeta.inc}
{$UNDEF read_implementation}

end.
