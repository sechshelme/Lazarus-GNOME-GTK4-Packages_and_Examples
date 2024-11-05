unit gst124_base;

interface

uses
  glib280,
  gst124,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // === GST_base
const
  GST_VIDEO_MAX_PLANES = 4;
  GST_VIDEO_MAX_COMPONENTS = 4;

type
  Tguint8_arr_256 = array[0..255] of Tguint8;

  Tgintarr18 = array[0..17] of Tgint;
  Tguintarr4 = array[0..3] of Tguint;
  Tguintarr16 = array[0..15] of Tguint;
  Tguint8arr16 = array[0..15] of Tguint8;
  Tguint8arr64 = array[0..63] of Tguint8;
  Tgfloatarr16 = array[0..15] of Tgfloat;

  Tplanes_Pointer_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgpointer;
  Tplanes_int_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgint;
  Tplanes_uint_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tguint;
  Tcomp_int_arr = array[0..(GST_VIDEO_MAX_COMPONENTS) - 1] of Tgint;
  Tplanes_size_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tgsize;

  Tplanes_GstMemory_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of PGstMemory;
  Tplanes_Tuintptr_t_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of Tuintptr_t;

  Tplanes_TVKFormat_arr = array[0..(GST_VIDEO_MAX_PLANES) - 1] of TVkFormat;


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
