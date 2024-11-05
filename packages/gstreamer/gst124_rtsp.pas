unit gst124_rtsp;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_sdp,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/rtsp/gstrtspdefs.inc}                  // io.
  {$include gst/rtsp/gstrtsp_enumtypes.inc}            // io.
  {$include gst/rtsp/gstrtspmessage.inc}               // io. -> gstrtspdefs
  {$include gst/rtsp/gstrtsprange.inc}                 // io. -> gstrtspdefs
  {$include gst/rtsp/gstrtsptransport.inc}             // io. -> gstrtspdefs
  {$include gst/rtsp/gstrtspurl.inc}                   // io. -> gstrtsptransport, gstrtspdefs
  {$include gst/rtsp/gstrtspconnection.inc}            // io. -> gstrtspurl, gstrtspdefs, gstrtspmessage
  {$include gst/rtsp/gstrtspextension.inc}             // io. -> gstrtspmessage, gstrtspdefs, gstrtsptransport, gstrtspurl
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/rtsp/gstrtspdefs.inc}                  // io.
{$include gst/rtsp/gstrtsp_enumtypes.inc}            // io.
{$include gst/rtsp/gstrtspmessage.inc}               // io. -> gstrtspdefs
{$include gst/rtsp/gstrtsprange.inc}                 // io. -> gstrtspdefs
{$include gst/rtsp/gstrtsptransport.inc}             // io. -> gstrtspdefs
{$include gst/rtsp/gstrtspurl.inc}                   // io. -> gstrtsptransport, gstrtspdefs
{$include gst/rtsp/gstrtspconnection.inc}            // io. -> gstrtspurl, gstrtspdefs, gstrtspmessage
{$include gst/rtsp/gstrtspextension.inc}             // io. -> gstrtspmessage, gstrtspdefs, gstrtsptransport, gstrtspurl
{$UNDEF read_implementation}

end.
