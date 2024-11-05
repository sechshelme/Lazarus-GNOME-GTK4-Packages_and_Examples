
program project1;

uses
  //  oglglad_gl,
  gl,
  oglGLFW3,

  //  Crt,
  glib2,
  ctypes,
  gst;

var
  pipeline, sink: PGstElement;
  window: PGLFWwindow;
  caps: PGstCaps;
  // === OpenGL

  procedure key_callback(window: PGLFWwindow; key: longint; scancode: longint;
    action: longint; mods: longint); cdecl;
  begin
    if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then begin
      glfwSetWindowShouldClose(window, GLFW_TRUE);
    end;
  end;

  // ==== GST

  procedure printIt(p: PGList);
  var
    pad: PGstPad;
  begin
    while p <> nil do begin
      pad := PGstPad(p^.Data);
      WriteLn('pad: ', pad^.object_.Name);
      p := g_list_next(p);
    end;
  end;

  function on_new_sample(sink: PGstElement; Data: gpointer): TGstFlowReturn; cdecl;
  var
    sample: PGstSample;
    buffer: PGstBuffer;
    map: TGstMapInfo;
  begin
    //    WriteLn('sample');

    g_signal_emit_by_name(sink, 'pull-sample', @sample);
    if sample <> nil then begin
      //      WriteLn('io');

      buffer := gst_sample_get_buffer(sample);
      if buffer = nil then begin
        WriteLn('Buffer Fehler');
      end;
      //      WriteLn(buffer^.duration);

      gst_buffer_map(buffer, @map, GST_MAP_READ);

      //      WriteLn('size: ',map.size div 800);
      WriteLn('data: ', map.Data[0]);


      //      gst_object_unref(sample);
    end;

    Result := GST_FLOW_OK;
  end;

  function on_new_preoll(sink: PGstElement; Data: gpointer): TGstFlowReturn; cdecl;
  begin
    WriteLn('preroll');
    Result := GST_FLOW_OK;
  end;

  // https://stackoverflow.com/questions/69747987/gstreamer-rtsp-tee-appsink-cant-emit-signal-new-sample
  // https://www.glfw.org/docs/3.3/quick.html
  // https://github.com/Gauthamraju31/imgui_gstreamer/blob/main/main.cpp


  procedure error_callback(error_code: longint; description: PChar); cdecl;
  begin
    WriteLn('GLFW Fehler:', description);
  end;

  procedure DrawGL;
  var
    sample: PGstSample;
    buffer: PGstBuffer;
    map: TGstMapInfo;
  begin
    glClearColor(0.5, 0.5, 0.5, 0.5);
    glClear(GL_COLOR_BUFFER_BIT);

    g_signal_emit_by_name(sink, 'pull-sample', @sample);
    buffer := gst_sample_get_buffer(sample);
    gst_buffer_map(buffer, @map, GST_MAP_READ);

    WriteLn('data: ', map.Data[0]);

    gst_buffer_unmap(buffer, @map);
    //            gst_sample_unref(sample);

    glDrawPixels(640, 480, GL_RGB, GL_UNSIGNED_BYTE, map.Data);
  end;

begin
  // === OpenGL

  glfwSetErrorCallback(@error_callback);

  if glfwInit = 0 then begin
    WriteLn('glfwInit Error !');
    Halt();
  end;

  window := glfwCreateWindow(640, 480, 'Webcam', nil, nil);
  if window = nil then begin
    WriteLn('Konnte Fenster nicht erstellen !');
  end;

  glfwSetKeyCallback(window, @key_callback);

  glfwMakeContextCurrent(window);
  //  Load_GLADE;
  glfwSwapInterval(1);

  // === GST

  gst_init(@argc, @argv);

  //      pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=img_origin', nil);
  //pipeline := gst_parse_launch('videotestsrc  ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=sink', nil);
  //  pipeline := gst_parse_launch('videotestsrc ! video/x-raw,format=RGB ! appsink name=sink', nil);
  pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! appsink name=sink', nil);

  if pipeline = nil then begin
    WriteLn('pipeline error');
  end;

caps:=  gst_caps_new_simple('video/x-raw',
    'format',[ G_TYPE_STRING, 'BGRA',
    nil]);

  sink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
  if sink = nil then begin
    WriteLn('sink error');
  end;
  printIt(sink^.pads);

  g_object_set(sink, 'emit-signals', gTRUE, nil);

  //  g_signal_connect(sink, 'new-sample', G_CALLBACK(@on_new_sample), nil);
  //  g_signal_connect(sink, 'new-preroll', G_CALLBACK(@on_new_preoll), nil);

  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  while glfwWindowShouldClose(window) = 0 do begin
    DrawGL;
    glfwSwapBuffers(window);
    glfwPollEvents;
  end;
  gst_object_unref(pipeline);
end.
