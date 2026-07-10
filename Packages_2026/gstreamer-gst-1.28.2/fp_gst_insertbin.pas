unit fp_gst_insertbin;

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
  {$include gst/insertbin/gstinsertbin.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/insertbin/gstinsertbin.inc}
{$UNDEF read_implementation}

end.
