unit fp_gst_play;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/play/gstplay.inc}
  {$include gst/play/gstplay_visualization.inc}
  {$include gst/play/gstplay_media_info.inc}
  {$include gst/play/gstplay_signal_adapter.inc}
  {$include gst/play/gstplay_video_overlay_video_renderer.inc}
  {$include gst/play/gstplay_video_renderer.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/play/gstplay.inc}
{$include gst/play/gstplay_visualization.inc}
{$include gst/play/gstplay_media_info.inc}
{$include gst/play/gstplay_signal_adapter.inc}
{$include gst/play/gstplay_video_overlay_video_renderer.inc}
{$include gst/play/gstplay_video_renderer.inc}
{$UNDEF read_implementation}

end.
