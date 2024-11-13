unit fp_gst_webrtc_nice;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  fp_gst_sdp,
  fp_gst_webrtc,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/webrtc/nice/nice.inc}                            // io. -> ice
{$include gst/webrtc/nice/nicestream.inc}                      // io. -> icestream, webrtc_fwd, ice
{$include gst/webrtc/nice/nicetransport.inc}                   // io. -> icetransport, nicestream, webrtc_fwd
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/webrtc/nice/nice.inc}                            // io. -> ice
{$include gst/webrtc/nice/nicestream.inc}                      // io. -> icestream, webrtc_fwd, ice
{$include gst/webrtc/nice/nicetransport.inc}                   // io. -> icetransport, nicestream, webrtc_fwd
{$UNDEF read_interface}
{$UNDEF read_implementation}

end.
