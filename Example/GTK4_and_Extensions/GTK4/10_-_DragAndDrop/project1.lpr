program project1;

uses
  ctypes,
  fp_GLIBTools,
  fp_glib2,
  fp_GDK4,
  fp_GTK4;

  function on_drop(drop_target: PGtkDropTarget; Value: PGValue; x, y: double; user_data: Pointer): Tgboolean;
  var
    buffer: PGtkTextBuffer absolute user_data;
    uri_list: Pgchar;
  begin
    Result := False;
    g_printf('Position:    X: %4.2f   Y: %4.2f'#10, x, y);

    if G_VALUE_HOLDS(Value, G_TYPE_STRING) then begin
      uri_list := g_value_get_string(Value);
      gtk_text_buffer_set_text(buffer, uri_list, -1);
      Result := True;
    end;
  end;

  function on_accept(drop_target: PGtkDropTarget; drop: PGdkDrop; user_data: Pointer): Tgboolean;
  begin
    g_print('Drag-and-Drop "accept"'#10);
    Result := True;
  end;


  procedure on_enter(drop_target: PGtkDropTarget; drop: PGdkDrop; x, y: double; user_data: Pointer);
  begin
    g_print('Drag-and-Drop "enter"'#10);
  end;


  procedure on_leave(drop_target: PGtkDropTarget; user_data: Pointer);
  begin
    gtk_drop_target_reject(drop_target);
    g_print('Drag-and-Drop "leave"'#10);
  end;


  procedure on_motion(drop_target: PGtkDropTarget; drop: PGdkDrop; x, y: double; user_data: Pointer);
  begin
    g_print('Drag-and-Drop "motion"'#10);
  end;

  function createLabel: PGtkWidget;
  var
    provider: PGtkCssProvider;
  begin
    Result := gtk_label_new('Daten hier hin ziehen');

    provider := gtk_css_provider_new;
    gtk_css_provider_load_from_string(provider,
      'label { ' +
      '  background-color: green; ' +
      '  color: white; ' +
      '  padding: 0; ' +
      '  min-height: 50px;}');

    gtk_style_context_add_provider_for_display(gdk_display_get_default, GTK_STYLE_PROVIDER(provider), GTK_STYLE_PROVIDER_PRIORITY_USER);
    g_object_unref(provider);
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box, lab, text_view, sw: PGtkWidget;
    drop_target: PGtkDropTarget;
    textBuffer: PGtkTextBuffer;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Darg&Drop');
    gtk_window_set_default_size(GTK_WINDOW(window), 640, 480);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 0);
    gtk_window_set_child(GTK_WINDOW(window), box);

    lab := createLabel;
    gtk_box_append(GTK_BOX(box), lab);


    sw := gtk_scrolled_window_new;
    gtk_widget_set_hexpand(sw, True);
    gtk_widget_set_vexpand(sw, True);
    gtk_box_append(GTK_BOX(box), sw);

    text_view := gtk_text_view_new();
    textBuffer := gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_view));
    gtk_text_buffer_set_text(textBuffer, 'Demo Demo', -1);

    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(sw), text_view);


    drop_target := gtk_drop_target_new(G_TYPE_STRING, GDK_ACTION_COPY);
    //    drop_target := gtk_drop_target_async_new(G_TYPE_STRING, GDK_ACTION_COPY);
    g_signal_connect(drop_target, 'drop', G_CALLBACK(@on_drop), textBuffer);
    //    g_signal_connect(drop_target, 'accept', G_CALLBACK(@on_accept), nil);
    //    g_signal_connect(drop_target, 'enter', G_CALLBACK(@on_enter), nil);
    g_signal_connect(drop_target, 'leave', G_CALLBACK(@on_leave), nil);
    //    g_signal_connect(drop_target, 'motion', G_CALLBACK(@on_motion), nil);
    gtk_widget_add_controller(GTK_WIDGET(lab), GTK_EVENT_CONTROLLER(drop_target));

    //  GObjectShowProperty(drop_target);

    gtk_window_present(GTK_WINDOW(window));
  end;


  function main(argc: cint; argv: PPChar): cint;
  var
    app: PGtkApplication;
    status: longint;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    status := g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);

    Exit(status);
  end;

begin
  main(argc, argv);
end.
