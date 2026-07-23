unit fp_gst_webrtc;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
  fp_gst_sdp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$DEFINE read_interface}
{$include gst/webrtc/webrtc_enumtypes.inc}
{$include gst/webrtc/rtptransceiver.inc}
{$include gst/webrtc/sctptransport.inc}
{$include gst/webrtc/datachannel.inc}
{$include gst/webrtc/dtlstransport.inc}
{$include gst/webrtc/rtpreceiver.inc}
{$include gst/webrtc/webrtc_fwd.inc}
{$include gst/webrtc/icetransport.inc}
{$include gst/webrtc/icestream.inc}
{$include gst/webrtc/ice.inc}
{$include gst/webrtc/rtcsessiondescription.inc}
{$include gst/webrtc/rtpsender.inc}

{$include gst/webrtc/nice/nice.inc}
{$include gst/webrtc/nice/nicestream.inc}
{$include gst/webrtc/nice/nicetransport.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/webrtc/webrtc_enumtypes.inc}
{$include gst/webrtc/rtptransceiver.inc}
{$include gst/webrtc/sctptransport.inc}
{$include gst/webrtc/datachannel.inc}
{$include gst/webrtc/dtlstransport.inc}
{$include gst/webrtc/rtpreceiver.inc}
{$include gst/webrtc/webrtc_fwd.inc}
{$include gst/webrtc/icetransport.inc}
{$include gst/webrtc/icestream.inc}
{$include gst/webrtc/ice.inc}
{$include gst/webrtc/rtcsessiondescription.inc}
{$include gst/webrtc/rtpsender.inc}

{$include gst/webrtc/nice/nice.inc}
{$include gst/webrtc/nice/nicestream.inc}
{$include gst/webrtc/nice/nicetransport.inc}
{$UNDEF read_implementation}

end.
