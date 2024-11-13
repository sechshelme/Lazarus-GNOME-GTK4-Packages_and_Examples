unit fp_gst_mpegts;

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
{$include  gst/mpegts/mpegts.inc}                          // io.
{$include  gst/mpegts/gstmpegts_enumtypes.inc}             // io.
{$include  gst/mpegts/gst_atsc_descriptor.inc}             // io.
{$include  gst/mpegts/gstmpegtssection.inc}                // io.
{$include  gst/mpegts/gst_atsc_section.inc}                // io. -> gstmpegtssection
{$include  gst/mpegts/gst_dvb_section.inc}                 // io. -> gstmpegtssection
{$include  gst/mpegts/gst_scte_section.inc}                // io. -> gstmpegtssection
{$include  gst/mpegts/gst_metadata_descriptor.inc}         // io.
{$include  gst/mpegts/gstmpegtsdescriptor.inc}             // io. -> gst_metadata_descriptor
{$include  gst/mpegts/gst_dvb_descriptor.inc}              // io. -> gstmpegtsdescriptor
{$include  gst/mpegts/gst_hdmv_section.inc}                // io.
{$include  gst/mpegts/gst_isdb_descriptor.inc}             // io.
{$include  gst/mpegts/gst_mpegtspesmetadatameta.inc}       // io.
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include  gst/mpegts/mpegts.inc}                          // io.
{$include  gst/mpegts/gstmpegts_enumtypes.inc}             // io.
{$include  gst/mpegts/gst_atsc_descriptor.inc}             // io.
{$include  gst/mpegts/gstmpegtssection.inc}                // io.
{$include  gst/mpegts/gst_atsc_section.inc}                // io. -> gstmpegtssection
{$include  gst/mpegts/gst_dvb_section.inc}                 // io. -> gstmpegtssection
{$include  gst/mpegts/gst_scte_section.inc}                // io. -> gstmpegtssection
{$include  gst/mpegts/gst_metadata_descriptor.inc}         // io.
{$include  gst/mpegts/gstmpegtsdescriptor.inc}             // io. -> gst_metadata_descriptor
{$include  gst/mpegts/gst_dvb_descriptor.inc}              // io. -> gstmpegtsdescriptor
{$include  gst/mpegts/gst_hdmv_section.inc}                // io.
{$include  gst/mpegts/gst_isdb_descriptor.inc}             // io.
{$include  gst/mpegts/gst_mpegtspesmetadatameta.inc}       // io.
{$UNDEF read_implementation}

end.
