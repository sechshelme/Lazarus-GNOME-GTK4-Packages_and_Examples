unit fp_gst_sdp;

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
  {$include gst/sdp/gstmikey.inc}
  {$include gst/sdp/gstsdp.inc}
  {$include gst/sdp/gstsdpmessage.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/sdp/gstmikey.inc}
{$include gst/sdp/gstsdp.inc}
{$include gst/sdp/gstsdpmessage.inc}
{$UNDEF read_implementation}

end.
