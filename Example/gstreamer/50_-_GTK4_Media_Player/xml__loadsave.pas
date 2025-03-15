unit XML__LoadSave;

{$mode ObjFPC}{$H+}

interface

uses
  fp_glib2,
  fp_xml2,
  XML_Tools,
  Common,
  Streamer,
  LoadTitle;

procedure XML_Save_Songs(path: Pgchar; list: PGListStore);
procedure XML_Load_Songs(path: Pgchar; list: PGListStore);


implementation

const
  SongXMLKey = 'title/song';


procedure XML_Save_Songs(path: Pgchar; list: PGListStore);
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

// ===================

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

procedure XML_Load_Songs(path: Pgchar; list: PGListStore);
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


end.

