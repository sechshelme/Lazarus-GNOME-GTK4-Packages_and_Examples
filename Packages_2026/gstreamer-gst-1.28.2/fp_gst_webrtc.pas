unit fp_gst_webrtc;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_sdp,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/webrtc/webrtc_enumtypes.inc}                // io.
{$include gst/webrtc/rtptransceiver.inc}                  // io.
{$include gst/webrtc/sctptransport.inc}                   // io.
{$include gst/webrtc/datachannel.inc}                     // io.
{$include gst/webrtc/dtlstransport.inc}                   // io.
{$include gst/webrtc/rtpreceiver.inc}                     // io.
{$include gst/webrtc/webrtc_fwd.inc}                      // io.
{$include gst/webrtc/icetransport.inc}                    // io. -> webrtc_fwd
{$include gst/webrtc/icestream.inc}                       // io. -> webrtc_fwd, icetransport
{$include gst/webrtc/ice.inc}                             // io. -> webrtc_fwd, icestream, icetransport
{$include gst/webrtc/rtcsessiondescription.inc}           // io. -> webrtc_fwd
{$include gst/webrtc/rtpsender.inc}                       // io. -> webrtc_enumtypes, webrtc_fwd
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/webrtc/webrtc_enumtypes.inc}                // io.
{$include gst/webrtc/rtptransceiver.inc}                  // io.
{$include gst/webrtc/sctptransport.inc}                   // io.
{$include gst/webrtc/datachannel.inc}                     // io.
{$include gst/webrtc/dtlstransport.inc}                   // io.
{$include gst/webrtc/rtpreceiver.inc}                     // io.
{$include gst/webrtc/webrtc_fwd.inc}                      // io.
{$include gst/webrtc/icetransport.inc}                    // io. -> webrtc_fwd
{$include gst/webrtc/icestream.inc}                       // io. -> webrtc_fwd, icetransport
{$include gst/webrtc/ice.inc}                             // io. -> webrtc_fwd, icestream, icetransport
{$include gst/webrtc/rtcsessiondescription.inc}           // io. -> webrtc_fwd
{$include gst/webrtc/rtpsender.inc}                       // io. -> webrtc_enumtypes, webrtc_fwd
{$UNDEF read_implementation}

end.
