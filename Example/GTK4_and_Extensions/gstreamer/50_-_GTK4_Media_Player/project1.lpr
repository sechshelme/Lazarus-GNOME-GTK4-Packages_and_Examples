program project1;

uses
  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_gst,

  Common,
  LoadTitle,
  MenuBar,
  XML_Tools,
  LoadSaveSongs,

  MPStreamer,
  MPTimerLoop,
  MPVUMeterWidget,
  MPColumnViewBox,
  MPSongItem,
  MPDurationBox,
  MPaction,
  MPButtonBox,
  MPMenuButton,
  MPPlayerButtonBox,
  MPColumnViewControl,
  MPMainWindow;


  procedure on_scale_changed_cp({%H-}range: PGtkRange; user_data: Tgpointer); cdecl;
  var
    sharedWidget: PSharedWidget absolute user_data;
  begin
    sharedWidget^.IsChange := True;
  end;

  procedure app_destroy_cp(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    sharedWidget: PSharedWidget absolute user_data;
  begin
    if sharedWidget^.idle_id > 0 then begin
      g_source_remove(sharedWidget^.idle_id);
      sharedWidget^.idle_id := 0;
    end;
    if PriStream <> nil then begin
      gst_clear_object(@PriStream);
    end;
    if SekStream <> nil then begin
      gst_clear_object(@SekStream);
    end;

    g_free(sharedWidget);
  end;

  procedure app_activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    mainLayout, columnViewControlBox, scrolled_window,
    mediaControlPanel, HBox, VBox,
    columnBox, ColumnViewButtonBox, header_bar, menubutton: PGtkWidget;
    sharedWidgets: PSharedWidget;
  begin
    sharedWidgets := g_malloc0(SizeOf(TSharedWidget));
    sharedWidgets^.scale_changed_id := 0;
    sharedWidgets^.IsChange := False;

    g_object_set(gtk_settings_get_default, 'gtk-application-prefer-dark-theme', gTrue, nil);

    // ==== Main Window
    sharedWidgets^.main_window := mp_main_window_new(sharedWidgets);
    gtk_window_set_application(GTK_WINDOW(sharedWidgets^.main_window), app);



    // --- Haupt-Container für das ganze Fenster
    mainLayout := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_margin_start(mainLayout, 10);
    gtk_widget_set_margin_end(mainLayout, 10);
    gtk_widget_set_margin_top(mainLayout, 10);
    gtk_widget_set_margin_bottom(mainLayout, 10);

    // --- Bereich 1: Scale (Fortschrittsbalken)
    sharedWidgets^.scale := gtk_scale_new_with_range(GTK_ORIENTATION_HORIZONTAL, 0.0, 100.0, 1.0);
    gtk_scale_set_draw_value(GTK_SCALE(sharedWidgets^.scale), True);
    gtk_scale_set_value_pos(GTK_SCALE(sharedWidgets^.scale), GTK_POS_TOP);
    gtk_range_set_value(GTK_RANGE(sharedWidgets^.scale), 0.0);
    sharedWidgets^.scale_changed_id := g_signal_connect(sharedWidgets^.scale, 'value-changed', G_CALLBACK(@on_scale_changed_cp), sharedWidgets);
    gtk_box_append(GTK_BOX(mainLayout), sharedWidgets^.scale);

    // --- Bereich 2: Obere Steuerung (Buttons & VU-Meter)
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainLayout), HBox);

    VBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), VBox);

    // MediaButtons (Play, Stop, etc.)
    mediaControlPanel := mp_player_button_box_new;
    g_signal_connect(mediaControlPanel, 'action-triggered', G_CALLBACK(@on_box_action_received), sharedWidgets);
    gtk_box_append(GTK_BOX(VBox), mediaControlPanel);

    // Zeit-Labels (Position / Duration)
    sharedWidgets^.Label_Box := mp_duration_box_new;
    gtk_box_append(GTK_BOX(VBox), sharedWidgets^.Label_Box);

    // VU-Meter Widget hinzufügen
    sharedWidgets^.VUMeter := mp_vu_meter_widget_new;
    gtk_widget_set_hexpand(sharedWidgets^.VUMeter, True);
    gtk_widget_set_size_request(sharedWidgets^.VUMeter, 100, 50);
    gtk_box_append(GTK_BOX(HBox), sharedWidgets^.VUMeter);

    // --- Bereich 3: Liste (ColumnView) und Edit-Buttons
    HBox := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 10);
    gtk_widget_set_hexpand(HBox, True);
    gtk_widget_set_vexpand(HBox, True);
    gtk_box_append(GTK_BOX(mainLayout), HBox);

    // ScrolledWindow für die Liste
    scrolled_window := gtk_scrolled_window_new;
    gtk_widget_set_vexpand(scrolled_window, True);
    gtk_widget_set_hexpand(scrolled_window, True);

    // Erstelle die Custom Box (MPColumnViewBox), welche die GtkColumnView enthält
    columnBox := mp_column_view_box_new(sharedWidgets);
    g_signal_connect(columnBox, 'action-triggered', G_CALLBACK(@on_box_action_received), sharedWidgets);

    // Die Box in das ScrolledWindow packen
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), columnBox);
    gtk_box_append(GTK_BOX(HBox), scrolled_window);

    // ColumnView Control
    columnViewControlBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_box_append(GTK_BOX(HBox), columnViewControlBox);

    gtk_box_append(GTK_BOX(columnViewControlBox), gtk_label_new('Edit'));

    ColumnViewButtonBox := mp_column_view_control_new;
    gtk_orientable_set_orientation(GTK_ORIENTABLE(ColumnViewButtonBox), GTK_ORIENTATION_VERTICAL);
    g_signal_connect(ColumnViewButtonBox, 'action-triggered', G_CALLBACK(@on_box_action_received), sharedWidgets);
    gtk_box_append(GTK_BOX(columnViewControlBox), ColumnViewButtonBox);

    // --- Fertigstellung
    gtk_window_set_child(GTK_WINDOW(sharedWidgets^.main_window), mainLayout);
    gtk_window_present(GTK_WINDOW(sharedWidgets^.main_window));

    // Timerloop
    sharedWidgets^.idle_id := g_timeout_add(100, @timerFunc_cp, sharedWidgets);
    g_signal_connect(sharedWidgets^.main_Window, 'destroy', G_CALLBACK(@app_destroy_cp), sharedWidgets);
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    gst_init(@argc, @argv);
    app := gtk_application_new('org.gtk.mediaplayer', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@app_activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
