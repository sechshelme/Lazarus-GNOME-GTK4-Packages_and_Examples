program project1;

uses
  fp_epoxy,

//  fp_glew,
  fp_glib2,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
    g_print('Hello World'#10);
  end;

const
  VertexShaderSource =
    '#version 330 core' + #10 +
    'layout (location = 0) in vec3 aPos;' + #10 +
    'layout (location = 1) in vec3 aColor;' + #10 +
    'out vec3 ourColor;' + #10 +
    'void main() {' + #10 +
    '  gl_Position = vec4(aPos, 1.0);' + #10 +
    '  ourColor = aColor;' + #10 +
    '}';

  FragmentShaderSource =
    '#version 330 core' + #10 +
    'in vec3 ourColor;' + #10 +
    'out vec4 FragColor;' + #10 +
    'void main() {' + #10 +
    '  FragColor = vec4(ourColor, 1.0);' + #10 +
    '}';

var
  VBO, VAO, ShaderProgram: TGLuint;


  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_gl_area_queue_render(GTK_GL_AREA(widget));
    Result := G_SOURCE_CONTINUE;
  end;

  procedure on_realize(area: PGtkGLArea); cdecl;
  var
    vShader, fShader: TGLuint;
    vertices: array[0..17] of TGLfloat = (
      -0.6, -0.4, 0.0, 1.0, 0.0, 0.0,
      0.6, -0.4, 0.0, 0.0, 1.0, 0.0,
      0.0, 0.6, 0.0, 0.0, 0.0, 1.0
      );
    vSourcePtr, fSourcePtr: pchar;
  begin
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit;
    end;

    // === Load glew
//    if glewInit <> GLEW_OK then begin
//      WriteLn('glxewInit Fehler');
//      Halt(1);
    //end;

//    WriteLn('glewInit: ',glewInit);
//WriteLn(PtrUInt(epoxy_glCreateShader));



    // Shader kompilieren
    vShader := epoxy_glCreateShader(GL_VERTEX_SHADER);

    vSourcePtr := pchar(VertexShaderSource);
    // Wichtig: @vSourcePtr übergibt die Adresse des Zeigers
    epoxy_glShaderSource(vShader, 1, @vSourcePtr, nil);
    epoxy_glCompileShader(vShader);

    fShader := epoxy_glCreateShader(GL_FRAGMENT_SHADER);

    fSourcePtr := pchar(FragmentShaderSource);
    epoxy_glShaderSource(fShader, 1, @fSourcePtr, nil);
    epoxy_glCompileShader(fShader);
    epoxy_glCompileShader(fShader);
    // Buffer Setup (VAO & VBO)

    ShaderProgram := epoxy_glCreateProgram();
//    ShaderProgram := glCreateProgram;
    epoxy_glAttachShader(ShaderProgram, vShader);
    epoxy_glAttachShader(ShaderProgram, fShader);
    epoxy_glLinkProgram(ShaderProgram);

    epoxy_glDeleteShader(vShader);
    epoxy_glDeleteShader(fShader);

    epoxy_glGenVertexArrays(1, @VAO);
    epoxy_glGenBuffers(1, @VBO);

    epoxy_glBindVertexArray(VAO);
    epoxy_glBindBuffer(GL_ARRAY_BUFFER, VBO);
    epoxy_glBufferData(GL_ARRAY_BUFFER, SizeOf(vertices), @vertices, GL_STATIC_DRAW);

    // Position Attribut
    epoxy_glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), nil);
    epoxy_glEnableVertexAttribArray(0);
    // Farbe Attribut
    epoxy_glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), Pointer(3 * SizeOf(TGLfloat)));
    epoxy_glEnableVertexAttribArray(1);

    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);
  end;

  function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
  begin
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit(False);
    end;

    epoxy_glClearColor(0.1, 0.1, 0.1, 1.0);
    epoxy_glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

    epoxy_glUseProgram(ShaderProgram);
    epoxy_glBindVertexArray(VAO);
    epoxy_glDrawArrays(GL_TRIANGLES, 0, 3);

    Result := True;
  end;

  procedure on_unrealize(area: PGtkGLArea); cdecl;
  begin
    gtk_gl_area_make_current(area);
    epoxy_glDeleteVertexArrays(1, @VAO);
    epoxy_glDeleteBuffers(1, @VBO);
    epoxy_glDeleteProgram(ShaderProgram);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, gl_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTRUE, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_decorated(GTK_WINDOW(window), True);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gl_area := gtk_gl_area_new();

    gtk_gl_area_set_required_version(GTK_GL_AREA(gl_area), 3, 3);
//    gtk_gl_area_set_use_es(GTK_GL_AREA(gl_area), False); // Erzwinge Desktop GL, kein GLES

    gtk_gl_area_set_has_depth_buffer(GTK_GL_AREA(gl_area), True);
    gtk_gl_area_set_has_stencil_buffer(GTK_GL_AREA(gl_area), True);
    gtk_gl_area_set_auto_render(GTK_GL_AREA(gl_area), True);

    gtk_widget_set_hexpand(gl_area, True);
    gtk_widget_set_vexpand(gl_area, True);
    gtk_widget_set_size_request(gl_area, 100, 200);
    g_signal_connect(gl_area, 'realize', G_CALLBACK(@on_realize), nil);
    g_signal_connect(gl_area, 'unrealize', G_CALLBACK(@on_unrealize), nil);
    g_signal_connect(gl_area, 'render', G_CALLBACK(@on_render), nil);
    gtk_box_append(GTK_BOX(box), gl_area);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
