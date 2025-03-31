program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
     fp_GLIBTools,
  fp_GTK4,
  fp_GSK4,
  fp_GDK4;

  procedure button_quit_cb({%H-}widget: PGtkWidget; {%H-}Data: Tgpointer);
  var
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));
    gtk_window_close(GTK_WINDOW(windowList^.Data));
  end;

const
  texture_data: array[0..15] of Tguint8 = (
    255, 0, 0, 255, 0, 255, 0, 255,
    0, 0, 255, 255, 255, 255, 255, 255);

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, main_box, button, picture, button_box: PGtkWidget;
    bytes: PGBytes;
    texture: PGdkTexture;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    main_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), main_box);

    bytes := g_bytes_new_static(@texture_data, SizeOf(texture_data));
    texture := gdk_memory_texture_new(2, 2, GDK_MEMORY_R8G8B8A8, bytes, 2 * 4);
    GObjectShowProperty(texture);
    g_bytes_unref(bytes);

    picture := gtk_picture_new_for_paintable(GDK_PAINTABLE(texture));
    gtk_picture_set_can_shrink(GTK_PICTURE(picture), True);
    gtk_picture_set_content_fit(GTK_PICTURE(picture), GTK_CONTENT_FIT_FILL);

    gtk_widget_set_vexpand(picture, True);
    gtk_widget_set_hexpand(picture, True);
    gtk_box_append(GTK_BOX(main_box), picture);

    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 0);
    gtk_box_append(GTK_BOX(main_box), button_box);

    button := gtk_button_new_with_label('Quit');
    gtk_widget_set_hexpand(button, True);
    gtk_widget_set_halign(button, GTK_ALIGN_CENTER);
    gtk_box_append(GTK_BOX(button_box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_quit_cb), nil);

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
