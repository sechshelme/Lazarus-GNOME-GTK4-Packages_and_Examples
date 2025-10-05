
program project1;

uses
  ctypes,
  fp_glew,
  fp_glfw3,
  fp_glib2,
  fp_gst_base,
  fp_gst;

var
  pipeline, sink: PGstElement;
  window: PGLFWwindow;

  // === OpenGL

  procedure key_callback(window: PGLFWwindow; key: longint; scancode: longint; action: longint; mods: longint); cdecl;
  begin
    if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then begin
      glfwSetWindowShouldClose(window, GLFW_TRUE);
    end;
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

    gst_buffer_unmap(buffer, @map);
    gst_sample_unref(sample);

    glDrawPixels(640, 480, GL_RGB, GL_UNSIGNED_BYTE, map.Data);
  end;

begin
  // === OpenGL

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
  glfwSwapInterval(1);

  // === GST

  gst_init(@argc, @argv);

  pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! appsink name=sink', nil);

  if pipeline = nil then begin
    WriteLn('pipeline error');
  end;

  sink := gst_bin_get_by_name(GST_BIN(pipeline), 'sink');
  if sink = nil then begin
    WriteLn('sink error');
  end;

  gst_element_set_state(pipeline, GST_STATE_PLAYING);

  while glfwWindowShouldClose(window) = 0 do begin
    DrawGL;
    glfwSwapBuffers(window);
    glfwPollEvents;
  end;

  gst_object_unref(pipeline);
end.
