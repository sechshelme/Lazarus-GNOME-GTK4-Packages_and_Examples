unit gst124_tag;

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
{$include gst/tag/gsttagdemux.inc}
{$include gst/tag/gsttagmux.inc}
{$include gst/tag/tag.inc}
{$include gst/tag/tag_enumtypes.inc}
{$include gst/tag/xmpwriter.inc}
{$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/tag/gsttagdemux.inc}
{$include gst/tag/gsttagmux.inc}
{$include gst/tag/tag.inc}
{$include gst/tag/tag_enumtypes.inc}
{$include gst/tag/xmpwriter.inc}
{$UNDEF read_implementation}

end.
