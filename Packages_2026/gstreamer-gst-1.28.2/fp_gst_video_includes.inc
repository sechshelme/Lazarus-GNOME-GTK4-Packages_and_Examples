
{$include gst/video/video.inc}                                // io.
{$include gst/video/video_enumtypes.inc}                      // io.
{$include gst/video/video_resampler.inc}                      // io.
{$include gst/video/navigation.inc}                           // io.
{$include gst/video/videoorientation.inc}                     // io.
{$include gst/video/videooverlay.inc}                         // io.
{$include gst/video/video_sei.inc}                            // io.
{$include gst/video/gstvideoaffinetransformationmeta.inc}     // io.
{$include gst/video/video_event.inc}                          // io.
{$include gst/video/gstvideocodecalphameta.inc}               // io.
{$include gst/video/videodirection.inc}                       // io.
{$include gst/video/colorbalancechannel.inc}                  // io.
{$include gst/video/colorbalance.inc}                         // io. -> colorbalancechannel
{$include gst/video/video_tile.inc}                           // io.
{$include gst/video/video_format.inc}                         // io. -> video_tile     viele Makros entfernt
{$include gst/video/video_anc.inc}                            // io. -> video_format          Fehler im Makro C-seitig
{$include gst/video/video_chroma.inc}                         // io. -> video_format
{$include gst/video/video_dither.inc}                         // io. -> video_format
{$include gst/video/video_scaler.inc}                         // io. -> video_resampler, video_format
{$include gst/video/video_color.inc}                          // io. -> video_format, video
{$include gst/video/video_info.inc}                           // io. -> video_format, video_color
{$include gst/video/video_hdr.inc}                            // io.
{$include gst/video/gstvideoutils.inc}                        // io. -> video_info, video_hdr
{$include gst/video/gstvideoencoder.inc}                      // io. -> gstvideoutils
{$include gst/video/video_multiview.inc}                      // io. -> video_info
{$include gst/video/gstvideosink.inc}                         // io. -> video_info
{$include gst/video/video_info_dma.inc}                       // io. -> video_info, video_format
{$include gst/video/video_frame.inc}                          // io. -> video_info, video
{$include gst/video/gstvideofilter.inc}                       // io. -> video_info, video_frame
{$include gst/video/video_converter.inc}                      // io. -> video_info, video_frame
{$include gst/video/gstvideoaggregator.inc}                   // io. -> video_info, video_frame
{$include gst/video/gstvideopool.inc}                         // io. -> video_info, video_frame
{$include gst/video/video_blend.inc}                          // io. -> video_info, video_frame
{$include gst/video/video_overlay_composition.inc}            // io. -> video_format, video_frame
{$include gst/video/gstvideodecoder.inc}                      // io. -> gstvideoutils, video_format, video_info
{$include gst/video/gstvideotimecode.inc}                     // io.
{$include gst/video/gstvideometa.inc}                         // io. -> video, video_frame, video_format, video_info, gstvideotimecode





