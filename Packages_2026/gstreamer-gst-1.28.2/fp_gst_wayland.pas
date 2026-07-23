unit fp_gst_wayland;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/wayland/gstwloutput.inc}
  {$include gst/wayland/gstwldisplay.inc}
  {$include gst/wayland/gstwlbuffer.inc}
  {$include gst/wayland/gstwlcontext.inc}
  {$include gst/wayland/gstwllinuxdmabuf.inc}
  {$include gst/wayland/gstwlshmallocator.inc}
  {$include gst/wayland/gstwlvideobufferpool.inc}
  {$include gst/wayland/gstwlvideoformat.inc}
  {$include gst/wayland/gstwlwindow.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/wayland/gstwloutput.inc}
{$include gst/wayland/gstwldisplay.inc}
{$include gst/wayland/gstwlbuffer.inc}
{$include gst/wayland/gstwlcontext.inc}
{$include gst/wayland/gstwllinuxdmabuf.inc}
{$include gst/wayland/gstwlshmallocator.inc}
{$include gst/wayland/gstwlvideobufferpool.inc}
{$include gst/wayland/gstwlvideoformat.inc}
{$include gst/wayland/gstwlwindow.inc}
{$UNDEF read_implementation}

end.
