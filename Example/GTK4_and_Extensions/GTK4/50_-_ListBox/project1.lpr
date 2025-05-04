program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  ListBox;

  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  begin
  end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, button, vbox, hbox1, hbox2, label1, lb: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    // Box1

    //  hbox1 := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    //    gtk_widget_set_hexpand(hbox1, True);

    lb := Create_ListBox;
    gtk_box_append(GTK_BOX(vbox), lb);
    //    gtk_box_append(GTK_BOX(hbox1), lb);

    //    label1 := gtk_label_new('box1');
    //    gtk_box_append(GTK_BOX(hbox1), label1);

    // Box2

    hbox2 := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(vbox), hbox2);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(hbox2), label1);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox2), button);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox2), button);

    gtk_window_set_child(GTK_WINDOW(window), vbox);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
