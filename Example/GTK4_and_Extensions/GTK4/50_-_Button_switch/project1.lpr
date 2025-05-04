program project1;

uses
  ctypes,
  SysUtils,
  fp_glib2,
  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4;


  procedure btn_click_cp(widget: PGtkWidget; Data: Tgpointer); cdecl;
  var
    box, vbox, child, box1, box2: PGtkWidget;
  begin
    box := gtk_widget_get_parent(widget);
    vbox := gtk_widget_get_parent(box);

    child := gtk_widget_get_first_child(vbox);
    box1 := child;

    while child <> nil do begin
      child := gtk_widget_get_next_sibling(child);
      if child <> nil then  begin
        box2 := child;
      end;
    end;

    gtk_widget_unparent(widget);
    if box = box1 then begin
      gtk_box_append(GTK_BOX(box2), widget);
    end else begin
      gtk_box_append(GTK_BOX(box1), widget);
    end;
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer);
  var
    window, button, vbox, hbox1, hbox2, label1: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(vbox, 10);
    gtk_widget_set_margin_end(vbox, 10);
    gtk_widget_set_margin_top(vbox, 10);
    gtk_widget_set_margin_bottom(vbox, 10);

    hbox1 := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(vbox), hbox1);

    label1 := gtk_label_new('box1');
    gtk_box_append(GTK_BOX(hbox1), label1);

    button := gtk_button_new_with_label('red');
    gtk_widget_set_name(GTK_WIDGET(button), 'red');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox1), button);

    button := gtk_button_new_with_label('blue');
    gtk_widget_set_name(GTK_WIDGET(button), 'blue');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox1), button);

    button := gtk_button_new_with_label('green');
    gtk_widget_set_name(GTK_WIDGET(button), 'green');
    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), nil);
    gtk_box_append(GTK_BOX(hbox1), button);

    hbox2 := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_box_append(GTK_BOX(vbox), hbox2);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(hbox2), label1);

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
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
