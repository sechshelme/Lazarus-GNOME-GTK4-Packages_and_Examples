unit fp_gst_rtp;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/rtp/gstrtp_enumtypes.inc}
  {$include gst/rtp/gstrtcpbuffer.inc}
  {$include gst/rtp/gstrtpbasepayload.inc}
  {$include gst/rtp/gstrtpbaseaudiopayload.inc}
  {$include gst/rtp/gstrtpbuffer.inc}
  {$include gst/rtp/gstrtpbasedepayload.inc}
  {$include gst/rtp/gstrtpdefs.inc}
  {$include gst/rtp/gstrtphdrext.inc}
  {$include gst/rtp/gstrtpmeta.inc}
  {$include gst/rtp/gstrtppayloads.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/rtp/gstrtp_enumtypes.inc}
{$include gst/rtp/gstrtcpbuffer.inc}
{$include gst/rtp/gstrtpbasepayload.inc}
{$include gst/rtp/gstrtpbaseaudiopayload.inc}
{$include gst/rtp/gstrtpbuffer.inc}
{$include gst/rtp/gstrtpbasedepayload.inc}
{$include gst/rtp/gstrtpdefs.inc}
{$include gst/rtp/gstrtphdrext.inc}
{$include gst/rtp/gstrtpmeta.inc}
{$include gst/rtp/gstrtppayloads.inc}
{$UNDEF read_implementation}

end.
