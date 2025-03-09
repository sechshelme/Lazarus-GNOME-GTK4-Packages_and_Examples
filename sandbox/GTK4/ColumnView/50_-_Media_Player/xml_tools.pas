unit XML_Tools;

{$modeswitch typehelpers}

interface

uses
  fp_glib2,
  fp_xml2,
  LoadTitle;

type
  PXMLConfig = type PGObject;

procedure XMLNewTest(list: PGListStore);
procedure XML_Save_Songs(path: Pgchar; list: PGListStore);
procedure XML_Load_Songs(path: Pgchar; list: PGListStore);


function XML_Config_new(path: Pgchar): PXMLConfig;
procedure XML_Config_unref(XMLConfig: PXMLConfig);


implementation

const
  key = 'title/song';


type
  TXMLData = record
    doc: PxmlDoc;
    path: Pgchar;
  end;
  PXMLData = ^TXMLData;


procedure XMLNewTest(list: PGListStore);
begin
  XML_Save_Songs('test.xml', list);
end;


procedure writeKey(doc: PxmlDoc; xpath: Pgchar; attrName, attrValue: PxmlChar);
var
  currentNode, child, newNode: PxmlNode;
  i: integer;
  tokens: PPgchar;
begin
  tokens := g_strsplit(xpath, '/', -1);
  currentNode := xmlDocGetRootElement(doc);

  i := 0;
  while tokens[i] <> nil do begin
    child := xmlFirstElementChild(currentNode);
    newNode := nil;

    while child <> nil do begin
      if xmlStrcmp(child^.Name, tokens[i]) = 0 then begin
        newNode := child;
        Break;
      end;
      child := xmlNextElementSibling(child);
    end;

    if newNode = nil then begin
      newNode := xmlNewChild(currentNode, nil, tokens[i], nil);
    end;

    currentNode := newNode;
    Inc(i);
  end;
  xmlSetProp(currentNode, attrName, attrValue);
  g_strfreev(tokens);
end;

function readKey(doc: PxmlDoc; xpath, attrName: pchar): pchar;
var
  context: PxmlXPathContext;
  res: PxmlXPathObject;
  node, root: PxmlNode;
begin
  if xpath = nil then begin
    g_printf('(path=nil)'#10);
    Exit(nil);
  end;

  context := xmlXPathNewContext(doc);
  root := xmlDocGetRootElement(doc);
  xmlXPathSetContextNode(root, context);

  res := xmlXPathEvalExpression(xpath, context);
  if xmlXPathNodeSetIsEmpty(res^.nodesetval) then begin
    g_printf('(path error)'#10);
    Exit(nil);
  end;

  node := res^.nodesetval^.nodeTab[0];
  Result := xmlGetProp(node, attrName);

  xmlXPathFreeObject(res);
  xmlXPathFreeContext(context);
end;


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
  g_snprintf(buf1, SizeOf(buf1), '%s/items', key);
  g_snprintf(buf2, SizeOf(buf2), '%d', Count);
  writeKey(doc, buf1, 'count', buf2);

  for i := 0 to Count - 1 do begin
    item_obj := g_list_model_get_item(G_LIST_MODEL(list), i);
    song := g_object_get_data(item_obj, songObjectKey);

    g_snprintf(buf1, SizeOf(buf1), '%s/items/item%d', key, i);
    writeKey(doc, buf1, 'value', song^.FullPath);

    g_object_unref(item_obj);
  end;

  xmlSaveFormatFile(path, doc, 1);
  xmlFreeDoc(doc);
end;

procedure XML_Load_Songs(path: Pgchar; list: PGListStore);
var
  doc: PxmlDoc;
  val: PChar;
  buf1: array[0..255] of Tgchar;
begin
  doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);
  g_snprintf(buf1, SizeOf(buf1), '%s/items', key);
  val := readKey(doc, buf1, 'count');

  WriteLn('count: ',val);

  g_free(val);
end;

// ==================================

const
  XML_Key = 'xmldata-key';

procedure free_cp(Data: Tgpointer); cdecl;
var
  XMLData: PXMLData absolute Data;
begin
  g_free(XMLData^.path);
  g_free(XMLData);
end;

function XML_Config_new(path: Pgchar): PXMLConfig;
var
  XMLData: PXMLData;
  root_node: PxmlNode;
begin
  XMLData := g_malloc(SizeOf(TXMLData));
  XMLData^.path := g_strdup(path);
  XMLData^.doc := xmlNewDoc(nil);
  root_node := xmlNewNode(nil, 'config');
  xmlDocSetRootElement(XMLData^.doc, root_node);

  Result := g_object_new(G_TYPE_OBJECT, nil);
  g_object_set_data_full(Result, XML_Key, XMLData, @free_cp);
end;


procedure XML_Config_unref(XMLConfig: PXMLConfig);
var
  XMLData: PXMLData;
begin
  XMLData := g_object_get_data(XMLConfig, XML_Key);

  xmlSaveFormatFile(XMLData^.path, XMLData^.doc, 1);
  xmlFreeDoc(XMLData^.doc);

  g_object_unref(XMLConfig);
end;


// =====================================


procedure printKey(doc: PxmlDoc; key, attr: pchar);
var
  val: pchar;
begin
  val := readKey(doc, key, attr);
  WriteLn(key, ':  ', val);
  xmlFree(val);
end;

procedure ReadXML(path: Pgchar);
var
  doc: PxmlDoc;
begin
  doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

  printKey(doc, 'window/frame', 'width');
  printKey(doc, 'window/frame', 'height');
  printKey(doc, 'window/button/font', 'size');
  printKey(doc, 'window/button/label', 'text');

  xmlFreeDoc(doc);
end;



end.
