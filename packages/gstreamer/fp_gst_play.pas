unit fp_gst_play;

interface

uses
  glib280,
  fp_gst,
  fp_gst_base,
  fp_gst_video,
  Strings,
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/play/gstplay.inc}                                  // io.
  {$include gst/play/gstplay_visualization.inc}                    // io.
  {$include gst/play/gstplay_media_info.inc}                       // io. -> gstplay
  {$include gst/play/gstplay_signal_adapter.inc}                   // io. -> gstplay
  {$include gst/play/gstplay_video_overlay_video_renderer.inc}     // io. -> gstplay
  {$include gst/play/gstplay_video_renderer.inc}                   // io. -> gstplay
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/play/gstplay.inc}                                  // io.
{$include gst/play/gstplay_visualization.inc}                    // io.
{$include gst/play/gstplay_media_info.inc}                       // io. -> gstplay
{$include gst/play/gstplay_signal_adapter.inc}                   // io. -> gstplay
{$include gst/play/gstplay_video_overlay_video_renderer.inc}     // io. -> gstplay
{$include gst/play/gstplay_video_renderer.inc}                   // io. -> gstplay
{$UNDEF read_implementation}

end.
