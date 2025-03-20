unit LoadTitle;

{$mode ObjFPC}{$H+}

interface

uses
  ctypes,
  fp_glib2,
  fp_GTK4,
  Common,
  LoadSaveSongs,
  Streamer;

procedure LoadDefaulTitles(store: PGListStore; path: Pgchar);
procedure AddSongsDialog(shardedWidgets: PSharedWidget);

implementation

procedure LoadDefaulTitles(store: PGListStore; path: Pgchar);
var
  dir: PGDir;
  entryName, path1: Pgchar;
  i: integer;
  files: PGPtrArray;
begin
  dir := g_dir_open(path, 0, nil);
  if dir = nil then begin
    WriteLn('Konnte Ordner nicht öffnen !');
  end else begin
    files := g_ptr_array_new_null_terminated(0, nil, True);
    repeat
      entryName := g_dir_read_name(dir);
      if entryName <> nil then begin
        for i := 0 to Length(AudioExtensions) - 1 do begin
          if g_str_has_suffix(entryName, AudioExtensions[i]) then  begin
            path1 := PChar(path + '/' + entryName);
            g_ptr_array_add(files, g_strdup(path1));
            Break;
          end;
        end;
      end;
    until entryName = nil;
    g_ptr_array_add(files, nil);

    Load_Songs_from_SA(PPgchar(g_ptr_array_free(files, False)), store);

    g_dir_close(dir);
  end;
end;

// ========

const
  cmd_Key = 'cmd-key';
  dialog_win_Key = 'dialog-win-key';

  cmdOk = 1000;
  cmdCancel = 1001;
  cmdApply = 1002;
  cmHelp = 1003;

procedure on_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  sharedWidgets: PSharedWidget absolute user_data;
  cmd: Tgint;
  dialogWindow: PGtkWindow;
  selection_model: PGtkSelectionModel;
  store: PGListStore;
begin
  cmd := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmd_Key));
  dialogWindow := g_object_get_data(G_OBJECT(widget), dialog_win_Key);

  selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW(sharedWidgets^.columnView));
  store := G_LIST_STORE(gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model)));


  if (cmd = cmdOk) or (cmd = cmdApply) then begin
    Load_Song('/home/tux/Schreibtisch/sound/test.mp3', store);  // test
  end;

  if (cmd = cmdOk) or (cmd = cmdCancel) then begin
    gtk_window_destroy(dialogWindow);
  end;

  if cmd = cmHelp then begin
    g_printf('help....'#10);
  end;
end;

procedure AddSongsDialog(shardedWidgets: PSharedWidget);
var
  dialgWindow, mainBox, button_box, help_button, ok_button,
  apply_button, cancel_button, paned, listbox1, listbox2, lab: PGtkWidget;
  i: integer;
begin
  dialgWindow := gtk_window_new;

  gtk_window_set_title(GTK_WINDOW(dialgWindow), 'Daten eingeben');
  gtk_window_set_default_size(GTK_WINDOW(dialgWindow), 300, 200);

  //    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
  gtk_window_set_transient_for(GTK_WINDOW(dialgWindow), GTK_WINDOW(shardedWidgets^.main_Window));

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  gtk_window_set_child(GTK_WINDOW(dialgWindow), mainBox);


  paned := gtk_paned_new(GTK_ORIENTATION_HORIZONTAL);
  gtk_box_append(GTK_BOX(mainBox), paned);

  listbox1 := gtk_list_box_new;
  listbox2 := gtk_list_box_new;

  for i := 0 to 5 do begin
    lab := gtk_label_new('blublu');
    gtk_list_box_append(GTK_LIST_BOX(listbox1), lab);
    lab := gtk_label_new('blublu');
    gtk_list_box_append(GTK_LIST_BOX(listbox2), lab);
  end;

  gtk_paned_set_start_child(GTK_PANED(paned), listbox1);
  gtk_paned_set_end_child(GTK_PANED(paned), listbox2);




  // --- Buttons
  button_box := gtk_box_new(GTK_ORIENTATION_HORIZONTAL, 5);
  gtk_widget_set_halign(button_box, GTK_ALIGN_END);
  gtk_widget_set_margin_top(button_box, 10);
  gtk_widget_set_margin_end(button_box, 10);
  gtk_widget_set_margin_bottom(button_box, 10);

  help_button := gtk_button_new_with_label('Hilfe');
  g_object_set_data(G_OBJECT(help_button), cmd_Key, GINT_TO_POINTER(cmHelp));
  g_object_set_data(G_OBJECT(help_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), help_button);
  g_signal_connect(help_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  ok_button := gtk_button_new_with_label('OK');
  g_object_set_data(G_OBJECT(ok_button), cmd_Key, GINT_TO_POINTER(cmdOk));
  g_object_set_data(G_OBJECT(ok_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), ok_button);
  g_signal_connect(ok_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  apply_button := gtk_button_new_with_label('Apply');
  g_object_set_data(G_OBJECT(apply_button), cmd_Key, GINT_TO_POINTER(cmdApply));
  g_object_set_data(G_OBJECT(apply_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), apply_button);
  g_signal_connect(apply_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  cancel_button := gtk_button_new_with_label('Abbrechen');
  g_object_set_data(G_OBJECT(cancel_button), cmd_Key, GINT_TO_POINTER(cmdCancel));
  g_object_set_data(G_OBJECT(cancel_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), cancel_button);
  g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  gtk_box_append(GTK_BOX(mainBox), button_box);

  gtk_window_present(GTK_WINDOW(dialgWindow));
end;

end.
