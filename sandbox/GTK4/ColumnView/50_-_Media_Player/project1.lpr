program project1;

uses
  Math,
  ctypes,
  fp_glib2,
  fp_cairo,
  //  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  culumn_view,
  LoadTitle,
  MenuBar;

  procedure on_scale_changed_cp(range: PGtkRange; user_data: Tgpointer); cdecl;
  begin
    IsChange := True;
  end;

  procedure VU_draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
    border = 3;
  begin
    cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);  // Weiß
    cairo_rectangle(cr, 0, 0, Width, Height);
    cairo_fill(cr);

    cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
    cairo_rectangle(cr, border, border, Width / 2, Height / 2 - 2 * border);
    cairo_fill(cr);

    cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
    cairo_rectangle(cr, border, Height / 2 + border, Width / 2, Height / 2 - 2 * border);
    cairo_fill(cr);
  end;

  function CreateMediaControlsPanel: PGtkWidget;
  var
    buttonBox, scale, VU_Meter, hbox: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);

    scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(scale), True);
    g_object_set_data(G_OBJECT(Result), scaleObjectKey, scale);

    gtk_scale_add_mark(GTK_SCALE(scale), 0, GTK_POS_BOTTOM, 'Min');
    gtk_scale_add_mark(GTK_SCALE(scale), 50, GTK_POS_BOTTOM, 'mit');
    gtk_scale_add_mark(GTK_SCALE(scale), 100, GTK_POS_BOTTOM, 'Max');

    gtk_scale_set_value_pos(GTK_SCALE(scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(scale), 0.0);
    changed_handler_id := g_signal_connect(scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), nil);
    gtk_box_append(GTK_BOX(Result), scale);

    hbox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_margin_start(hbox, 10);
    gtk_widget_set_margin_end(hbox, 10);
    gtk_widget_set_margin_top(hbox, 10);
    gtk_widget_set_margin_bottom(hbox, 10);
    gtk_widget_set_valign(hbox, GTK_ALIGN_START);

    buttonBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    createBtnButton(buttonBox, nil, 'media-skip-backward-symbolic', 'app.listbox.prev');
    createBtnButton(buttonBox, nil, 'media-seek-backward-symbolic', 'app.listbox.backward');
    createBtnButton(buttonBox, nil, 'media-playback-start-symbolic', 'app.listbox.play');
    createBtnButton(buttonBox, nil, 'media-playback-pause-symbolic', 'app.listbox.pause');
    createBtnButton(buttonBox, nil, 'media-playback-stop-symbolic', 'app.listbox.stop');
    createBtnButton(buttonBox, nil, 'media-seek-forward-symbolic', 'app.listbox.forward');
    createBtnButton(buttonBox, nil, 'media-skip-forward-symbolic', 'app.listbox.next');
    gtk_box_append(GTK_BOX(hbox), buttonBox);

    VU_Meter := gtk_drawing_area_new;
    gtk_widget_set_margin_start(VU_Meter, 10);
    gtk_widget_set_hexpand(VU_Meter, True);
    gtk_widget_set_size_request(VU_Meter, -1, 50);  // Setzt eine feste Höhe von 50 Pixeln
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(VU_Meter), @VU_draw_func, nil, nil);
    gtk_box_append(GTK_BOX(hbox), VU_Meter);

    gtk_box_append(GTK_BOX(Result), hbox);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, panedBox, buttonBox, label1, columnView, scrolled_window: PGtkWidget;
    scale, mediaControlPanel, HBox: PGtkWidget;
    mainmenu: PGMenu;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Border und Bevel');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    panedBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(panedBox, 10);
    gtk_widget_set_margin_end(panedBox, 10);
    gtk_widget_set_margin_top(panedBox, 10);
    gtk_widget_set_margin_bottom(panedBox, 10);

    mainmenu := CreateMenu;
    gtk_box_append(GTK_BOX(panedBox), gtk_popover_menu_bar_new_from_model(G_MENU_MODEL(CreateMenu)));
    g_object_unref(mainmenu);

    mediaControlPanel := CreateMediaControlsPanel;
    gtk_box_append(GTK_BOX(panedBox), mediaControlPanel);
    scale := g_object_get_data(G_OBJECT(mediaControlPanel), scaleObjectKey);

    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(panedBox), HBox);

    scrolled_window := gtk_scrolled_window_new;
    columnView := Create_ListBoxWidget;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_widget_set_hexpand(scrolled_window, True);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), columnView);
    gtk_box_append(GTK_BOX(HBox), scrolled_window);
    g_object_set_data(G_OBJECT(columnView), scaleObjectKey, scale);

    buttonBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), buttonBox);

    // ButtonBox

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    CreateBtnButton(buttonBox, 'Next', 'go-down', 'app.listbox.next');
    CreateBtnButton(buttonBox, 'Prev', 'go-up', 'app.listbox.prev');
    CreateBtnButton(buttonBox, 'Append', 'list-add', 'app.listbox.append');
    CreateBtnButton(buttonBox, 'Remove', 'list-remove', 'app.listbox.remove');
    CreateBtnButton(buttonBox, 'Remove All', 'list-remove-all', 'app.listbox.removeall');
    CreateBtnButton(buttonBox, 'Down', 'view-sort-descending', 'app.listbox.down');
    CreateBtnButton(buttonBox, 'Up', 'view-sort-descending', 'app.listbox.up');

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
    //    GSignalShow(G_TYPE_OBJECT);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
