unit gst124_analytics;

interface

uses
  glib280,
  gst124,
  gst124_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/analytics/gstanalyticsmeta.inc}                  // io.
  {$include gst/analytics/gstanalyticsclassificationmtd.inc}     // io. -> gstanalyticsmeta
  {$include gst/analytics/gstanalyticsobjectdetectionmtd.inc}    // io. -> gstanalyticsmeta
  {$include gst/analytics/gstanalyticsobjecttrackingmtd.inc}     // io. -> gstanalyticsmeta
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/analytics/gstanalyticsmeta.inc}                  // io.
{$include gst/analytics/gstanalyticsclassificationmtd.inc}     // io. -> gstanalyticsmeta
{$include gst/analytics/gstanalyticsobjectdetectionmtd.inc}    // io. -> gstanalyticsmeta
{$include gst/analytics/gstanalyticsobjecttrackingmtd.inc}     // io. -> gstanalyticsmeta
{$UNDEF read_interface}
{$UNDEF read_implementation}

end.
