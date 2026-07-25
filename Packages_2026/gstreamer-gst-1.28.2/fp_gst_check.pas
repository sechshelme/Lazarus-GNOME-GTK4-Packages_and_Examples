unit fp_gst_check;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PSuite = type Pointer;
  PTCase = type Pointer;
  PSRunner = type Pointer;

  {$DEFINE read_interface}
  {$include gst/check/gstcheck.inc}
  {$include gst/check/gstbufferstraw.inc}
  {$include gst/check/gstconsistencychecker.inc}
  {$include gst/check/gsttestclock.inc}
  {$include gst/check/gstharness.inc}
  {$include gst/check/internal_check.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/check/gstcheck.inc}
{$include gst/check/gstbufferstraw.inc}
{$include gst/check/gstconsistencychecker.inc}
{$include gst/check/gsttestclock.inc}
{$include gst/check/gstharness.inc}
{$include gst/check/internal_check.inc}
{$UNDEF read_implementation}

end.
