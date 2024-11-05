unit gst124_wayland;

interface

uses
  glib280,
  gst124,
  gst124_base,
  gst124_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/wayland/gstwlcontext.inc}                   // io.
  {$include gst/wayland/gstwldisplay.inc}                   // io.
  {$include gst/wayland/gstwllinuxdmabuf.inc}               // io. -> gstwldisplay
  {$include gst/wayland/gstwlshmallocator.inc}              // io. -> gstwldisplay
  {$include gst/wayland/gstwlbuffer.inc}                    // io. -> gstwldisplay
  {$include gst/wayland/gstwlwindow.inc}                    // io. -> gstwldisplay, gstwlbuffer
  {$include gst/wayland/gstwlvideobufferpool.inc}           // io.
  {$include gst/wayland/gstwlvideoformat.inc}               // io.
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/wayland/gstwlcontext.inc}                   // io.
{$include gst/wayland/gstwldisplay.inc}                   // io.
{$include gst/wayland/gstwllinuxdmabuf.inc}               // io. -> gstwldisplay
{$include gst/wayland/gstwlshmallocator.inc}              // io. -> gstwldisplay
{$include gst/wayland/gstwlbuffer.inc}                    // io. -> gstwldisplay
{$include gst/wayland/gstwlwindow.inc}                    // io. -> gstwldisplay, gstwlbuffer
{$include gst/wayland/gstwlvideobufferpool.inc}           // io.
{$include gst/wayland/gstwlvideoformat.inc}               // io.
{$UNDEF read_implementation}

end.
