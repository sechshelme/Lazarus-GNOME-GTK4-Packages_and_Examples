unit fp_gst_codecparsers;

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
{$include gst/codecparsers/gstav1parser.inc}
{$include gst/codecparsers/gsth264parser.inc}
{$include gst/codecparsers/gsth265parser.inc}
{$include gst/codecparsers/gstjpeg2000sampling.inc}
{$include gst/codecparsers/gstjpegparser.inc}
{$include gst/codecparsers/gstmpeg4parser.inc}
{$include gst/codecparsers/gstmpegvideoparser.inc}
{$include gst/codecparsers/gstmpegvideometa.inc}           // io. -> gstmpegvideoparser
{$include gst/codecparsers/gstvc1parser.inc}
{$include gst/codecparsers/gstvp8parser.inc}
{$include gst/codecparsers/gstvp8rangedecoder.inc}
{$include gst/codecparsers/gstvp9parser.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/codecparsers/gstav1parser.inc}
{$include gst/codecparsers/gsth264parser.inc}
{$include gst/codecparsers/gsth265parser.inc}
{$include gst/codecparsers/gstjpeg2000sampling.inc}
{$include gst/codecparsers/gstjpegparser.inc}
{$include gst/codecparsers/gstmpeg4parser.inc}
{$include gst/codecparsers/gstmpegvideoparser.inc}
{$include gst/codecparsers/gstmpegvideometa.inc}           // io. -> gstmpegvideoparser
{$include gst/codecparsers/gstvc1parser.inc}
{$include gst/codecparsers/gstvp8parser.inc}
{$include gst/codecparsers/gstvp8rangedecoder.inc}
{$include gst/codecparsers/gstvp9parser.inc}
{$UNDEF read_implementation}

end.
