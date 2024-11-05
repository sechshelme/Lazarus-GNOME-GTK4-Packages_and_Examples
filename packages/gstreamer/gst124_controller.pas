unit gst124_controller;

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
  {$include gst/controller/controller_enumtypes.inc}              // io.
  {$include gst/controller/gstargbcontrolbinding.inc}             // io.
  {$include gst/controller/gstdirectcontrolbinding.inc}           // io.
  {$include gst/controller/gstlfocontrolsource.inc}               // io.
  {$include gst/controller/gstproxycontrolbinding.inc}            // io.
  {$include gst/controller/gsttimedvaluecontrolsource.inc}        // io.
  {$include gst/controller/gstinterpolationcontrolsource.inc}     // io. -> gsttimedvaluecontrolsource
  {$include gst/controller/gsttriggercontrolsource.inc}           // io. -> gsttimedvaluecontrolsource
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/controller/controller_enumtypes.inc}              // io.
{$include gst/controller/gstargbcontrolbinding.inc}             // io.
{$include gst/controller/gstdirectcontrolbinding.inc}           // io.
{$include gst/controller/gstlfocontrolsource.inc}               // io.
{$include gst/controller/gstproxycontrolbinding.inc}            // io.
{$include gst/controller/gsttimedvaluecontrolsource.inc}        // io.
{$include gst/controller/gstinterpolationcontrolsource.inc}     // io. -> gsttimedvaluecontrolsource
{$include gst/controller/gsttriggercontrolsource.inc}           // io. -> gsttimedvaluecontrolsource
{$UNDEF read_implementation}

end.
