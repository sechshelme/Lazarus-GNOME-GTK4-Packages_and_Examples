program project1;

uses
  Math,
  ctypes,
  fp_glib2,
  fp_cairo,
  //  fp_GLIBTools,
  fp_GDK4,
  fp_GTK4,
  Streamer,
  culumn_view,
  LoadTitle,
  MenuBar;

  procedure on_scale_changed_cp(range: PGtkRange; user_data: Tgpointer); cdecl;
  var
    sharedWidget: PSharedWidget absolute user_data;
  begin
    sharedWidget^.IsChange := True;
  end;

  procedure action_cp(action: PGSimpleAction; {%H-}parameter: PGVariant; user_data: Tgpointer); cdecl;
  var
    action_name: string;
    app: PGApplication;
    windowList: PGList;
  begin
    app := g_application_get_default;
    windowList := gtk_application_get_windows(GTK_APPLICATION(app));

    action_name := g_action_get_name(G_ACTION(action));
    case action_name of
      'quit': begin
        gtk_window_close(GTK_WINDOW(windowList^.Data));
      end;
      else begin
        g_printf('Unbekannte Action, Name: "%s"'#10, Pgchar(action_name));
      end;
    end;
  end;


  procedure VU_draw_func(drawing_area: PGtkDrawingArea; cr: Pcairo_t; Width: longint; Height: longint; user_data: Tgpointer); cdecl;
  const
    border = 3;
  var
    Level: PLevel;
    w: Tguint32;

    function dB_to_Prozent(db: Tgdouble): Tguint32;
    begin
      Result := 300 - abs(Round(db) * 10);
    end;

  begin
    cairo_set_source_rgb(cr, 0.0, 0.0, 0.0);
    cairo_rectangle(cr, 0, 0, Width, Height);
    cairo_fill(cr);

    Level := g_object_get_data(G_OBJECT(drawing_area), LevelKey);
    if Level <> nil then begin

      w := dB_to_Prozent(Level^.L);
      cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
      cairo_rectangle(cr, border, border, border + w, Height / 2 - 2 * border);
      cairo_fill(cr);

      w := dB_to_Prozent(Level^.R);
      cairo_set_source_rgb(cr, 1.0, 0.0, 0.0);  // Rot
      cairo_rectangle(cr, border, Height / 2 + border, border + w, Height / 2 - 2 * border);
      cairo_fill(cr);
    end;
  end;

  function CreateMediaButtons: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    createBtnButton(Result, nil, 'media-skip-backward-symbolic', 'app.listbox.prev');
    createBtnButton(Result, nil, 'media-seek-backward-symbolic', 'app.listbox.backward');
    createBtnButton(Result, nil, 'media-playback-start-symbolic', 'app.listbox.play');
    createBtnButton(Result, nil, 'media-playback-pause-symbolic', 'app.listbox.pause');
    createBtnButton(Result, nil, 'media-playback-stop-symbolic', 'app.listbox.stop');
    createBtnButton(Result, nil, 'media-seek-forward-symbolic', 'app.listbox.forward');
    createBtnButton(Result, nil, 'media-skip-forward-symbolic', 'app.listbox.next');
  end;

  function CreateMediaControlsPanel: PGtkWidget;
  var
    buttonBox: PGtkWidget;
  begin
    Result := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_margin_start(Result, 10);
    gtk_widget_set_margin_end(Result, 10);
    gtk_widget_set_margin_top(Result, 10);
    gtk_widget_set_margin_bottom(Result, 10);
    gtk_widget_set_valign(Result, GTK_ALIGN_START);

    buttonBox := CreateMediaButtons;
    gtk_box_append(GTK_BOX(Result), buttonBox);
  end;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, mainBox, buttonBox, label1, columnView, scrolled_window: PGtkWidget;
    mediaControlPanel, HBox: PGtkWidget;
    sharedWidget: PSharedWidget;
    mainmenu: PGMenu;
    action: PGSimpleAction;
  begin
    // --- sharedWidget
    sharedWidget := g_malloc(SizeOf(TSharedWidget));
    sharedWidget^.scale_changed_id := 0;
    sharedWidget^.IsChange := False;

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'Media Player');
    gtk_window_set_default_size(GTK_WINDOW(window), 600, 400);

    // --- MainBox
    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(mainBox, 10);
    gtk_widget_set_margin_end(mainBox, 10);
    gtk_widget_set_margin_top(mainBox, 10);
    gtk_widget_set_margin_bottom(mainBox, 10);

    // Mainmenu
    mainmenu := CreateMenu;
    gtk_box_append(GTK_BOX(mainBox), gtk_popover_menu_bar_new_from_model(G_MENU_MODEL(CreateMenu)));
    g_object_unref(mainmenu);

    action := g_simple_action_new('quit', nil);
    g_signal_connect(action, 'activate', G_CALLBACK(@action_cp), nil);
    g_action_map_add_action(G_ACTION_MAP(app), G_ACTION(action));
    g_object_unref(action);

    // --- Box 1
    // Scale
    sharedWidget^.scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(sharedWidget^.scale), True);

    gtk_scale_set_value_pos(GTK_SCALE(sharedWidget^.scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(sharedWidget^.scale), 0.0);
    sharedWidget^.scale_changed_id := g_signal_connect(sharedWidget^.scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), sharedWidget);
    gtk_box_append(GTK_BOX(mainBox), sharedWidget^.scale);

    // --- Box 2
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainBox), HBox);

    // MediaButton
    mediaControlPanel := CreateMediaControlsPanel;
    gtk_box_append(GTK_BOX(HBox), mediaControlPanel);

    // VU-Meter
    sharedWidget^.VUMeter := gtk_drawing_area_new;
    gtk_widget_set_hexpand(sharedWidget^.VUMeter, True);
    gtk_widget_set_size_request(sharedWidget^.VUMeter, 100, 50);
    gtk_drawing_area_set_draw_func(GTK_DRAWING_AREA(sharedWidget^.VUMeter), @VU_draw_func, nil, nil);
    gtk_box_append(GTK_BOX(HBox), sharedWidget^.VUMeter);

    // --- Box 3
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainBox), HBox);

    // ScrolledWindows / ColumnView
    scrolled_window := gtk_scrolled_window_new;
    columnView := Create_ListBoxWidget;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_widget_set_hexpand(scrolled_window, True);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), columnView);
    gtk_box_append(GTK_BOX(HBox), scrolled_window);
    g_object_set_data_full(G_OBJECT(columnView), sharedWidgetKey, sharedWidget, @g_free);

    // ButtonBox
    buttonBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), buttonBox);

    label1 := gtk_label_new('box2');
    gtk_box_append(GTK_BOX(buttonBox), label1);

    CreateBtnButton(buttonBox, 'Append', 'list-add', 'app.listbox.append');
    CreateBtnButton(buttonBox, 'Remove', 'list-remove', 'app.listbox.remove');
    CreateBtnButton(buttonBox, 'Remove All', 'list-remove-all', 'app.listbox.removeall');
    CreateBtnButton(buttonBox, 'Down', 'view-sort-descending', 'app.listbox.down');
    CreateBtnButton(buttonBox, 'Up', 'view-sort-descending', 'app.listbox.up');

    // --- Box End
    gtk_window_set_child(GTK_WINDOW(window), mainBox);
    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure main(argc: cint; argv: PPChar);
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.gtk.mediaplayer', G_APPLICATION_DEFAULT_FLAGS);

    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main(argc, argv);
end.
