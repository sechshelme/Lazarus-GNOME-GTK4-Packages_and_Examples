program project1;

uses
  Math,
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  MyWidget;

  procedure quit_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    window: PGtkWindow absolute user_data;
  begin
    gtk_window_destroy(window);
  end;

  procedure new_color_r_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  begin
    my_widget_set_color(user_data, 1.0, 0.0, 0.0);
  end;

  procedure new_color_g_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  begin
    my_widget_set_color(user_data, 0.0, 1.0, 0.0);
  end;

  procedure new_color_b_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  begin
    my_widget_set_color(user_data, 0.0, 0.0, 1.0);
  end;

  function CreateTexture(col: PGdkRGBA): PGtkWidget;
  var
    bytes: PGBytes;
    texture: PGdkTexture;
  begin
    bytes := g_bytes_new(@col^, SizeOf(TGdkRGBA));
    texture := gdk_memory_texture_new(1, 1, GDK_MEMORY_R32G32B32A32_FLOAT, bytes, 4 * 4);
    g_bytes_unref(bytes);
    Result := gtk_image_new_from_paintable(GDK_PAINTABLE(texture));
    g_object_unref(texture);
  end;

  function CreateColorButton(parent: PGtkWidget; col: pchar): PGtkWidget;
  var
    c: TGdkRGBA;
    image: PGtkWidget;
  begin
    gdk_rgba_parse(@c, col);
    image := CreateTexture(@c);
    Result := gtk_button_new;
    gtk_header_bar_pack_end(GTK_HEADER_BAR(parent), Result);
    gtk_button_set_child(GTK_BUTTON(Result), image);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, mySnapShot, header_bar: PGtkWidget;
  begin
    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Belt Drive');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    mySnapShot := GTK_WIDGET(my_widget_new);
    gtk_widget_set_vexpand(mySnapShot, True);
    gtk_widget_set_hexpand(mySnapShot, True);
    gtk_box_append(GTK_BOX(box), mySnapShot);

    // Header Bar
    header_bar := gtk_header_bar_new;
    gtk_window_set_titlebar(GTK_WINDOW(window), header_bar);

    button := CreateColorButton(header_bar, 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_r_cp), mySnapShot);

    button := CreateColorButton(header_bar, 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_g_cp), mySnapShot);

    button := CreateColorButton(header_bar, 'blue');
    g_signal_connect(button, 'clicked', G_CALLBACK(@new_color_b_cp), mySnapShot);

    // Quit Button
    button := gtk_button_new_with_label('Quit');
    g_signal_connect(button, 'clicked', G_CALLBACK(@quit_cp), window);
    gtk_box_append(GTK_BOX(box), button);

    // Windows
    gtk_window_set_child(GTK_WINDOW(window), box);
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
