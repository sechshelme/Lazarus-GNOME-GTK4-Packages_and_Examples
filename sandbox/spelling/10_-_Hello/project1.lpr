program project1;

uses
  spelling_language,
  spelling_provider,
  spelling_checker,
  spelling_init,
  spelling_language_info,
  spelling_text_buffer_adapter,
  spelling_version,




  fp_glib2,
  fp_cairo,
  fp_GTK4,
  fp_pango,
  fp_gtksourceview,
  fp_spelling;

  procedure activate(app: PGtkApplication; user_data: Tgpointer); cdecl;
  var
    window, scrolled_window, source_view: PGtkWidget;
    checker: PSpellingChecker;
    buffer: PGtkSourceBuffer;
    adapter: PSpellingTextBufferAdapter;
    spelling_model: PGMenuModel;
    extra_menu: PGMenu;
  begin
    gtk_source_init;

    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Rechtschreibprüfung mit Menü');
    gtk_window_set_default_size(GTK_WINDOW(window), 400, 300);

    scrolled_window := gtk_scrolled_window_new;
    gtk_window_set_child(GTK_WINDOW(window), scrolled_window);

    source_view := gtk_source_view_new;
    gtk_text_view_set_wrap_mode(GTK_TEXT_VIEW(source_view), GTK_WRAP_WORD);
    gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolled_window), source_view);

    checker := spelling_checker_get_default;
    spelling_checker_set_language(checker, 'de_DE');

    buffer := GTK_SOURCE_BUFFER(gtk_text_view_get_buffer(GTK_TEXT_VIEW(source_view)));
    adapter := spelling_text_buffer_adapter_new(buffer, checker);
    spelling_text_buffer_adapter_set_enabled(adapter, True);

    gtk_widget_insert_action_group(GTK_WIDGET(source_view), 'spelling', G_ACTION_GROUP(adapter));

    spelling_model := spelling_text_buffer_adapter_get_menu_model(adapter);

    if spelling_model <> nil then begin
      extra_menu := g_menu_new;

      g_menu_prepend_section(extra_menu, nil, spelling_model);

      gtk_text_view_set_extra_menu(GTK_TEXT_VIEW(source_view), G_MENU_MODEL(extra_menu));
      g_object_unref(extra_menu);
      gtk_window_present(GTK_WINDOW(window));
    end;
  end;

  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.sourceview.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
