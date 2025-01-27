program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

  procedure update_main_window(main_window: PGtkWidget; vorname, nachname: Pgchar);
  var
    box, vorname_label, nachname_label: PGtkWidget;
    vorname_text, nachname_text: Pgchar;
  begin
    box := gtk_window_get_child(GTK_WINDOW(main_window));
    vorname_label := gtk_widget_get_first_child(box);
    nachname_label := gtk_widget_get_next_sibling(vorname_label);

    vorname_text := g_strdup_printf('Vorname: %s', vorname);
    nachname_text := g_strdup_printf('Nachname: %s', nachname);

    gtk_label_set_text(GTK_LABEL(vorname_label), vorname_text);
    gtk_label_set_text(GTK_LABEL(nachname_label), nachname_text);

    g_free(vorname_text);
    g_free(nachname_text);
  end;

  procedure on_help_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  begin
    g_printf('help....'#10);
  end;

  procedure on_ok_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  var
    window, box, vorname_entry, nachname_entry: PGtkWidget;
    vorname, nachname: pchar;
  begin
    window := gtk_widget_get_ancestor(widget, GTK_TYPE_WINDOW);
    box := gtk_window_get_child(GTK_WINDOW(window));
    vorname_entry := gtk_widget_get_next_sibling(gtk_widget_get_first_child(box));
    nachname_entry := gtk_widget_get_next_sibling(gtk_widget_get_next_sibling(vorname_entry));

    vorname := gtk_editable_get_text(GTK_EDITABLE(vorname_entry));
    nachname := gtk_editable_get_text(GTK_EDITABLE(nachname_entry));

    update_main_window(GTK_WIDGET(user_data), vorname, nachname);

    gtk_window_destroy(GTK_WINDOW(window));
  end;

  procedure button_clicked_cp(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  const
    window: PGtkWidget = nil;
  var
    box, vorname_entry, nachname_entry, button_box, ok_button,
    cancel_button, help_button: PGtkWidget;
    parentWindow: PGtkWindow absolute user_data;
  begin
    window := gtk_window_new;

    gtk_window_set_title(GTK_WINDOW(window), 'Daten eingeben');
    gtk_window_set_default_size(GTK_WINDOW(window), 300, 200);

    gtk_window_set_modal(GTK_WINDOW(window), TRUE);
    gtk_window_set_transient_for(GTK_WINDOW(window), parentWindow);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), box);

    vorname_entry := gtk_entry_new;
    nachname_entry := gtk_entry_new;

    gtk_box_append(GTK_BOX(box), gtk_label_new('Vorname:'));
    gtk_box_append(GTK_BOX(box), vorname_entry);
    gtk_box_append(GTK_BOX(box), gtk_label_new('Nachname:'));
    gtk_box_append(GTK_BOX(box), nachname_entry);

    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);

    help_button := gtk_button_new_with_label('Hilfe');
    gtk_box_append(GTK_BOX(button_box), help_button);

    ok_button := gtk_button_new_with_label('OK');
    gtk_box_append(GTK_BOX(button_box), ok_button);

    cancel_button := gtk_button_new_with_label('Abbrechen');
    gtk_box_append(GTK_BOX(button_box), cancel_button);

    gtk_box_append(GTK_BOX(box), button_box);

    g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_ok_clicked), parentWindow);
    g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_help_clicked), parentWindow);
    g_signal_connect_swapped(cancel_button, 'clicked', G_CALLBACK(@gtk_window_destroy), window);

    gtk_window_present(GTK_WINDOW(window));
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    window, mainBox, firstName_label, lastName_label, button: PGtkWidget;
  begin
    window := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(window), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(window), 320, 200);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(window), mainBox);

    firstName_label := gtk_label_new('Vorname: ');
    lastName_label := gtk_label_new('Nachname: ');
    button := gtk_button_new_with_label('Daten eingeben');

    gtk_box_append(GTK_BOX(mainBox), firstName_label);
    gtk_box_append(GTK_BOX(mainBox), lastName_label);
    gtk_box_append(GTK_BOX(mainBox), button);

    g_signal_connect(button, 'clicked', G_CALLBACK(@button_clicked_cp), window);

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
