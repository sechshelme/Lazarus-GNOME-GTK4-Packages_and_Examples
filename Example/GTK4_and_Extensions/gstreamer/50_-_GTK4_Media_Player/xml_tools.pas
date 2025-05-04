unit XML_Tools;

{$modeswitch typehelpers}

interface

uses
  fp_glib2,
  fp_xml2,
  Common;

type
  PXMLConfig = type PGObject;


procedure writeKey(doc: PxmlDoc; xpath: Pgchar; attrName, attrValue: PxmlChar);
function readKey(doc: PxmlDoc; xpath, attrName: pchar): pchar;

function XML_Config_new(path: Pgchar): PXMLConfig;
procedure XML_Config_unref(XMLConfig: PXMLConfig);


implementation

type
  TXMLData = record
    doc: PxmlDoc;
    path: Pgchar;
  end;
  PXMLData = ^TXMLData;

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
