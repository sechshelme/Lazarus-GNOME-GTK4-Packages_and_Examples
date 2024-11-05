unit gst124_player;

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
  {$include gst/player/gstplayer_media_info.inc}                           // io.
  {$include gst/player/gstplayer.inc}                                      // io. -> gstplayer_media_info
  {$include gst/player/gstplayer_g_main_context_signal_dispatcher.inc}     // io. -> gstplayer
  {$include gst/player/gstplayer_signal_dispatcher.inc}                    // io. -> gstplayer
  {$include gst/player/gstplayer_video_overlay_video_renderer.inc}         // io. -> gstplayer
  {$include gst/player/gstplayer_video_renderer.inc}                       // io. -> gstplayer
  {$include gst/player/gstplayer_visualization.inc}                        // io.
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include gst/player/gstplayer_media_info.inc}                           // io.
{$include gst/player/gstplayer.inc}                                      // io. -> gstplayer_media_info
{$include gst/player/gstplayer_g_main_context_signal_dispatcher.inc}     // io. -> gstplayer
{$include gst/player/gstplayer_signal_dispatcher.inc}                    // io. -> gstplayer
{$include gst/player/gstplayer_video_overlay_video_renderer.inc}         // io. -> gstplayer
{$include gst/player/gstplayer_video_renderer.inc}                       // io. -> gstplayer
{$include gst/player/gstplayer_visualization.inc}                        // io.
{$UNDEF read_implementation}

end.
