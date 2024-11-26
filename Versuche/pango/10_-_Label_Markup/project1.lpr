program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_pango,
  fp_GLIBTools;



  procedure print_hello(widget: PGtkWidget; Data: Tgpointer);
  var
    label_: PGtkWidget absolute Data;
    attrs: PPangoAttrList;
    underline_attr, underline_double_attr: PPangoAttribute;
  begin
    gtk_label_set_label(GTK_LABEL(label_), 'blu blu');

    attrs := pango_attr_list_new;
    underline_attr := pango_attr_underline_new(PANGO_UNDERLINE_SINGLE);
    pango_attr_list_insert(attrs, underline_attr);

    underline_double_attr := pango_attr_underline_new(PANGO_UNDERLINE_DOUBLE);
    underline_double_attr^.start_index := 1;
    underline_double_attr^.end_index := 3;
    pango_attr_list_insert(attrs, underline_double_attr);

    gtk_label_set_attributes(GTK_LABEL(label_), attrs);
    pango_attr_list_unref(attrs);

  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, picture1, picture2, Label1, Label2, button: PGtkWidget;
    sl: PGString;

  begin
    // === Widget

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pixbuf Demo',
      'width-request', 150,
      'height-request', 150,
      'default-width', 320,
      'default-height', 200,
      'maximized', gFalse,
      nil);

    box := g_object_new(GTK_TYPE_BOX,
      'orientation', GTK_ORIENTATION_VERTICAL,
      'hexpand', gTrue,
      'vexpand', gTrue,
      'margin-start', 10,
      'margin-end', 10,
      'margin-top', 10,
      'margin-bottom', 10,
      'spacing', 10,
      nil);
    gtk_window_set_child(GTK_WINDOW(window), box);

    // Label
    Label1 := gtk_label_new('Hello World !');
    gtk_box_append(GTK_BOX(box), Label1);

    // https://www.perplexity.ai/search/gib-mir-ein-pango-besipiel-wel-5xDvcKw4RuWTm6My1V9z2g

    // button
    button := gtk_button_new_with_label('Untertreiche');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@print_hello), Label1);

    gtk_widget_show(window);

  end;

  procedure main;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.example.PixbufExample', G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    status := g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
