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
  var
    listBox: PGtkWidget absolute Data;
  begin
    DeleteItem(listBox, 2);
  end;



  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, button, panedBox, buttonBox, label1, lb1, lb2, paned: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    // Paned

    paned :=gtk_paned_new(GTK_ORIENTATION_VERTICAL);
    gtk_paned_set_wide_handle(GTK_PANED(paned), TRUE);
    gtk_box_append(GTK_BOX(panedBox), paned);


    lb1 := Create_ListBoxWidget;
    gtk_widget_set_vexpand(lb1, True);
    gtk_paned_set_start_child(GTK_PANED(paned), lb1);

    lb2 := Create_ListBoxWidget;
    gtk_widget_set_vexpand(lb2, True);
    gtk_paned_set_end_child(GTK_PANED(paned), lb2);

    // Box2

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(panedBox), buttonBox);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), lb1);
    gtk_box_append(GTK_BOX(buttonBox), button);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), lb2);
    gtk_box_append(GTK_BOX(buttonBox), button);

    gtk_window_set_child(GTK_WINDOW(window), panedBox);

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
