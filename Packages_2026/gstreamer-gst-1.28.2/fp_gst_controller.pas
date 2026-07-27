unit fp_gst_controller;

interface

uses
  fp_glib2,
  fp_gst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/controller/controller_enumtypes.inc}
  {$include gst/controller/gstargbcontrolbinding.inc}
  {$include gst/controller/gstdirectcontrolbinding.inc}
  {$include gst/controller/gstlfocontrolsource.inc}
  {$include gst/controller/gstproxycontrolbinding.inc}
  {$include gst/controller/gsttimedvaluecontrolsource.inc}
  {$include gst/controller/gstinterpolationcontrolsource.inc}
  {$include gst/controller/gsttriggercontrolsource.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/controller/controller_enumtypes.inc}
{$include gst/controller/gstargbcontrolbinding.inc}
{$include gst/controller/gstdirectcontrolbinding.inc}
{$include gst/controller/gstlfocontrolsource.inc}
{$include gst/controller/gstproxycontrolbinding.inc}
{$include gst/controller/gsttimedvaluecontrolsource.inc}
{$include gst/controller/gstinterpolationcontrolsource.inc}
{$include gst/controller/gsttriggercontrolsource.inc}
{$UNDEF read_implementation}

end.
