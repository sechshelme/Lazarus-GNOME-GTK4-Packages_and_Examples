program project1;

uses
  ctypes,
  SysUtils,
  gl,
  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: cint = 0;
  begin
    g_print('Hello World'#10);

    Inc(counter);
    gtk_button_set_label(GTK_BUTTON(widget), PChar('Ich wurde ' + IntToStr(counter) + ' gelickt'));
  end;

  // https://stackoverflow.com/questions/74507596/trying-to-implement-gtk-4-c-the-shader-to-have-each-face-like-meshlab-does-bu
  // https://www.perplexity.ai/search/gib-mir-ein-beipiel-mit-gtk-gl-UrdX4wqVSFm46dWQcELzYw

  function on_render(area: PGtkGLArea; context: PGdkGLContext): Tgboolean; cdecl;
  var
    w, h: longint;
  begin
    if gtk_gl_area_get_error(area) <> nil then begin
      WriteLn('render fehler');
    end;

    w := gtk_widget_get_width(GTK_WIDGET(area));
    h := gtk_widget_get_height(GTK_WIDGET(area));
    WriteLn(w, 'x', h);

    glClearColor(1.0, random, 0.0, 1.0);
    glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

    glBegin(GL_TRIANGLES);
    glColor3f(1.0, 0.0, 0.0);
    glVertex2f(-0.6, -0.4);
    glColor3f(0.0, 1.0, 0.0);
    glVertex2f(0.6, -0.4);
    glColor3f(0.0, 0.0, 1.0);
    glVertex2f(0.0, 0.6);
    glEnd();

    glFlush();
    Result := True;
  end;

  function on_tick(widget: PGtkWidget; frame_clock: PGdkFrameClock;    user_data: Tgpointer): Tgboolean; cdecl;
  begin
    gtk_gl_area_queue_render(GTK_GL_AREA(widget));

    Result := G_SOURCE_CONTINUE;
  end;

  procedure on_realize(area: PGtkGLArea); cdecl;
  var
    context: PGdkGLContext;
  begin
    WriteLn('realize');
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      WriteLn('realize fehler');
    end;
    context := gtk_gl_area_get_context(area);
    gtk_widget_add_tick_callback(GTK_WIDGET(area), @on_tick, nil, nil);

    WriteLn(glGetString(GL_VERSION));
  end;

  procedure on_unrealize(area: PGtkGLArea); cdecl;
  begin
    WriteLn('unrealize');
    gtk_gl_area_make_current(area);
    if gtk_gl_area_get_error(area) <> nil then begin
      WriteLn('unrealize fehler');
    end;
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, gl_area: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default,
      'gtk-application-prefer-dark-theme', gTRUE,
      nil);

    window := gtk_application_window_new(app);
    gtk_window_set_decorated(GTK_WINDOW(window), True);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);
    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);


    gl_area := gtk_gl_area_new();
    //    gtk_gl_area_set_required_version(GTK_GL_AREA(gl_area), 1, 2);

    gtk_gl_area_set_use_es(GTK_GL_AREA(gl_area), False);
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
//    WriteLn(gtk_gl_area_get_auto_render(GTK_GL_AREA(gl_area)));


    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
