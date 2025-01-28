program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

const
  FirstName_Label_Key='firstNameLabel';
  LastName_Label_Key='lastNameLabel';
  FirstName_Entry_Key='firstNameEntry';
  LastName_Entry_Key='lastNameEntry';

  procedure update_main_window(main_window: PGtkWidget; vorname, nachname: Pgchar);
  var
    firstNameLabel, LastNameLabel: PGtkWidget;
    vorname_text, nachname_text: Pgchar;
  begin
    firstNameLabel := g_object_get_data(G_OBJECT(main_window), FirstName_Label_Key);
    LastNameLabel := g_object_get_data(G_OBJECT(main_window), LastName_Label_Key);

    vorname_text := g_strdup_printf('Vorname: %s', vorname);
    nachname_text := g_strdup_printf('Nachname: %s', nachname);

    gtk_label_set_text(GTK_LABEL(firstNameLabel), vorname_text);
    gtk_label_set_text(GTK_LABEL(LastNameLabel), nachname_text);

    g_free(vorname_text);
    g_free(nachname_text);
  end;

procedure on_help_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
begin
  g_printf('help....'#10);
end;

procedure on_quit_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
var
  window:PGtkWindow absolute user_data;
begin
  g_printf('close....'#10);
  gtk_window_destroy(window);
end;

  procedure on_ok_clicked(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  var
    dialogWindow, vorname_entry, nachname_entry: PGtkWidget;
    vorname, nachname: pchar;
    window:PGtkWindow absolute user_data;
  begin
    dialogWindow := gtk_widget_get_ancestor(widget, GTK_TYPE_WINDOW);

    vorname_entry := g_object_get_data(G_OBJECT(window), FirstName_Entry_Key);
    vorname := gtk_editable_get_text(GTK_EDITABLE(vorname_entry));

    nachname_entry := g_object_get_data(G_OBJECT(window), LastName_Entry_Key);
    nachname := gtk_editable_get_text(GTK_EDITABLE(nachname_entry));

    update_main_window(GTK_WIDGET(window), vorname, nachname);

    gtk_window_destroy(GTK_WINDOW(dialogWindow));
  end;

  procedure button_openDialog_clicked_cp(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  const
    dialgWindow: PGtkWidget = nil;
  var
    box, vorname_entry, nachname_entry, button_box, ok_button,
    cancel_button, help_button: PGtkWidget;
    parentWindow: PGtkWindow absolute user_data;
  begin
    dialgWindow := gtk_window_new;

    gtk_window_set_title(GTK_WINDOW(dialgWindow), 'Daten eingeben');
    gtk_window_set_default_size(GTK_WINDOW(dialgWindow), 300, 200);

//    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
    gtk_window_set_transient_for(GTK_WINDOW(dialgWindow), parentWindow);

    box := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(dialgWindow), box);

    gtk_box_append(GTK_BOX(box), gtk_label_new('Vorname:'));

    vorname_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(parentWindow), FirstName_Entry_Key,vorname_entry);
    gtk_box_append(GTK_BOX(box), vorname_entry);

    gtk_box_append(GTK_BOX(box), gtk_label_new('Nachname:'));

    nachname_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(parentWindow), LastName_Entry_Key,nachname_entry);
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
    g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_quit_clicked), dialgWindow);

    gtk_window_present(GTK_WINDOW(dialgWindow));
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
    g_object_set_data(G_OBJECT(window), FirstName_Label_Key,firstName_label);
    gtk_box_append(GTK_BOX(mainBox), firstName_label);

    lastName_label := gtk_label_new('Nachname: ');
    g_object_set_data(G_OBJECT(window), LastName_Label_Key,lastName_label);
    gtk_box_append(GTK_BOX(mainBox), lastName_label);

    button := gtk_button_new_with_label('Daten eingeben');
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_openDialog_clicked_cp), window);
    gtk_box_append(GTK_BOX(mainBox), button);

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
