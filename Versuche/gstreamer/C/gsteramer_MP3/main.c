// gcc main.c -o main `pkg-config --cflags --libs gstreamer-1.0 gstreamer-audio-1.0`

#include <stdio.h>
#include <gst/gst.h>

int main (int argc, char *argv[]) {
//  gst_init (&argc, &argv); 
  gst_init (0, 0); 

  GstElement * pipeline = gst_parse_launch("filesrc location=/home/tux/Schreibtisch/sound/test.mp3 ! decodebin ! audioconvert ! audioresample ! volume ! autoaudiosink", NULL);

  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  printf("<CTRL+C> = stop\n");
  while (1) {  }

  gst_object_unref(pipeline);
}
