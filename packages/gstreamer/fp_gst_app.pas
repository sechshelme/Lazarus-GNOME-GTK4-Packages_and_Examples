unit fp_gst_app;

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
{$include gst/app/app_enumtypes.inc}
{$include gst/app/gstappsink.inc}
{$include gst/app/gstappsrc.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/app/app_enumtypes.inc}
{$include gst/app/gstappsink.inc}
{$include gst/app/gstappsrc.inc}
{$UNDEF read_implementation}

end.
