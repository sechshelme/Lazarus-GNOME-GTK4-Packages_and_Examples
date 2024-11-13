unit fp_gst_sdp;

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
  {$include gst/sdp/gstmikey.inc}                        // io.
  {$include gst/sdp/gstsdp.inc}                          // io.
  {$include gst/sdp/gstsdpmessage.inc}                   // io. -> gstsdp, gstmikey
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/sdp/gstmikey.inc}                        // io.
{$include gst/sdp/gstsdp.inc}                          // io.
{$include gst/sdp/gstsdpmessage.inc}                   // io. -> gstsdp, gstmikey
{$UNDEF read_implementation}

end.
