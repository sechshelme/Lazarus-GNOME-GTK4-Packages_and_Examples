unit fp_gst_mpegts;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/mpegts/gstmpegts_enumtypes.inc}
  {$include gst/mpegts/gst_atsc_descriptor.inc}
  {$include gst/mpegts/gstmpegtssection.inc}
  {$include gst/mpegts/gst_atsc_section.inc}
  {$include gst/mpegts/gstmpegtsdescriptor.inc}
  {$include gst/mpegts/gst_dvb_descriptor.inc}
  {$include gst/mpegts/gst_dvb_section.inc}
  {$include gst/mpegts/gst_hdmv_section.inc}
  {$include gst/mpegts/gst_isdb_descriptor.inc}
  {$include gst/mpegts/gst_scte_section.inc}
  {$include gst/mpegts/mpegts.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/mpegts/gstmpegts_enumtypes.inc}
{$include gst/mpegts/gst_atsc_descriptor.inc}
{$include gst/mpegts/gstmpegtssection.inc}
{$include gst/mpegts/gst_atsc_section.inc}
{$include gst/mpegts/gstmpegtsdescriptor.inc}
{$include gst/mpegts/gst_dvb_descriptor.inc}
{$include gst/mpegts/gst_dvb_section.inc}
{$include gst/mpegts/gst_hdmv_section.inc}
{$include gst/mpegts/gst_isdb_descriptor.inc}
{$include gst/mpegts/gst_scte_section.inc}
{$include gst/mpegts/mpegts.inc}
{$UNDEF read_implementation}

end.
