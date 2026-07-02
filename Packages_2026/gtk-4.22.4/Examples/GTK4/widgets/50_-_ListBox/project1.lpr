program project1;

uses
  fp_glib2,
  fp_GTK4,
  ListBox;

  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    s: pchar;
  begin
    s := gtk_widget_get_name(widget);
    g_printf('name: %s'#10, s);
  end;


  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, button, vbox, hbox2, lb: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    lb := Create_ListBox;
    gtk_box_append(GTK_BOX(vbox), lb);

    hbox2 := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(vbox), hbox2);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox2), button);

    button := gtk_button_new_with_label('red');
    gtk_widget_set_name(GTK_WIDGET(button), 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox2), button);

    gtk_window_set_child(GTK_WINDOW(window), vbox);

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
