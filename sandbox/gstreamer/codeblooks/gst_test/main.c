#include <gst/gst.h>
#include <gst/pbutils/gstdiscoverer.h>
#include <gst/pbutils/gstaudiovisualizer.h>
#include <gst/pbutils/install-plugins.h>
#include <gst/pbutils/encoding-target.h>
#include <gst/allocators/allocators.h>
#include <gst/mpegts/mpegts.h>
#include <gst/sdp/sdp.h>
#include <gst/check/check.h>
#include <gst/analytics/analytics.h>
#include <gst/fft/fft.h>
#include <gst/audio/gstnonstreamaudiodecoder.h>
#include <gst/base/base.h>
#include <gst/mse/mse.h>
//#include <gst/cuda/gstcuda.h>
#include <gst/va/gstva.h>
#include <gst/wayland/wayland.h>
#include <wayland-client-core.h>
//#include <gst/gl/gl.h>
//#include <gst/gl/egl/egl.h>

#include <stdbool.h> // Include this header for bool type


#ifdef __APPLE__
#include <TargetConditionals.h>
#endif

int
tutorial_main (int argc, char *argv[])
{
  GstElement *pipeline;
  GstBus *bus;
  GstMessage *msg;

  /* Initialize GStreamer */
  gst_init (&argc, &argv);

  /* Build the pipeline */
  pipeline =
      gst_parse_launch
      ("playbin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm",
      NULL);

//      gst_bin_get_by_interface(GST_BIN( pipeline), GST_TYPE_STREAM_VOLUME);

  /* Start playing */
  gst_element_set_state (pipeline, GST_STATE_PLAYING);

  /* Wait until error or EOS */
  bus = gst_element_get_bus (pipeline);
  msg =
      gst_bus_timed_pop_filtered (bus, GST_CLOCK_TIME_NONE,
      GST_MESSAGE_ERROR | GST_MESSAGE_EOS);

  /* See next tutorial for proper error message handling/parsing */
  if (GST_MESSAGE_TYPE (msg) == GST_MESSAGE_ERROR) {
    g_printerr ("An error occurred! Re-run with the GST_DEBUG=*:WARN "
        "environment variable set for more details.\n");
  }

  /* Free resources */
  gst_message_unref (msg);
  gst_object_unref (bus);
  gst_element_set_state (pipeline, GST_STATE_NULL);
  gst_object_unref (pipeline);
  return 0;
}

int
main (int argc, char *argv[])
{
#if defined(__APPLE__) && TARGET_OS_MAC && !TARGET_OS_IPHONE
  return gst_macos_main ((GstMainFunc) tutorial_main, argc, argv, NULL);
#else
  return tutorial_main (argc, argv);
#endif

//GST_PAD_TEMPLATE_IS_FIXED(0);

GstVideoFormatInfo * info;

CuGraphicsMapResources(0,0,9);

//GST_VIDEO_FORMAT_INFO_DATA(info,0,0);
//gst_buffer_get_ancillary_meta(0);
//GST_AUDIO_BASE_SINK_CLOCK(NULL);
bool b=false;
}

