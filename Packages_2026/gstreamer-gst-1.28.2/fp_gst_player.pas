unit fp_gst_player;

interface

uses
  fp_glib2,
  fp_gst,
  fp_gst_video;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include gst/player/gstplayer_types.inc}
  {$include gst/player/gstplayer_video_renderer.inc}
  {$include gst/player/gstplayer_signal_dispatcher.inc}
  {$include gst/player/gstplayer_media_info.inc}
  {$include gst/player/gstplayer.inc}
  {$include gst/player/gstplayer_g_main_context_signal_dispatcher.inc}
  {$include gst/player/gstplayer_video_overlay_video_renderer.inc}
  {$include gst/player/gstplayer_visualization.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/player/gstplayer_types.inc}
{$include gst/player/gstplayer_video_renderer.inc}
{$include gst/player/gstplayer_signal_dispatcher.inc}
{$include gst/player/gstplayer_media_info.inc}
{$include gst/player/gstplayer.inc}
{$include gst/player/gstplayer_g_main_context_signal_dispatcher.inc}
{$include gst/player/gstplayer_video_overlay_video_renderer.inc}
{$include gst/player/gstplayer_visualization.inc}
{$UNDEF read_implementation}

end.
