program project1;

uses
  ctypes,
  fp_glib2,
  fp_GTK4;

  procedure btn_click_cp({%H-}widget: PGtkWidget; Data: Tgpointer);
  var
    popover: PGtkPopover absolute Data;
  begin
    gtk_popover_popup(popover);
  end;

  procedure btn_item_click_cp({%H-}widget: PGtkWidget; Data: Tgpointer);
  var
    info: Pgchar absolute Data;
  begin
    g_printf('Es wurde geklick: %s'#10, info);
  end;

  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer);
  var
    window, button, vbox,
    popover_box, item1, item2, popover: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Popover-Menü');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    vbox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_window_set_child(GTK_WINDOW(window), vbox);

    button := gtk_button_new_with_label('Menü öffnen');
    gtk_box_append(GTK_BOX(vbox), button);

    popover := gtk_popover_new;
    gtk_widget_set_parent(popover, button);

    popover_box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_popover_set_child(GTK_POPOVER(popover), popover_box);

    item1 := gtk_button_new_with_label('Option 1');
    g_signal_connect(item1, 'clicked', G_CALLBACK(@btn_item_click_cp), Pgchar('Option 1'));
    gtk_box_append(GTK_BOX(popover_box), item1);

    item2 := gtk_button_new_with_label('Option 2');
    g_signal_connect(item2, 'clicked', G_CALLBACK(@btn_item_click_cp), Pgchar('Option 2'));
    gtk_box_append(GTK_BOX(popover_box), item2);

    g_signal_connect(button, 'clicked', G_CALLBACK(@btn_click_cp), popover);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.gtk.example', G_APPLICATION_FLAGS_NONE);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
