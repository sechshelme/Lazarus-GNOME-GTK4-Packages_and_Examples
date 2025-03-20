program project1;

uses
  ctypes,
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4;

const
  FirstName_Label_Key = 'firstNameLabel';
  LastName_Label_Key = 'lastNameLabel';
  FirstName_Entry_Key = 'firstNameEntry';
  LastName_Entry_Key = 'lastNameEntry';
  mainWindows_Key = 'mainWindow';
  cmd_Key = 'cmd';

  cmdOk = 1000;
  cmdCancel = 1001;
  cmdApply = 1002;
  cmHelp = 1003;

  procedure on_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
  var
    mainWindow, FirstName_entry, LastName_entry: PGtkWidget;
    vorname, nachname: pchar;
    dialogWindow: PGtkWindow absolute user_data;
    FirstNameLabel, LastNameLabel: PGtkWidget;
    FirstName_text, LastName_text: Pgchar;
    cmd: Tgint;
  begin
    cmd := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmd_Key));

    mainWindow := g_object_get_data(G_OBJECT(dialogWindow), mainWindows_Key);

    if (cmd = cmdOk) or (cmd = cmdApply) then begin
      FirstName_entry := g_object_get_data(G_OBJECT(dialogWindow), FirstName_Entry_Key);
      vorname := gtk_editable_get_text(GTK_EDITABLE(FirstName_entry));
      FirstNameLabel := g_object_get_data(G_OBJECT(mainwindow), FirstName_Label_Key);
      FirstName_text := g_strdup_printf('Vorname: %s', vorname);
      gtk_label_set_text(GTK_LABEL(FirstNameLabel), FirstName_text);
      g_free(FirstName_text);

      LastName_entry := g_object_get_data(G_OBJECT(dialogWindow), LastName_Entry_Key);
      nachname := gtk_editable_get_text(GTK_EDITABLE(LastName_entry));
      LastNameLabel := g_object_get_data(G_OBJECT(mainwindow), LastName_Label_Key);
      LastName_text := g_strdup_printf('Nachname: %s', nachname);
      gtk_label_set_text(GTK_LABEL(LastNameLabel), LastName_text);
      g_free(LastName_text);
    end;

    if (cmd = cmdOk) or (cmd = cmdCancel) then begin
      gtk_window_destroy(GTK_WINDOW(dialogWindow));
    end;

    if cmd = cmHelp then begin
      g_printf('help....'#10);
    end;
  end;


  procedure button_openDialog_clicked_cp(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  const
    dialgWindow: PGtkWidget = nil;
  var
    mainBox, FirstName_entry, LastName_entry, button_box, ok_button,
    cancel_button, help_button, apply_button, contentBox, lab: PGtkWidget;
    mainWindow: PGtkWindow absolute user_data;
  begin
    dialgWindow := gtk_window_new;

    g_object_set_data(G_OBJECT(dialgWindow), mainWindows_Key, mainWindow);


    gtk_window_set_title(GTK_WINDOW(dialgWindow), 'Daten eingeben');
    gtk_window_set_default_size(GTK_WINDOW(dialgWindow), 300, 200);

    //    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
    gtk_window_set_transient_for(GTK_WINDOW(dialgWindow), mainWindow);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(dialgWindow), mainBox);

    // --- Contens
    contentBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 10);
    gtk_widget_set_vexpand(contentBox, True);
    gtk_box_append(GTK_BOX(mainBox), contentBox);

    lab := gtk_label_new('Vorname:');
    gtk_widget_set_halign(lab, GTK_ALIGN_START);
    gtk_box_append(GTK_BOX(contentBox), lab);

    FirstName_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(dialgWindow), FirstName_Entry_Key, FirstName_entry);
    gtk_box_append(GTK_BOX(contentBox), FirstName_entry);

    lab := gtk_label_new('Nachname:');
    gtk_widget_set_halign(lab, GTK_ALIGN_START);
    gtk_box_append(GTK_BOX(contentBox), lab);

    LastName_entry := gtk_entry_new;
    g_object_set_data(G_OBJECT(dialgWindow), LastName_Entry_Key, LastName_entry);
    gtk_box_append(GTK_BOX(contentBox), LastName_entry);

    // --- Buttons
    button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
    gtk_widget_set_halign(button_box, GTK_ALIGN_END);
    gtk_widget_set_margin_top(button_box, 10);
    gtk_widget_set_margin_end(button_box, 10);
    gtk_widget_set_margin_bottom(button_box, 10);

    help_button := gtk_button_new_with_label('Hilfe');
    g_object_set_data(G_OBJECT(help_button), cmd_Key, GINT_TO_POINTER(cmHelp));
    gtk_box_append(GTK_BOX(button_box), help_button);
    g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_clicked), dialgWindow);

    ok_button := gtk_button_new_with_label('OK');
    g_object_set_data(G_OBJECT(ok_button), cmd_Key, GINT_TO_POINTER(cmdOk));
    gtk_box_append(GTK_BOX(button_box), ok_button);
    g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_clicked), dialgWindow);

    apply_button := gtk_button_new_with_label('Apply');
    g_object_set_data(G_OBJECT(apply_button), cmd_Key, GINT_TO_POINTER(cmdApply));
    gtk_box_append(GTK_BOX(button_box), apply_button);
    g_signal_connect(apply_button, 'clicked', G_CALLBACK(@on_clicked), dialgWindow);

    cancel_button := gtk_button_new_with_label('Abbrechen');
    g_object_set_data(G_OBJECT(cancel_button), cmd_Key, GINT_TO_POINTER(cmdCancel));
    gtk_box_append(GTK_BOX(button_box), cancel_button);
    g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_clicked), dialgWindow);

    gtk_box_append(GTK_BOX(mainBox), button_box);

    gtk_window_present(GTK_WINDOW(dialgWindow));
  end;


  procedure activate(app: PGtkApplication; {%H-}user_data: Tgpointer); cdecl;
  var
    mainWindow, mainBox, firstName_label, lastName_label, button: PGtkWidget;
  begin
    mainWindow := gtk_application_window_new(app);
    gtk_window_set_title(GTK_WINDOW(mainWindow), 'GTK4 Label');
    gtk_window_set_default_size(GTK_WINDOW(mainWindow), 320, 200);

    mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
    gtk_window_set_child(GTK_WINDOW(mainWindow), mainBox);

    firstName_label := gtk_label_new('Vorname: ');
    g_object_set_data(G_OBJECT(mainWindow), FirstName_Label_Key, firstName_label);
    gtk_box_append(GTK_BOX(mainBox), firstName_label);

    lastName_label := gtk_label_new('Nachname: ');
    g_object_set_data(G_OBJECT(mainWindow), LastName_Label_Key, lastName_label);
    gtk_box_append(GTK_BOX(mainBox), lastName_label);

    button := gtk_button_new_with_label('Daten eingeben');
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_openDialog_clicked_cp), mainWindow);
    gtk_box_append(GTK_BOX(mainBox), button);

    gtk_window_present(GTK_WINDOW(mainWindow));
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
