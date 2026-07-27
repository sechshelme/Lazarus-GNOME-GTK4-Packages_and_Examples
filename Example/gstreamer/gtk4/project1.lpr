program project1;

uses
  fp_glib2,
  fp_gst,
  fp_GTK4;

  procedure print_hello(widget: PGtkWidget; Data: Tgpointer); cdecl;
  const
    counter: integer = 0;
  var
    s: Pgchar;
  begin
    Inc(counter);
    s := g_strdup_printf('Ich wurde %d gelickt', counter);
    gtk_button_set_label(GTK_BUTTON(widget), s);
    g_free(s);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, picture: PGtkWidget;
    pipeline, sink: PGstElement;
    paintable: PGdkPaintable = nil;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 200, 200);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_widget_set_halign(box, GTK_ALIGN_CENTER);
    gtk_widget_set_valign(box, GTK_ALIGN_CENTER);

    pipeline := gst_parse_launch('playbin uri=https://gstreamer.freedesktop.org/data/media/sintel_trailer-480p.webm', nil);
    sink := gst_element_factory_make('gtk4paintablesink', 'videosink');

    if (pipeline = nil) or (sink = nil) then begin
      g_printerr('Fehler: Pipeline oder gtk4paintablesink konnte nicht erstellt werden!'#10);
    end;

    g_object_set(pipeline, 'video-sink', sink, nil);
    g_object_get(sink, 'paintable', @paintable, nil);

    picture := gtk_picture_new_for_paintable(paintable);
    gtk_box_append(GTK_BOX(box), picture);

    g_object_unref(paintable);

    gst_element_set_state(pipeline, GST_STATE_PLAYING);
    gtk_window_present(GTK_WINDOW(window));

    g_object_set_data_full(G_OBJECT(window), 'pipeline', pipeline, @gst_object_unref);

    button := gtk_button_new_with_label('Hello World');
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), nil);
    gtk_box_append(GTK_BOX(box), button);

    gtk_window_set_child(GTK_WINDOW(window), box);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    gst_init(@argc, @argv);
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
