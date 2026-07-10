unit fp_gst_isoff;

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
{$include gst/isoff/gstisoff.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/isoff/gstisoff.inc}
{$UNDEF read_implementation}

end.
