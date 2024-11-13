unit fp_gst_net;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/net/gstnetaddressmeta.inc}
  {$include gst/net/gstnetclientclock.inc}
  {$include gst/net/gstnetcontrolmessagemeta.inc}
  {$include gst/net/gstnettimepacket.inc}
  {$include gst/net/gstnettimeprovider.inc}
  {$include gst/net/gstnetutils.inc}
  {$include gst/net/gstptpclock.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/net/gstnetaddressmeta.inc}
{$include gst/net/gstnetclientclock.inc}
{$include gst/net/gstnetcontrolmessagemeta.inc}
{$include gst/net/gstnettimepacket.inc}
{$include gst/net/gstnettimeprovider.inc}
{$include gst/net/gstnetutils.inc}
{$include gst/net/gstptpclock.inc}
{$UNDEF read_implementation}

end.
