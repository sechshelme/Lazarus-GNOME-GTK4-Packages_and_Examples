unit gst124_insertbin;

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
  {$include gst/insertbin/gstinsertbin.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/insertbin/gstinsertbin.inc}
{$UNDEF read_implementation}

end.
