program project1;

uses
  fp_glib2,
  fp_GTK4;

  procedure button_quit_cb({%H-}widget: PGtkWidget; {%H-}Data: Tgpointer); cdecl;
  var
    app: PGApplication;
  begin
    app := g_application_get_default;
    gtk_window_close(GTK_WINDOW(gtk_application_get_active_window(GTK_APPLICATION(app))));
  end;

const
  texture_data: array[0..15] of Tguint8 = (
    $FF, $00, $00, $FF, $00, $FF, $00, $FF,
    $00, $00, $FF, $FF, $FF, $FF, $FF, $FF);

  function CreateTextur: PGtkWidget;
  var
    bytes: PGBytes;
    texture: PGdkTexture;
  begin
    bytes := g_bytes_new_static(@texture_data, SizeOf(texture_data));
    texture := gdk_memory_texture_new(2, 2, GDK_MEMORY_R8G8B8A8, bytes, 2 * 4);
    g_bytes_unref(bytes);

    Result := gtk_picture_new_for_paintable(GDK_PAINTABLE(texture));
    gtk_picture_set_can_shrink(GTK_PICTURE(Result), True);
    gtk_picture_set_content_fit(GTK_PICTURE(Result), GTK_CONTENT_FIT_FILL);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, main_box, button, picture, button_box: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    picture := CreateTextur;

    gtk_widget_set_vexpand(picture, True);
    gtk_widget_set_hexpand(picture, True);
    gtk_box_append(GTK_BOX(main_box), picture);

    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_box_append(GTK_BOX(main_box), button_box);

    button := gtk_button_new_with_label('Quit');
    gtk_widget_set_hexpand(button, True);
    gtk_widget_set_halign(button, GTK_ALIGN_CENTER);
    gtk_box_append(GTK_BOX(button_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_quit_cb), nil);

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
