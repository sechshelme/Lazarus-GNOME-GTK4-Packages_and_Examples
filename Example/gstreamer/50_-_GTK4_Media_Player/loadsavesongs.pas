unit LoadSaveSongs;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2,
  fp_xml2,
  fp_GTK4,
  XML_Tools,
  Common,
  Streamer;

procedure Load_Song(path: Pgchar; list: PGListStore);

procedure Save_Songs_XML_Dialog(main_Window: PGtkWidget; list: PGListStore);
procedure Open_Songs_XML_Dialog(main_Window: PGtkWidget; list: PGListStore);

//function xml_to_stringlist(path: Pgchar): PPChar;

implementation

const
  SongXMLKey = 'title/song';

  // === Songs speicher ======================================

procedure Save_Songs_to_XML(path: Pgchar; list: PGListStore);
var
  item_obj: PGObject;
  song: PSong;
  Count, i: Tgint;
  buf1: array[0..255] of Tgchar;
  buf2: array[0..15] of Tgchar;

  doc: PxmlDoc;
  root_node: PxmlNode;

begin
  doc := xmlNewDoc(nil);
  root_node := xmlNewNode(nil, 'config');
  xmlDocSetRootElement(doc, root_node);

  Count := g_list_model_get_n_items(G_LIST_MODEL(list));
  g_snprintf(buf1, SizeOf(buf1), '%s/items', SongXMLKey);
  g_snprintf(buf2, SizeOf(buf2), '%d', Count);
  writeKey(doc, buf1, 'count', buf2);

  for i := 0 to Count - 1 do begin
    item_obj := g_list_model_get_item(G_LIST_MODEL(list), i);
    song := g_object_get_data(item_obj, songObjectKey);

    g_snprintf(buf1, SizeOf(buf1), '%s/items/item%d', SongXMLKey, i);
    writeKey(doc, buf1, 'value', song^.FullPath);

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

procedure Save_Songs_XML_Dialog(main_Window: PGtkWidget; list: PGListStore);
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
  gtk_file_dialog_save(dialog, GTK_WINDOW(main_Window), nil, @on_save_cp, list);

  g_object_unref(dialog);
end;

// === Songs laden ===================

procedure Load_Song(path: Pgchar; list: PGListStore);
var
  song: PSong;
  obj: PGObject;
begin
  song := g_malloc(SizeOf(TSong));
  song^.FullPath := g_strdup( path);
  song^.Duration := get_duration(song^.FullPath);

  obj := g_object_new(G_TYPE_OBJECT, nil);
  g_object_set_data_full(obj, songObjectKey, song, @songitem_object_free_cp);
  g_list_store_append(list, obj);
  g_object_unref(obj);
end;

// ===

type
  TSALoadStruct = record
//    doc: PxmlDoc;
    sa:PPgchar;
    store: PGListStore;
//    Count,
    index: Tgint64;
  end;
  PSALoadStruct = ^TSALoadStruct;

//function load_xml_songitems_cp(user_data: Tgpointer): Tgboolean; cdecl;
//var
//  XMLLoadStruct: PXMLLoadStruct absolute user_data;
//  buf: Pgchar;
//begin
//  if XMLLoadStruct^.index >= XMLLoadStruct^.Count then  begin
//    g_free(XMLLoadStruct);
//    Exit(G_SOURCE_REMOVE_);
//  end;
//
//  buf := g_strdup_printf('%s/items/item%d', SongXMLKey, XMLLoadStruct^.index);
//  Load_Song(readKey(XMLLoadStruct^.doc, buf, 'value'), XMLLoadStruct^.store);
//
//  Inc(XMLLoadStruct^.index);
//  Exit(G_SOURCE_CONTINUE);
//end;

//procedure Load_Songs_from_XML(path: Pgchar; list: PGListStore);
//var
//  XMLLoadStruct: PXMLLoadStruct;
//var
//  s: Pgchar;
//  buf: array[0..255] of Tgchar;
//begin
//  XMLLoadStruct := g_malloc(SizeOf(TXMLLoadStruct));
//  XMLLoadStruct^.store := list;
//
//  XMLLoadStruct^.index := 0;
//  WriteLn('count: ', XMLLoadStruct^.Count);
//
//  g_idle_add(@load_xml_songitems_cp, XMLLoadStruct);
//end;

function load_sa_songitems_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  XMLLoadStruct: PSALoadStruct absolute user_data;
begin
  if  XMLLoadStruct^.sa[XMLLoadStruct^.index] =nil then  begin
    g_strfreev(XMLLoadStruct^.sa);
    g_free(XMLLoadStruct);
    Exit(G_SOURCE_REMOVE_);
  end;
Load_Song( XMLLoadStruct^.sa[XMLLoadStruct^.index], XMLLoadStruct^.store);

  Inc(XMLLoadStruct^.index);
  Exit(G_SOURCE_CONTINUE);
end;


procedure Load_Songs_from_SA(sa: PPgchar; list: PGListStore);
var
  XMLLoadStruct: PSALoadStruct;
begin
  XMLLoadStruct := g_malloc(SizeOf(TSALoadStruct));
  XMLLoadStruct^.store := list;
  XMLLoadStruct^.sa := sa;
  XMLLoadStruct^.index := 0;

  g_idle_add(@load_sa_songitems_cp, XMLLoadStruct);
end;

function xml_to_stringlist(path: Pgchar): PPChar;
var
  i, len: Tgint64;
  buf1: array[0..255] of Tgchar;
  buf2: Pgchar;
  doc: PxmlDoc;
begin
  Result := nil;
  doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);
  g_snprintf(buf1, SizeOf(buf1), '%s/items', SongXMLKey);
  buf2 := readKey(doc, buf1, 'count');
  if buf2 = nil then begin
    Exit(nil);
  end;
  len := g_ascii_strtoll(buf2, nil, 10);
  g_free(buf2);
  Result := g_malloc(SizeOf(Pgchar) * (len + 1));

  for i := 0 to len - 1 do begin
    g_snprintf(buf1, SizeOf(buf1), '%s/items/item%d', SongXMLKey, i);
    Result[i] := readKey(doc, buf1, 'value');
  end;
  Result[len] := nil;
  xmlFreeDoc(doc);
end;


procedure on_xml_open_cp(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
var
  list_store: PGListStore absolute Data;
  dialog: PGtkFileDialog;
  file_: PGFile;
  filename: pchar;
  sa, p: PPChar;
begin
  dialog := GTK_FILE_DIALOG(source_object);
  file_ := gtk_file_dialog_open_finish(dialog, res, nil);
  if file_ <> nil then begin
    filename := g_file_get_path(file_);

//    Load_Songs_from_XML(filename, list_store);

    sa := xml_to_stringlist(filename);
    if sa <> nil then begin
      Load_Songs_from_SA(sa, list_store);
//
//      p := sa;
//      while p^ <> nil do begin
//        WriteLn(p^);
//        inc(p);
//      end;
//      g_strfreev(sa);
    end;

    g_free(filename);
    g_object_unref(file_);
  end else begin
    //    WriteLn('abbruch');
  end;
end;

procedure Open_Songs_XML_Dialog(main_Window: PGtkWidget; list: PGListStore);
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
  gtk_file_dialog_open(dialog, GTK_WINDOW(main_Window), nil, @on_xml_open_cp, list);

  g_object_unref(dialog);
end;

// ====


end.
