program project1;

uses
  fp_glib2,
  fp_GTK4;

type
  TMyWidgets = record
    lab, entry: PGtkWidget;
  end;
  PMyWidgets = ^TMyWidgets;

  procedure cursor_moved_cb(gobject: PGObject; pspec: PGParamSpec; Data: Tgpointer); cdecl;
  var
    widgets: PMyWidgets absolute Data;
    strong, weak: TGdkRectangle;
    buf: Pgchar;
    buffer: PGtkTextBuffer;
    iter: TGtkTextIter;
  begin
    with widgets^ do begin
      buffer := gtk_text_view_get_buffer(GTK_TEXT_VIEW(entry));
      gtk_text_buffer_get_iter_at_mark(buffer, @iter, gtk_text_buffer_get_insert(buffer));

      gtk_text_view_get_cursor_locations(GTK_TEXT_VIEW(entry), @iter, @strong, @weak);

      buf := g_strdup_printf('Starke Cursor-Position: x=%d, y=%d, width=%d, height=%d'#10'Schwache Cursor-Position: x=%d, y=%d, width=%d, height=%d',
        strong.x, strong.y, strong.Width, strong.Height, weak.x, weak.y, weak.Width, weak.Height);

      gtk_label_set_label(GTK_LABEL(lab), buf);
      g_free(buf);
    end;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    widgets: PMyWidgets absolute user_data;
    window, box, sw: PGtkWidget;
    buffer: PGtkTextBuffer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_window_set_child(GTK_WINDOW(window), box);

    sw := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(sw, True);
    gtk_box_append(GTK_BOX(box), sw);

    widgets^.entry := gtk_text_view_new;
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), widgets^.entry);

    buffer := gtk_text_view_get_buffer(GTK_TEXT_VIEW(widgets^.entry));
    g_signal_connect(buffer, 'notify::cursor-position', G_CALLBACK(@cursor_moved_cb), widgets);

    widgets^.lab := gtk_label_new('Bewege den Cursor oder tippe Text...');
    gtk_box_append(GTK_BOX(box), widgets^.lab);

    gtk_window_present(GTK_WINDOW(window));
  end;

  procedure main;
  var
    app: PGtkApplication;
    widgets: TMyWidgets;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), @widgets);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.

