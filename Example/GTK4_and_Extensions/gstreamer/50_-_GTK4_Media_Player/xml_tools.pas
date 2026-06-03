unit XML_Tools;

interface

uses
  fp_glib2,
  fp_xml2;

type
  PXMLConfig = type Pointer;

function XML_Config_new(path: Pgchar; clear: boolean): PXMLConfig;
procedure XML_Config_writekey(XMLConfig: PXMLConfig; xpath: Pgchar; attrName, attrValue: Pgchar);
function XML_Config_readkey(XMLConfig: PXMLConfig; xpath, attrName: pchar): pchar;
procedure XML_Config_unref(XMLConfig: PXMLConfig);


implementation

type
  TXMLConfigPriv = record
    doc: PxmlDoc;
    path: Pgchar;
  end;
  PXMLConfigPriv = ^TXMLConfigPriv;

function XML_Config_new(path: Pgchar; clear: boolean): PXMLConfig;
var
  XMLData: PXMLConfigPriv absolute Result;
begin
  XMLData := g_malloc0(SizeOf(TXMLConfigPriv));
  XMLData^.path := g_strdup(path);

  if not clear then begin
    XMLData^.doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);
  end;

  if (XMLData^.doc = nil) then begin
    XMLData^.doc := xmlNewDoc('1.0');
    xmlDocSetRootElement(XMLData^.doc, xmlNewNode(nil, 'config'));
  end;
end;

procedure XML_Config_writekey(XMLConfig: PXMLConfig; xpath: Pgchar; attrName, attrValue: Pgchar);
var
  XMLData: PXMLConfigPriv absolute XMLConfig;
  currentNode, child, newNode: PxmlNode;
  i: integer;
  tokens: PPgchar;
begin
  if (XMLData = nil) or (XMLData^.doc = nil) then begin
    Exit;
  end;

  tokens := g_strsplit(xpath, '/', -1);
  currentNode := xmlDocGetRootElement(XMLData^.doc);
  if currentNode = nil then begin
    g_strfreev(tokens);
    Exit;
  end;

  i := 0;
  while tokens[i] <> nil do begin
    if tokens[i]^ = #0 then begin
      Inc(i);
      continue;
    end;

    child := xmlFirstElementChild(currentNode);
    newNode := nil;

    while child <> nil do begin
      if xmlStrcmp(child^.name, Pgchar(tokens[i])) = 0 then begin
        newNode := child;
        Break;
      end;
      child := xmlNextElementSibling(child);
    end;

    if newNode = nil then begin
      newNode := xmlNewChild(currentNode, nil, Pgchar(tokens[i]), nil);
    end;

    currentNode := newNode;
    Inc(i);
  end;

  xmlSetProp(currentNode, Pgchar(attrName), Pgchar(attrValue));
  g_strfreev(tokens);
end;


function XML_Config_readkey(XMLConfig: PXMLConfig; xpath, attrName: pchar): pchar;
var
  XMLData: PXMLConfigPriv absolute XMLConfig;
  context: PxmlXPathContext;
  res: PxmlXPathObject;
  root: PxmlNode;
begin
  Result := nil;
  if (XMLData = nil) or (XMLData^.doc = nil) then begin
    Exit(nil);
  end;

  context := xmlXPathNewContext(XMLData^.doc);
  root := xmlDocGetRootElement(XMLData^.doc);
  if root <> nil then begin
    xmlXPathSetContextNode(root, context);
  end;

  res := xmlXPathEvalExpression(xpath, context);
  if res <> nil then begin
    if (res^.nodesetval <> nil) and (res^.nodesetval^.nodeNr > 0) then begin
      Result := xmlGetProp(res^.nodesetval^.nodeTab[0], attrName);
    end else begin
      g_printf('(Path not found: %s)'#10, xpath);
    end;
    xmlXPathFreeObject(res);
  end;

  xmlXPathFreeContext(context);
end;

procedure XML_Config_unref(XMLConfig: PXMLConfig);
var
  XMLData: PXMLConfigPriv absolute XMLConfig;
begin
  xmlSaveFormatFile(XMLData^.path, XMLData^.doc, 1);
  xmlFreeDoc(XMLData^.doc);

  g_free(XMLData^.path);
  g_free(XMLData);
end;


end.
