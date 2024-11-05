
program project1;

uses
  ctypes,
  oglglad_gl,
  oglShader,
  oglGLFW3,
  oglTextur,
  glib280,
  gst124;

const
  Width = 640;
  Height = 480;

var
  pipeline, sink, src: PGstElement;
  window: PGLFWwindow;
  shader: TShader;
  VBAQuad: TGLint;
  Textur: TTexturBuffer;
  // === OpenGL

const
  VertexShader =
    '#version 330'#10 +
    ''#10 +
    'const vec2 vertices[] = vec2[]('#10 +
    'vec2( -1.0, -1.0),'#10 +
    'vec2( -1.0,  1.0),'#10 +
    'vec2(  1.0,  1.0),'#10 +
    'vec2( -1.0, -1.0),'#10 +
    'vec2(  1.0,  1.0),'#10 +
    'vec2(  1.0, -1.0));'#10 +
    ''#10 +
    'const vec2 texCoord[] = vec2[]('#10 +
    'vec2(  0.0,  1.0),'#10 +
    'vec2(  0.0,  0.0),'#10 +
    'vec2(  1.0,  0.0),'#10 +
    'vec2(  0.0,  1.0),'#10 +
    'vec2(  1.0,  0.0),'#10 +
    'vec2(  1.0,  1.0));'#10 +
    ''#10 +
    'out vec2 UV0;'#10 +
    ''#10 +
    'void main(void) {'#10 +
    ''#10 +
    'gl_Position = vec4(vertices[gl_VertexID], 0.0, 1.0);'#10 +
    'UV0 = texCoord[gl_VertexID];'#10 +
    '}';

  FragmentShader =
    '    #version 330'#10 +
    ''#10 +
    '    uniform sampler2D Sampler;'#10 +
    ''#10 +
    '    in vec2 UV0;'#10 +
    ''#10 +
    '    out vec4 outColor;'#10 +
    ''#10 +
    '    void main(void)'#10 +
    '    {'#10 +
    '       outColor = texture( Sampler, UV0 );'#10 +
    '    }';


  procedure key_callback(window: PGLFWwindow; key: longint; scancode: longint; action: longint; mods: longint); cdecl;
  begin
    if (key = GLFW_KEY_ESCAPE) and (action = GLFW_PRESS) then begin
      glfwSetWindowShouldClose(window, GLFW_TRUE);
    end;
  end;

  // https://stackoverflow.com/questions/69747987/gstreamer-rtsp-tee-appsink-cant-emit-signal-new-sample
  // https://www.glfw.org/docs/3.3/quick.html
  // https://github.com/Gauthamraju31/imgui_gstreamer/blob/main/main.cpp

  procedure DrawGL;
  var
    sample: PGstSample;
    buffer: PGstBuffer;
    map: TGstMapInfo;
  begin
    glClear(GL_COLOR_BUFFER_BIT);

    g_signal_emit_by_name(sink, 'pull-sample', @sample);
    buffer := gst_sample_get_buffer(sample);
    gst_buffer_map(buffer, @map, GST_MAP_READ);

    Textur.LoadTextures(Width, Height, map.Data, GL_RGBA, GL_UNSIGNED_BYTE);
    Textur.ActiveAndBind;

    glBindVertexArray(VBAQuad);
    glDrawArrays(GL_TRIANGLES, 0, 6);

    gst_buffer_unmap(buffer, @map);
    gst_sample_unref(sample);
  end;


  procedure showProperty(e: PGstElement);
  var
    prolist: PPGParamSpec;
    Count: Tguint;
    i: integer;
  begin
    prolist := g_object_class_list_properties(G_OBJECT_GET_CLASS(e), @Count);

    WriteLn('count:', Count);
    for i := 0 to Count - 1 do begin
      WriteLn(i: 3, ' ', prolist[i]^.Name);
    end;
    g_free(prolist);
  end;


procedure main;
var w,h:Tgint;
begin
  // === OpenGL

  if glfwInit = 0 then begin
    WriteLn('glfwInit Error !');
    Halt();
  end;

  window := glfwCreateWindow(Width, Height, 'Webcam', nil, nil);
  if window = nil then begin
    WriteLn('Konnte Fenster nicht erstellen !');
  end;

  glfwSetKeyCallback(window, @key_callback);

  glfwMakeContextCurrent(window);
  Load_GLADE;
  glfwSwapInterval(1);

  shader := TShader.Create;
  shader.LoadShaderObject(GL_VERTEX_SHADER, VertexShader);
  shader.LoadShaderObject(GL_FRAGMENT_SHADER, FragmentShader);
  shader.LinkProgram;
  shader.UseProgram;

  glGenVertexArrays(1, @VBAQuad);
  glBindVertexArray(0);

  Textur := TTexturBuffer.Create;

  // === GST

  gst_init(@argc, @argv);

  //      pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=img_origin', nil);
  //pipeline := gst_parse_launch('videotestsrc  ! video/x-raw,format=RGB ! queue ! videoconvert ! ximagesink name=sink', nil);
  //  pipeline := gst_parse_launch('videotestsrc ! video/x-raw,format=RGB ! appsink name=sink', nil);
    pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! video/x-raw,format=RGBA,width=640,height=480,name=videox ! queue ! videoconvert ! appsink name=sink', nil);
//  pipeline := gst_parse_launch('v4l2src name=cam_src ! videoconvert ! videoscale ! rawvideoparse name=videox ! queue ! videoconvert ! appsink name=sink', nil);
  if pipeline = nil then begin
    WriteLn('pipeline error');
  end;

  src := gst_bin_get_by_name(GST_BIN(pipeline), 'videox');
  if src = nil then begin
    WriteLn('src error');
  end else begin
    showProperty(src);

    g_object_set(src, 'width', 640, 'height', 480, 'format',39,  nil);
    g_object_get(src, 'width', @w, 'height', @h, nil);
    WriteLn('Width:  ',w);
    WriteLn('Height: ',h);
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

  shader.Free;
  Textur.Free;
end;
begin
  main;
end.
