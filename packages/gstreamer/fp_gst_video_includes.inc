
{$include gst/video/video}                                // io.
{$include gst/video/video_enumtypes}                      // io.
{$include gst/video/video_resampler}                      // io.
{$include gst/video/navigation}                           // io.
{$include gst/video/videoorientation}                     // io.
{$include gst/video/videooverlay}                         // io.
{$include gst/video/video_sei}                            // io.
{$include gst/video/gstvideoaffinetransformationmeta}     // io.
{$include gst/video/video_event}                          // io.
{$include gst/video/gstvideocodecalphameta}               // io.
{$include gst/video/videodirection}                       // io.
{$include gst/video/colorbalancechannel}                  // io.
{$include gst/video/colorbalance}                         // io. -> colorbalancechannel
{$include gst/video/video_tile}                           // io.
{$include gst/video/video_format}                         // io. -> video_tile     viele Makros entfernt
{$include gst/video/video_anc}                            // io. -> video_format          Fehler im Makro C-seitig
{$include gst/video/video_chroma}                         // io. -> video_format
{$include gst/video/video_dither}                         // io. -> video_format
{$include gst/video/video_scaler}                         // io. -> video_resampler, video_format
{$include gst/video/video_color}                          // io. -> video_format, video
{$include gst/video/video_info}                           // io. -> video_format, video_color
{$include gst/video/video_hdr}                            // io.
{$include gst/video/gstvideoutils}                        // io. -> video_info, video_hdr
{$include gst/video/gstvideoencoder}                      // io. -> gstvideoutils
{$include gst/video/video_multiview}                      // io. -> video_info
{$include gst/video/gstvideosink}                         // io. -> video_info
{$include gst/video/video_info_dma}                       // io. -> video_info, video_format
{$include gst/video/video_frame}                          // io. -> video_info, video
{$include gst/video/gstvideofilter}                       // io. -> video_info, video_frame
{$include gst/video/video_converter}                      // io. -> video_info, video_frame
{$include gst/video/gstvideoaggregator}                   // io. -> video_info, video_frame
{$include gst/video/gstvideopool}                         // io. -> video_info, video_frame
{$include gst/video/video_blend}                          // io. -> video_info, video_frame
{$include gst/video/video_overlay_composition}            // io. -> video_format, video_frame
{$include gst/video/gstvideodecoder}                      // io. -> gstvideoutils, video_format, video_info
{$include gst/video/gstvideotimecode}                     // io.
{$include gst/video/gstvideometa}                         // io. -> video, video_frame, video_format, video_info, gstvideotimecode





