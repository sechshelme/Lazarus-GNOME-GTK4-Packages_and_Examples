program project1;

uses
  fp_glib2,
  fp_GLIBTools,
  fp_GTK4,
  EntryDialog;

  procedure entry_button_clicked_cp(widget: PGtkWidget; datas: PPgchar; {%H-}user_data: Tgpointer); cdecl;
  var
    i:Integer;
  begin
    WriteLn('Datas:');

    if datas <> nil then begin
      i := 0;
      while datas[i] <> nil do begin
        WriteLn('Feld ', i, ': ', datas[i]);
        Inc(i);
      end;
      WriteLn;
    end;
  end;

  procedure button_openDialog_clicked_neu_cp(widget: PGtkWidget; {%H-}user_data: Tgpointer); cdecl;
  const
    entry_dialog: PGtkWidget = nil;
  begin
    if entry_dialog = nil then begin
      entry_dialog := entry_dialog_new();
      g_signal_connect_swapped(entry_dialog, 'destroy', G_CALLBACK(@g_nullify_pointer), @entry_dialog);
      g_signal_connect(entry_dialog, 'button-clicked', G_CALLBACK(@entry_button_clicked_cp), nil);
    end;
    gtk_window_present(GTK_WINDOW(entry_dialog));
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
    gtk_box_append(GTK_BOX(mainBox), firstName_label);

    lastName_label := gtk_label_new('Nachname: ');
    gtk_box_append(GTK_BOX(mainBox), lastName_label);

    button := gtk_button_new_with_label('Daten eingeben neu');
    g_signal_connect(button, 'clicked', G_CALLBACK(@button_openDialog_clicked_neu_cp), mainWindow);
    gtk_box_append(GTK_BOX(mainBox), button);

    gtk_window_present(GTK_WINDOW(mainWindow));
  end;


  procedure main;
  var
    app: PGtkApplication;
  begin
    app := gtk_application_new('org.webkitgtk.example', G_APPLICATION_DEFAULT_FLAGS);
    g_signal_connect(app, 'activate', G_CALLBACK(@activate), nil);
    g_application_run(G_APPLICATION(app), argc, argv);
    g_object_unref(app);
  end;

begin
  main;
end.
