unit fp_gst_uridownloader;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/uridownloader/gstfragment.inc}
{$include gst/uridownloader/gsturidownloader.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/uridownloader/gstfragment.inc}
{$include gst/uridownloader/gsturidownloader.inc}
{$UNDEF read_implementation}

end.
