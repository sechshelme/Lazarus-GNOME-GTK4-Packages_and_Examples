program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  fp_pango,
  fp_GLIBTools;



  procedure underline_cp(widget: PGtkWidget; Data: Tgpointer);
  var
    label_: PGtkWidget absolute Data;
    attr_list: PPangoAttrList;
    attr: PPangoAttribute;
  begin
    attr_list := pango_attr_list_new;
    attr := pango_attr_underline_new(PANGO_UNDERLINE_SINGLE);
    pango_attr_list_insert(attr_list, attr);

    attr := pango_attr_scale_new(5);
    pango_attr_list_insert(attr_list, attr);

    attr := pango_attr_underline_new(PANGO_UNDERLINE_DOUBLE);
    attr^.start_index := 3;
    attr^.end_index := 7;
    pango_attr_list_insert(attr_list, attr);

    attr := pango_attr_foreground_new($FFFF, $FFFF, $0000);
    attr^.start_index := 3;
    attr^.end_index := 7;
    pango_attr_list_insert(attr_list, attr);

    attr := pango_attr_background_new($0000, $0000, $FFFF);
    attr^.start_index := 2;
    attr^.end_index := 8;
    pango_attr_list_insert(attr_list, attr);


    gtk_label_set_attributes(GTK_LABEL(label_), attr_list);
    pango_attr_list_unref(attr_list);

  end;

  procedure reset_cp(widget: PGtkWidget; Data: Tgpointer);
  var
    label_: PGtkWidget absolute Data;
    attr_list: PPangoAttrList;
  begin
    attr_list := pango_attr_list_new;
    gtk_label_set_attributes(GTK_LABEL(label_), attr_list);
    pango_attr_list_unref(attr_list);
  end;

  procedure on_activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, box, picture1, picture2, Label1, Label2, button: PGtkWidget;
    sl: PGString;

  begin
    // === Widget

    window := g_object_new(GTK_TYPE_WINDOW,
      'application', app,
      'title', 'Pango Demo',
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
    button := gtk_button_new_with_label('Untertreichen');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@underline_cp), Label1);

    button := gtk_button_new_with_label('Reset');
    gtk_box_append(GTK_BOX(box), button);
    g_signal_connect(button, 'clicked', G_CALLBACK(@reset_cp), Label1);

    gtk_widget_show(window);
  end;

  procedure main;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.example.PangoExample', G_APPLICATION_FLAGS_NONE);
    g_signal_connect(app, 'activate', G_CALLBACK(@on_activate), nil);

    status := g_application_run(G_APPLICATION(app), 0, nil);
    g_object_unref(app);
  end;

begin
  main;
end.
