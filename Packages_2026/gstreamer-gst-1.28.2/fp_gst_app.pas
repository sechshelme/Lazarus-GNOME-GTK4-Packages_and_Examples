unit fp_gst_app;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/app/app_enumtypes.inc}
{$include gst/app/gstappsrc.inc}
{$include gst/app/gstappsink.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/app/app_enumtypes.inc}
{$include gst/app/gstappsrc.inc}
{$include gst/app/gstappsink.inc}
{$UNDEF read_implementation}

end.
