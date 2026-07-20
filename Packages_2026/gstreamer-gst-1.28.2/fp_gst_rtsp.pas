unit fp_gst_rtsp;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_sdp;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/rtsp/gstrtspdefs.inc}
  {$include gst/rtsp/gstrtsp_enumtypes.inc}
  {$include gst/rtsp/gstrtspmessage.inc}
  {$include gst/rtsp/gstrtsprange.inc}
  {$include gst/rtsp/gstrtsptransport.inc}
  {$include gst/rtsp/gstrtspurl.inc}
  {$include gst/rtsp/gstrtspconnection.inc}
  {$include gst/rtsp/gstrtspextension.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/rtsp/gstrtspdefs.inc}
{$include gst/rtsp/gstrtsp_enumtypes.inc}
{$include gst/rtsp/gstrtspmessage.inc}
{$include gst/rtsp/gstrtsprange.inc}
{$include gst/rtsp/gstrtsptransport.inc}
{$include gst/rtsp/gstrtspurl.inc}
{$include gst/rtsp/gstrtspconnection.inc}
{$include gst/rtsp/gstrtspextension.inc}
{$UNDEF read_implementation}

end.
