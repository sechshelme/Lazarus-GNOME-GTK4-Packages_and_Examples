unit fp_gst_base;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/base/gstadapter.inc}
  {$include gst/base/gstaggregator.inc}
  {$include gst/base/gstbaseparse.inc}
  {$include gst/base/gstbasesink.inc}
  {$include gst/base/gstbasesrc.inc}
  {$include gst/base/gstbasetransform.inc}
  {$include gst/base/gstbitreader.inc}
  {$include gst/base/gstbitwriter.inc}
  {$include gst/base/gstbytereader.inc}
  {$include gst/base/gstbytewriter.inc}
  {$include gst/base/gstcollectpads.inc}
  {$include gst/base/gstdataqueue.inc}
  {$include gst/base/gstflowcombiner.inc}
  {$include gst/base/gstpushsrc.inc}
  {$include gst/base/gstqueuearray.inc}
  {$include gst/base/gsttypefindhelper.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/base/gstadapter.inc}
{$include gst/base/gstaggregator.inc}
{$include gst/base/gstbaseparse.inc}
{$include gst/base/gstbasesink.inc}
{$include gst/base/gstbasesrc.inc}
{$include gst/base/gstbasetransform.inc}
{$include gst/base/gstbitreader.inc}
{$include gst/base/gstbitwriter.inc}
{$include gst/base/gstbytereader.inc}
{$include gst/base/gstbytewriter.inc}
{$include gst/base/gstcollectpads.inc}
{$include gst/base/gstdataqueue.inc}
{$include gst/base/gstflowcombiner.inc}
{$include gst/base/gstpushsrc.inc}
{$include gst/base/gstqueuearray.inc}
{$include gst/base/gsttypefindhelper.inc}
{$UNDEF read_implementation}

end.
