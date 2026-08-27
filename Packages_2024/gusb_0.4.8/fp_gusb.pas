unit fp_gusb;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libgusb = 'gusb';
  {$ENDIF}

  {$IFDEF Windows}
  libgusb = 'libgusb-2.dll';
  {$ENDIF}

  type
  PJsonObject=type Pointer;
  PJsonBuilder=type Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gusb/gusb_version.inc}
  {$include gusb/gusb_interface.inc}
  {$include gusb/gusb_bos_descriptor.inc}
  {$include gusb/gusb_device.inc}
  {$include gusb/gusb_source.inc}
  {$include gusb/gusb_context.inc}
  {$include gusb/gusb_device_event.inc}
  {$include gusb/gusb_device_list.inc}
  {$include gusb/gusb_endpoint.inc}
  {$include gusb/gusb_util.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gusb/gusb_version.inc}
{$include gusb/gusb_interface.inc}
{$include gusb/gusb_bos_descriptor.inc}
{$include gusb/gusb_device.inc}
{$include gusb/gusb_source.inc}
{$include gusb/gusb_context.inc}
{$include gusb/gusb_device_event.inc}
{$include gusb/gusb_device_list.inc}
{$include gusb/gusb_endpoint.inc}
{$include gusb/gusb_util.inc}
{$UNDEF read_implementation}

end.

