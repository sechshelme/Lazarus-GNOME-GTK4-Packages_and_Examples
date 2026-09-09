program project1;

uses
  fp_glib2,
  fp_GTK4,
  fp_gtkhex;

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

  function CreateHexWidget: PGtkWidget;
  const data = 'Hallo GTK4 und GHex! Das wird direkt aus dem Speicher gelesen.'#10;
  var
    len: SizeInt;
    doc: PHexDocument;
    buffer: PHexBuffer;
    hexwidget: PGtkWidget;
  begin
    len := Length(data) - 1;

    doc := hex_document_new;

    buffer := hex_document_get_buffer(doc);

    if buffer <> nil then begin
      hex_buffer_set_data(buffer, 0, len, len, data);
    end else begin
      g_printerr('Fehler: Buffer konnte nicht geholt werden!'#10);
    end;

    hexwidget := hex_widget_new(doc);

    hex_widget_set_insert_mode(HEX_WIDGET(hexwidget), True);

    gtk_widget_set_hexpand(hexwidget, True);
    gtk_widget_set_vexpand(hexwidget, True);

    Result := gtk_scrolled_window_new;
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(Result), hexwidget);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, box, button, hw: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Window');
    gtk_window_set_default_size(GTK_WINDOW(window), 800, 600);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    hw := CreateHexWidget;
    gtk_box_append(GTK_BOX(box), hw);

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
