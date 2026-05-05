program project1;

uses
  fp_GL_Tools,
  fp_epoxy,
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
  shader: PShader;
  VBO, VAO: TGLuint;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_gl_area_queue_render(GTK_GL_AREA(widget));
    Result := G_SOURCE_CONTINUE;
  end;

  procedure on_realize(area: PGtkGLArea); cdecl;
  var
    vertices: array[0..17] of TGLfloat = (
      -0.6, -0.4, 0.0, 1.0, 0.0, 0.0,
      0.6, -0.4, 0.0, 0.0, 1.0, 0.0,
      0.0, 0.6, 0.0, 0.0, 0.0, 1.0
      );
  begin
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit;
    end;

    shader := shader_new;
    if not shader_load_shaderobject(shader, GL_VERTEX_SHADER, pchar(VertexShaderSource)) then begin
      WriteLn('Fehler im Vertex-Shader:');
      WriteLn(shader_get_errortext(shader));
    end;
    if not shader_load_shaderobject(shader, GL_FRAGMENT_SHADER, pchar(FragmentShaderSource)) then begin
      WriteLn('Fehler im Fragment-Shader:');
      WriteLn(shader_get_errortext(shader));
    end;
    if not shader_link_program(shader) then begin
      WriteLn('Fehler beim Linken der Shader:');
      WriteLn(shader_get_errortext(shader));
    end;

    glGenVertexArrays(1, @VAO);
    glGenBuffers(1, @VBO);

    glBindVertexArray(VAO);
    glBindBuffer(GL_ARRAY_BUFFER, VBO);
    glBufferData(GL_ARRAY_BUFFER, SizeOf(vertices), @vertices, GL_STATIC_DRAW);

    // Position Attribut
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), nil);
    glEnableVertexAttribArray(0);
    // Farbe Attribut
    glVertexAttribPointer(1, 3, GL_FLOAT, GL_FALSE, 6 * SizeOf(TGLfloat), Pointer(3 * SizeOf(TGLfloat)));
    glEnableVertexAttribArray(1);

    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);
  end;

  function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
  begin
    if gtk_gl_area_get_error(area) <> nil then begin
      Exit(False);
    end;

    glClearColor(0.1, 0.1, 0.1, 1.0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

    shader_use_program(shader);
    glBindVertexArray(VAO);
    glDrawArrays(GL_TRIANGLES, 0, 3);

    Result := True;
  end;

  procedure on_unrealize(area: PGtkGLArea); cdecl;
  begin
    gtk_gl_area_make_current(area);
    glDeleteVertexArrays(1, @VAO);
    glDeleteBuffers(1, @VBO);
    shader_unref(shader);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, gl_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTRUE, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_decorated(GTK_WINDOW(window), True);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    gl_area := gtk_gl_area_new();
    gtk_gl_area_set_required_version(GTK_GL_AREA(gl_area), 3, 3);

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
