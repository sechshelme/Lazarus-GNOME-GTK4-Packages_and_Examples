unit LoadSaveSongs;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2,
  fp_xml2,
  fp_GTK4,
  XML_Tools,
  Common,
  MPSongItem,
  MPStreamer;

procedure LoadDefaulTitles(store: PGListStore; path: Pgchar);

procedure Load_Song(store: PGListStore; path: Pgchar);
procedure Load_Songs_from_SA(store: PGListStore; sa: PPgchar);

procedure Save_Songs_XML_Dialog(main_Window: PGtkWidget; store: PGListStore);
procedure Open_Songs_XML_Dialog(main_Window: PGtkWidget; store: PGListStore);

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

// === Song laden ===================

procedure Load_Song(store: PGListStore; path: Pgchar);
var
  obj: PGObject;
begin
  obj := mp_song_item_new(path, get_duration(path));
  g_list_store_append(store, obj);
  g_object_unref(obj);
end;

const
  SongXMLKey = 'title/song';

  // === Songs XML speichern ======================================

procedure Save_Songs_to_XML(path: Pgchar; list: PGListStore);
var
  item_obj: PGObject;
  Count, i: Tgint;
  buf1, buf2: Pgchar;
  doc: PxmlDoc;
  root_node: PxmlNode;

begin
  doc := xmlNewDoc(nil);
  root_node := xmlNewNode(nil, 'config');
  xmlDocSetRootElement(doc, root_node);

  Count := g_list_model_get_n_items(G_LIST_MODEL(list));
  buf1 := g_strdup_printf('%s/items', SongXMLKey);
  buf2 := g_strdup_printf('%d', Count);
  writeKey(doc, buf1, 'count', buf2);
  g_free(buf1);
  g_free(buf2);

  for i := 0 to Count - 1 do begin
    item_obj := g_list_model_get_item(G_LIST_MODEL(list), i);
    buf1 := g_strdup_printf('%s/items/item%d', SongXMLKey, i);
    writeKey(doc, buf1, 'value', mp_song_item_get_full_path(item_obj));
    g_free(buf1);
    g_object_unref(item_obj);
  end;

  xmlSaveFormatFile(path, doc, 1);
  xmlFreeDoc(doc);
end;

procedure on_save_cp(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
var
  list_store: PGListStore absolute Data;
  dialog: PGtkFileDialog;
  file_: PGFile;
  filename: pchar;
begin
  dialog := GTK_FILE_DIALOG(source_object);
  file_ := gtk_file_dialog_save_finish(dialog, res, nil);
  if file_ <> nil then begin
    filename := g_file_get_path(file_);

    Save_Songs_to_XML(filename, list_store);

    g_free(filename);
    g_object_unref(file_);
  end else begin
    //    WriteLn('abbruch');
  end;
end;

procedure Save_Songs_XML_Dialog(main_Window: PGtkWidget; store: PGListStore);
var
  dialog: PGtkFileDialog;
  current_dir: Pgchar;
  initial_folder: PGFile;
begin
  dialog := gtk_file_dialog_new;
  gtk_file_dialog_set_initial_name(dialog, 'noname.xml');
  current_dir := g_get_current_dir;
  initial_folder := g_file_new_for_path(current_dir);
  gtk_file_dialog_set_initial_folder(dialog, initial_folder);
  g_object_unref(initial_folder);
  g_free(current_dir);
  gtk_file_dialog_save(dialog, GTK_WINDOW(main_Window), nil, @on_save_cp, store);

  g_object_unref(dialog);
end;

// === Songs XML öffnen ======================================

type
  TSALoadStruct = record
    sa: PPgchar;
    store: PGListStore;
    index: Tgint64;
  end;
  PSALoadStruct = ^TSALoadStruct;

function load_sa_songitems_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  LoadStruct: PSALoadStruct absolute user_data;
begin
  if LoadStruct^.sa[LoadStruct^.index] = nil then  begin
    g_strfreev(LoadStruct^.sa);
    g_free(LoadStruct);
    Result := G_SOURCE_REMOVE_;
  end else begin;
    Load_Song(LoadStruct^.store, LoadStruct^.sa[LoadStruct^.index]);

    Inc(LoadStruct^.index);
    Result := G_SOURCE_CONTINUE;
  end;
end;

procedure Load_Songs_from_SA(store: PGListStore; sa: PPgchar);
var
  LoadStruct: PSALoadStruct;
begin
  LoadStruct := g_malloc(SizeOf(TSALoadStruct));
  LoadStruct^.store := store;
  LoadStruct^.sa := sa;
  LoadStruct^.index := 0;

  g_idle_add(@load_sa_songitems_cp, LoadStruct);
end;

function xml_to_stringlist(path: Pgchar): PPChar;
var
  i, len: Tgint64;
  buf1, buf2: Pgchar;
  doc: PxmlDoc;
begin
  Result := nil;
  doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);
  buf1 := g_strdup_printf('%s/items', SongXMLKey);
  buf2 := readKey(doc, buf1, 'count');
  g_free(buf1);
  if buf2 <> nil then begin
    len := g_ascii_strtoll(buf2, nil, 10);
    g_free(buf2);
    Result := g_malloc(SizeOf(Pgchar) * (len + 1));

    for i := 0 to len - 1 do begin
      buf1 := g_strdup_printf('%s/items/item%d', SongXMLKey, i);
      Result[i] := readKey(doc, buf1, 'value');
      g_free(buf1);
    end;
    Result[len] := nil;
    xmlFreeDoc(doc);
  end;
end;

procedure on_xml_open_cp(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
var
  list_store: PGListStore absolute Data;
  dialog: PGtkFileDialog;
  file_: PGFile;
  filename: pchar;
  sa: PPChar;
begin
  dialog := GTK_FILE_DIALOG(source_object);
  file_ := gtk_file_dialog_open_finish(dialog, res, nil);
  if file_ <> nil then begin
    filename := g_file_get_path(file_);
    sa := xml_to_stringlist(filename);
    if sa <> nil then begin
      Load_Songs_from_SA(list_store, sa);
    end;
    g_free(filename);
    g_object_unref(file_);
  end else begin
    //    WriteLn('abbruch');
  end;
end;

procedure Open_Songs_XML_Dialog(main_Window: PGtkWidget; store: PGListStore);
var
  dialog: PGtkFileDialog;
  current_dir: Pgchar;
  initial_folder: PGFile;
begin
  dialog := gtk_file_dialog_new;
  current_dir := g_get_current_dir;
  initial_folder := g_file_new_for_path(current_dir);
  gtk_file_dialog_set_initial_folder(dialog, initial_folder);
  g_object_unref(initial_folder);
  g_free(current_dir);
  gtk_file_dialog_open(dialog, GTK_WINDOW(main_Window), nil, @on_xml_open_cp, store);

  g_object_unref(dialog);
end;

end.
