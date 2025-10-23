unit fp_gst_base;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_base
const
  GST_VIDEO_MAX_PLANES = 4;
  GST_VIDEO_MAX_COMPONENTS = 4;

  {$DEFINE read_interface}
  {$include gst/base/gstaggregator.inc}// io.
  {$include gst/base/gstcollectpads.inc}// io.
  {$include gst/base/gstadapter.inc}// io.
  {$include gst/base/gstbaseparse.inc}// io.
  {$include gst/base/gstbasetransform.inc}// io.
  {$include gst/base/gstbasesrc.inc}// io.
  {$include gst/base/gstpushsrc.inc}// io. -> gstbasesrc
  {$include gst/base/gstbasesink.inc}// io.
  {$include gst/base/gstdataqueue.inc}// io.
  {$include gst/base/gstqueuearray.inc}// io.
  {$include gst/base/gsttypefindhelper.inc}// io.
  {$include gst/base/gstflowcombiner.inc}// io.
  {$include gst/base/gstbitreader.inc}// io.      viele Makros entfernt
  {$include gst/base/gstbitwriter.inc}// io.      viele Makros entfernt
  {$include gst/base/gstbytereader.inc}// io. -> gstbytewriter     viele Makros entfernt
  {$include gst/base/gstbytewriter.inc}// io.      viele Makros entfernt
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/base/gstaggregator.inc}// io.
{$include gst/base/gstcollectpads.inc}// io.
{$include gst/base/gstadapter.inc}// io.
{$include gst/base/gstbaseparse.inc}// io.
{$include gst/base/gstbasetransform.inc}// io.
{$include gst/base/gstbasesrc.inc}// io.
{$include gst/base/gstpushsrc.inc}// io. -> gstbasesrc
{$include gst/base/gstbasesink.inc}// io.
{$include gst/base/gstdataqueue.inc}// io.
{$include gst/base/gstqueuearray.inc}// io.
{$include gst/base/gsttypefindhelper.inc}// io.
{$include gst/base/gstflowcombiner.inc}// io.
{$include gst/base/gstbitreader.inc}// io.      viele Makros entfernt
{$include gst/base/gstbitwriter.inc}// io.      viele Makros entfernt
{$include gst/base/gstbytereader.inc}// io. -> gstbytewriter     viele Makros entfernt
{$include gst/base/gstbytewriter.inc}// io.      viele Makros entfernt
{$UNDEF read_implementation}

end.
