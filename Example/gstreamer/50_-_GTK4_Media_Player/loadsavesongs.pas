unit LoadSaveSongs;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2,
  fp_xml2,
  fp_GTK4,
  XML_Tools,
  Common,
  Streamer,
  LoadTitle;

procedure Save_Songs(main_Window: PGtkWidget; list: PGListStore);
procedure Open_Songs(main_Window: PGtkWidget; list: PGListStore);


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

procedure Save_Songs(main_Window: PGtkWidget; list: PGListStore);
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

type
  TXMLLoadStruct = record
    doc: PxmlDoc;
    store: PGListStore;
    Count, index: Tgint64;
  end;
  PXMLLoadStruct = ^TXMLLoadStruct;

function load_xml_songitems_cp(user_data: Tgpointer): Tgboolean; cdecl;
var
  XMLLoadStruct: PXMLLoadStruct absolute user_data;
  song: PSong;
  obj: PGObject;
  buf: array[0..255] of Tgchar;
const
  index: integer = 0;
begin
  if XMLLoadStruct^.index >= XMLLoadStruct^.Count then  begin
    g_free(XMLLoadStruct);
    Exit(G_SOURCE_REMOVE_);
  end;
  song := g_malloc(SizeOf(TSong));

  g_snprintf(buf, SizeOf(buf), '%s/items/item%d', SongXMLKey, XMLLoadStruct^.index);
  song^.FullPath := readKey(XMLLoadStruct^.doc, buf, 'value');

  song^.Index := index;
  song^.Duration := get_duration(song^.FullPath);
  Inc(index);

  obj := g_object_new(G_TYPE_OBJECT, nil);
  g_object_set_data_full(obj, songObjectKey, song, @songitem_object_free_cp);
  g_list_store_append(XMLLoadStruct^.store, obj);
  g_object_unref(obj);

  Inc(XMLLoadStruct^.index);
  Exit(G_SOURCE_CONTINUE);
end;

procedure Load_Songs_from_XML(path: Pgchar; list: PGListStore);
var
  XMLLoadStruct: PXMLLoadStruct;
var
  s: Pgchar;
  buf: array[0..255] of Tgchar;
begin
  XMLLoadStruct := g_malloc(SizeOf(TXMLLoadStruct));
  XMLLoadStruct^.store := list;

  XMLLoadStruct^.doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);
  g_snprintf(buf, SizeOf(buf), '%s/items', SongXMLKey);

  s := readKey(XMLLoadStruct^.doc, buf, 'count');
  XMLLoadStruct^.Count := g_ascii_strtoll(s, nil, 10);
  g_free(s);
  XMLLoadStruct^.index := 0;
  WriteLn('count: ', XMLLoadStruct^.Count);

  g_idle_add(@load_xml_songitems_cp, XMLLoadStruct);
end;

procedure on_open_cp(source_object: PGObject; res: PGAsyncResult; Data: Tgpointer); cdecl;
var
  list_store: PGListStore absolute Data;
  dialog: PGtkFileDialog;
  file_: PGFile;
  filename: pchar;
begin
  dialog := GTK_FILE_DIALOG(source_object);
  file_ := gtk_file_dialog_open_finish(dialog, res, nil);
  if file_ <> nil then begin
    filename := g_file_get_path(file_);

    Load_Songs_from_XML(filename, list_store);

    g_free(filename);
    g_object_unref(file_);
  end else begin
    //    WriteLn('abbruch');
  end;
end;

procedure Open_Songs(main_Window: PGtkWidget; list: PGListStore);
var
  dialog: PGtkFileDialog;
  current_dir: Pgchar;
  initial_folder: PGFile;
begin
  dialog := gtk_file_dialog_new;
//  gtk_file_dialog_set_initial_name(dialog, 'noname.xml');
  current_dir := g_get_current_dir;
  initial_folder := g_file_new_for_path(current_dir);
  gtk_file_dialog_set_initial_folder(dialog, initial_folder);
  g_object_unref(initial_folder);
  g_free(current_dir);
  gtk_file_dialog_open(dialog, GTK_WINDOW(main_Window), nil, @on_open_cp, list);

  g_object_unref(dialog);
end;




end.
