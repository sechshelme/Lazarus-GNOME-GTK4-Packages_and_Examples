program project1;

uses
  SysUtils,
  Strings,
  fp_xml2;

  // === Create Config-XML

  procedure writeNewKey(doc: PxmlDoc; const xpath: string; attrName, attrValue: PxmlChar);
  var
    currentNode, child, newNode: PxmlNode;
    splitPath: TAnsiStringArray;
    i: integer;
  begin
    splitPath := xpath.Split('/');
    currentNode := xmlDocGetRootElement(doc);

    for i := 0 to Length(splitPath) - 1 do begin
      child := xmlFirstElementChild(currentNode);
      newNode := nil;

      while child <> nil do begin
        if xmlStrcmp(child^.Name, PChar(splitPath[i])) = 0 then begin
          newNode := child;
          Break;
        end;
        child := xmlNextElementSibling(child);
      end;

      if newNode = nil then begin
        newNode := xmlNewChild(currentNode, nil, PxmlChar(splitPath[i]), nil);
      end;

      currentNode := newNode;
    end;

    xmlSetProp(currentNode, attrName, attrValue);
  end;

  function readKey(doc: PxmlDoc; xpath, attrName: pchar): pchar;
  var
    context: PxmlXPathContext;
    res: PxmlXPathObject;
    node, root: PxmlNode;
  begin
    if xpath = nil then begin
      Exit(xmlStrdup('(path=nil)'));
    end;

    context := xmlXPathNewContext(doc);

    root := xmlDocGetRootElement(doc);
    xmlXPathSetContextNode(root, context);

    res := xmlXPathEvalExpression(xpath, context);
    if xmlXPathNodeSetIsEmpty(res^.nodesetval) then begin
      Exit(xmlStrdup('(path error)'));
    end;

    node := res^.nodesetval^.nodeTab[0];
    Result := xmlGetProp(node, attrName);

    xmlXPathFreeObject(res);
    xmlXPathFreeContext(context);
  end;

  // ===================

  procedure CreateXML(path: pchar);
  var
    doc: PxmlDoc;
    root_node: PxmlNode;
  begin
    doc := xmlNewDoc(nil);
    root_node := xmlNewNode(nil, 'config');
    xmlDocSetRootElement(doc, root_node);

    writeNewKey(doc, 'window/frame', 'border', '4');
    writeNewKey(doc, 'window/button/label', 'text', 'hello World äöü ÿ Ÿ');
    writeNewKey(doc, 'window/frame', 'width', '800');
    writeNewKey(doc, 'window/frame', 'height', '600');
    writeNewKey(doc, 'window/button', 'color', 'blue');
    writeNewKey(doc, 'window/button', 'font', 'monospace');
    writeNewKey(doc, 'window/button/font', 'size', '16');
    writeNewKey(doc, 'window/blu/blu/button/font', 'size', '16');

    xmlSaveFormatFile(path, doc, 1);
    xmlFreeDoc(doc);
  end;


  procedure AppendXML(path: pchar);
  var
    doc: PxmlDoc;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    writeNewKey(doc, 'window/frame', 'background', 'white');
    writeNewKey(doc, 'window/frame', 'foreground', 'black');

    xmlSaveFormatFile(path, doc, 1);
    xmlFreeDoc(doc);
  end;

  // ==========

  procedure printKey(doc: PxmlDoc; key, attr: pchar);
  var
    val: pchar;
  begin
    val := readKey(doc, key, attr);
    WriteLn(key, ':  ', val);
    xmlFree(val);
  end;

  procedure ReadXML(path: pchar);
  var
    doc: PxmlDoc;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS or XML_PARSE_COMPACT);

    printKey(doc, 'window/frame', 'width');
    printKey(doc, 'window/frame', 'height');
    printKey(doc, 'window/button/font', 'size');
    printKey(doc, 'window/button/label', 'text');

    xmlFreeDoc(doc);
  end;

begin
  CreateXML('config2.xml');
  AppendXML('config2.xml');

  ReadXML('config2.xml');
end.
