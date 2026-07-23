unit fp_gst_analytics;

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
  {$include gst/analytics/gstanalyticsbatchmeta.inc}
  {$include gst/analytics/gstanalyticsmeta.inc}
  {$include gst/analytics/gstanalyticsclassificationmtd.inc}
  {$include gst/analytics/gstanalytics_image_util.inc}
  {$include gst/analytics/gstanalyticsobjectdetectionmtd.inc}
  {$include gst/analytics/gstanalyticsobjecttrackingmtd.inc}
  {$include gst/analytics/gstanalyticssegmentationmtd.inc}
  {$include gst/analytics/gsttensor.inc}
  {$include gst/analytics/gstanalyticstensormtd.inc}
  {$include gst/analytics/gsttensormeta.inc}
  {$include gst/analytics/modelinfo.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/analytics/gstanalyticsbatchmeta.inc}
{$include gst/analytics/gstanalyticsmeta.inc}
{$include gst/analytics/gstanalyticsclassificationmtd.inc}
{$include gst/analytics/gstanalytics_image_util.inc}
{$include gst/analytics/gstanalyticsobjectdetectionmtd.inc}
{$include gst/analytics/gstanalyticsobjecttrackingmtd.inc}
{$include gst/analytics/gstanalyticssegmentationmtd.inc}
{$include gst/analytics/gsttensor.inc}
{$include gst/analytics/gstanalyticstensormtd.inc}
{$include gst/analytics/gsttensormeta.inc}
{$include gst/analytics/modelinfo.inc}
{$UNDEF read_implementation}

end.
