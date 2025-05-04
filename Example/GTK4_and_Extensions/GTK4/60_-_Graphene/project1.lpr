program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_cairo,
  fp_pango,
  fp_GTK4,
  fp_GDK4,
  fp_graphene;

  procedure click_cb(widget: PGtkWidget; Data: Tgpointer);
  var
    text_view: PGtkWidget absolute Data;
    strong, weak: TGdkRectangle;
    buf: array[0..1024] of Tgchar;
    buffer: PGtkTextBuffer;
    iter: TGtkTextIter;
  begin
    buffer := gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_view));
    gtk_text_buffer_get_iter_at_mark(buffer, @iter, gtk_text_buffer_get_insert(buffer));

    gtk_text_view_get_cursor_locations(GTK_TEXT_VIEW(text_view), @iter, @strong, @weak);

    g_sprintf(buf, 'Starke Cursor-Position: x=%d, y=%d, width=%d, height=%d'#10'"Schwache Cursor-Position: x=%d, y=%d, width=%d, height=%d',
      strong.x, strong.y, strong.Width, strong.Height,
      weak.x, weak.y, weak.Width, weak.Height);

    WriteLn(buf);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, button, text_view, sw: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 400);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_window_set_child(GTK_WINDOW(window), box);

    button := gtk_button_new_with_label('Button');
    gtk_box_append(GTK_BOX(box), button);

    sw := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(sw, True);
    gtk_box_append(GTK_BOX(box), sw);

    text_view := gtk_text_view_new;
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), text_view);

    g_signal_connect(button, 'clicked', G_CALLBACK(@click_cb), text_view);

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
