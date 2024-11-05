// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`

#include <stdio.h>
#include <gst/gst.h>

int main (int argc, char *argv[]) {
  gst_init (&argc, &argv); 

//  GstElement * pipeline = gst_parse_launch("playbin name=bin ! volume", NULL);
  GstElement * pipeline = gst_parse_launch("playbin name=bin", NULL);
  if (!pipeline) {
    printf("pipeline error\n");
  }

  GstElement * bin = gst_bin_get_by_name(GST_BIN(pipeline), "bin");
  if (!bin) {
    printf("bin error\n");
  }

  g_object_set(bin, "uri", "file:/home/tux/Schreibtisch/sound/test.mp3", NULL);


  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  printf("<CTRL+C> = stop\n");
  while (1) {  }

  gst_object_unref(pipeline);
}
