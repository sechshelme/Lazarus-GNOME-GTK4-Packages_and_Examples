unit fp_gst_tag;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_base,
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
