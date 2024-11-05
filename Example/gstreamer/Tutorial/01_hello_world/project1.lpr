program project1;

uses
  ctypes,
  glib280,
  gst124;

  // https://gstreamer.freedesktop.org/documentation/tutorials/basic/hello-world.html?gi-language=c

  procedure tutorial_main(argc: cint; argv: PPChar);
  var
    pipeline: PGstElement;
    bus: PGstBus;
    msg: PGstMessage;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('playbin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm', nil);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    bus := gst_element_get_bus(pipeline);
    msg := gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE, GST_MESSAGE_ERROR or GST_MESSAGE_EOS);

    if GST_MESSAGE_TYPE(msg) = GST_MESSAGE_ERROR then  begin
      g_printerr('An error occurred! Re-run with the GST_DEBUG=*:WARN environment variable set for more details.'#10);
    end;

    gst_message_unref(msg);
    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
  end;

begin
  tutorial_main(argc, argv);
end.
