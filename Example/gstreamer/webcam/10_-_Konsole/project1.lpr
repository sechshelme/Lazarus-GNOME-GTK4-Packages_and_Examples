
program project1;

uses
  Crt,
  ctypes,
  glib280,
  gst124;

  var
    pipeline: PGstElement;
  begin
    gst_init(@argc, @argv);

    pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=img_origin', nil);

    if pipeline = nil then begin
      WriteLn('pipeline error');
    end;

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    repeat
    until KeyPressed;

    gst_object_unref(pipeline);
  end.
