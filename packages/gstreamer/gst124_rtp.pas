unit gst124_rtp;

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
  {$include gst/rtp/gstrtp_enumtypes.inc}           // io.
  {$include gst/rtp/gstrtcpbuffer.inc}              // io.
  {$include gst/rtp/gstrtpbasepayload.inc}          // io.
  {$include gst/rtp/gstrtpbaseaudiopayload.inc}     // io. -> gstrtpbasepayload
  {$include gst/rtp/gstrtpbuffer.inc}               // io.
  {$include gst/rtp/gstrtpbasedepayload.inc}        // io. -> gstrtpbuffer
  {$include gst/rtp/gstrtpdefs.inc}                 // io.
  {$include gst/rtp/gstrtphdrext.inc}               // io.
  {$include gst/rtp/gstrtpmeta.inc}                 // io.
  {$include gst/rtp/gstrtppayloads.inc}             // io.
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/rtp/gstrtp_enumtypes.inc}           // io.
{$include gst/rtp/gstrtcpbuffer.inc}              // io.
{$include gst/rtp/gstrtpbasepayload.inc}          // io.
{$include gst/rtp/gstrtpbaseaudiopayload.inc}     // io. -> gstrtpbasepayload
{$include gst/rtp/gstrtpbuffer.inc}               // io.
{$include gst/rtp/gstrtpbasedepayload.inc}        // io. -> gstrtpbuffer
{$include gst/rtp/gstrtpdefs.inc}                 // io.
{$include gst/rtp/gstrtphdrext.inc}               // io.
{$include gst/rtp/gstrtpmeta.inc}                 // io.
{$include gst/rtp/gstrtppayloads.inc}             // io.
{$UNDEF read_implementation}

end.
