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

  function LoadFiles(path: Pgchar): PPgchar;
  var
    dir: PGDir;
    entryName, path1: Pgchar;
    i: integer;
    files: PGPtrArray;
  begin
    dir := g_dir_open(path, 0, nil);
    if dir = nil then begin
      WriteLn('Konnte Ordner nicht öffnen !');
      Exit(nil);
    end else begin
      files := g_ptr_array_new_null_terminated(0, nil, True);
      repeat
        entryName := g_dir_read_name(dir);
        if entryName <> nil then begin
          for i := 0 to Length(AudioExtensions) - 1 do begin
            if g_str_has_suffix(entryName, AudioExtensions[i]) then  begin
              path1 := g_build_filename(path, entryName, nil);
              g_ptr_array_add(files, g_strdup(path1));
              Break;
            end;
          end;
        end;
      until entryName = nil;
      Result := PPgchar(g_ptr_array_free(files, False));
    end;
  end;

begin
  Load_Songs_from_SA(store, LoadFiles(path));
end;

// ==========

const
  cmd_Key = 'cmd-key';
  dialog_win_Key = 'dialog-win-key';
  FullPathKey = 'full-path';

  cmdOk = 1000;
  cmdCancel = 1001;
  cmdAdd = 1002;
  cmHelp = 1003;

procedure LoadTitlesPath(listBox: PGtkListBox; path: Pgchar);
var
  dir: PGDir;
  entryName, path1: Pgchar;
  lab: PGtkWidget;
begin
  gtk_list_box_remove_all(listBox);
  path1 := g_build_filename(path, '..', nil);
  lab := gtk_label_new('..');
  g_object_set_data_full(G_OBJECT(lab), FullPathKey, path1, @g_free);
  gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
  gtk_list_box_append(listBox, lab);

  dir := g_dir_open(path, 0, nil);
  if dir = nil then begin
    g_print('Konnte Ordner nicht öffnen !'#10);
  end else begin
    repeat
      entryName := g_dir_read_name(dir);
      if entryName <> nil then begin
        path1 := g_build_filename(path, entryName, nil);
        if g_file_test(path1, G_FILE_TEST_IS_DIR) then  begin
          lab := gtk_label_new(entryName);
          g_object_set_data_full(G_OBJECT(lab), FullPathKey, path1, @g_free);
          gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
          gtk_list_box_append(listBox, lab);
        end else begin
          g_free(path1);
        end;
      end;
    until entryName = nil;
  end;
end;

procedure LoadTitlesFiles(listBox: PGtkListBox; path: Pgchar);
var
  dir: PGDir;
  entryName, path1: Pgchar;
  i: integer;
  lab: PGtkWidget;
begin
  gtk_list_box_remove_all(listBox);

  dir := g_dir_open(path, 0, nil);
  if dir = nil then begin
    g_print('Konnte Ordner nicht öffnen !'#10);
    Exit;
  end else begin
    repeat
      entryName := g_dir_read_name(dir);
      if entryName <> nil then begin
        for i := 0 to Length(AudioExtensions) - 1 do begin
          if g_str_has_suffix(entryName, AudioExtensions[i]) then  begin
            path1 := g_build_filename(path, entryName, nil);
            if g_file_test(path1, G_FILE_TEST_IS_REGULAR) then  begin
              lab := gtk_label_new(entryName);
              g_object_set_data_full(G_OBJECT(lab), FullPathKey, path1, @g_free);
              gtk_label_set_xalign(GTK_LABEL(lab), 0.0);
              gtk_list_box_append(listBox, lab);
            end else begin
              g_free(path1);
            end;
            Break;
          end;
        end;
      end;
    until entryName = nil;
  end;
end;


// ========

// https://www.perplexity.ai/search/7cd9037c-44ad-4395-befa-9d21f853ea40?0=d&1=d
var
  listBoxPath, listBoxFiles: PGtkWidget;

procedure on_clicked(widget: PGtkWidget; user_data: Tgpointer); cdecl;
var
  sharedWidgets: PSharedWidget absolute user_data;
  cmd: Tgint;
  dialogWindow: PGtkWindow;
  selection_model: PGtkSelectionModel;
  store: PGListStore;
  selectedRows, iter: PGList;
  FullPath: Pgchar;
  lab: PGtkWidget;
begin
  cmd := GPOINTER_TO_INT(g_object_get_data(G_OBJECT(widget), cmd_Key));
  dialogWindow := g_object_get_data(G_OBJECT(widget), dialog_win_Key);

  selection_model := gtk_column_view_get_model(GTK_COLUMN_VIEW(sharedWidgets^.columnView));
  store := G_LIST_STORE(gtk_single_selection_get_model(GTK_SINGLE_SELECTION(selection_model)));

  if (cmd = cmdOk) or (cmd = cmdAdd) then begin
    selectedRows := gtk_list_box_get_selected_rows(GTK_LIST_BOX(listBoxFiles));
    iter := selectedRows;
    while iter <> nil do begin
      lab := gtk_list_box_row_get_child(GTK_LIST_BOX_ROW(iter^.Data));
      FullPath := g_object_get_data(G_OBJECT(lab), FullPathKey);
      Load_Song(store, FullPath);
      iter := iter^.Next;
    end;
    g_list_free(selectedRows);
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
  add_button, cancel_button, paned,
  scrolledWindowPath, scrolledWindowFiles: PGtkWidget;
const
  sp = '/n4800/Multimedia/Music/Disco/C.C. Catch/1986 - Catch The Catch';
  //  sp=                 '/n4800/Multimedia/Music/Disco/C.C. Catch';
begin
  dialgWindow := gtk_window_new;

  gtk_window_set_title(GTK_WINDOW(dialgWindow), 'Daten eingeben');
  gtk_window_set_default_size(GTK_WINDOW(dialgWindow), 300, 200);

  //    gtk_window_set_modal(GTK_WINDOW(dialgWindow), TRUE);
  gtk_window_set_transient_for(GTK_WINDOW(dialgWindow), GTK_WINDOW(shardedWidgets^.main_Window));

  mainBox := gtk_box_new(GTK_ORIENTATION_VERTICAL, 5);
  // mainBox-Einstellung ändern:
  gtk_widget_set_valign(mainBox, GTK_ALIGN_FILL);
  gtk_window_set_child(GTK_WINDOW(dialgWindow), mainBox);


  paned := gtk_paned_new(GTK_ORIENTATION_HORIZONTAL);
  gtk_widget_set_vexpand(paned, True);
  gtk_box_append(GTK_BOX(mainBox), paned);

  // ----

  listBoxPath := gtk_list_box_new;
  gtk_widget_set_hexpand(listBoxPath, True);
  gtk_widget_set_vexpand(listBoxPath, True);
  gtk_widget_set_halign(listBoxPath, GTK_ALIGN_FILL);
  LoadTitlesPath(GTK_LIST_BOX(listBoxPath), sp);

  scrolledWindowPath := gtk_scrolled_window_new;
  gtk_widget_set_hexpand(scrolledWindowPath, True);
  gtk_widget_set_vexpand(scrolledWindowPath, True);
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolledWindowPath), listBoxPath);

  gtk_paned_set_start_child(GTK_PANED(paned), scrolledWindowPath);

  // ----

  listBoxFiles := gtk_list_box_new;
  gtk_list_box_set_selection_mode(GTK_LIST_BOX(listBoxFiles), GTK_SELECTION_MULTIPLE);
  gtk_widget_set_hexpand(listBoxFiles, True);
  gtk_widget_set_vexpand(listBoxFiles, True);
  gtk_widget_set_halign(listBoxFiles, GTK_ALIGN_FILL);
  LoadTitlesFiles(GTK_LIST_BOX(listBoxFiles), sp);

  scrolledWindowFiles := gtk_scrolled_window_new;
  gtk_widget_set_hexpand(scrolledWindowFiles, True);
  gtk_widget_set_vexpand(scrolledWindowFiles, True);
  gtk_scrolled_window_set_child(GTK_SCROLLED_WINDOW(scrolledWindowFiles), listBoxFiles);

  gtk_paned_set_end_child(GTK_PANED(paned), scrolledWindowFiles);


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

  add_button := gtk_button_new_with_label('Add');
  g_object_set_data(G_OBJECT(add_button), cmd_Key, GINT_TO_POINTER(cmdAdd));
  g_object_set_data(G_OBJECT(add_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), add_button);
  g_signal_connect(add_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  cancel_button := gtk_button_new_with_label('Abbrechen');
  g_object_set_data(G_OBJECT(cancel_button), cmd_Key, GINT_TO_POINTER(cmdCancel));
  g_object_set_data(G_OBJECT(cancel_button), dialog_win_Key, dialgWindow);
  gtk_box_append(GTK_BOX(button_box), cancel_button);
  g_signal_connect(cancel_button, 'clicked', G_CALLBACK(@on_clicked), shardedWidgets);

  gtk_box_append(GTK_BOX(mainBox), button_box);

  gtk_window_present(GTK_WINDOW(dialgWindow));
end;

end.
