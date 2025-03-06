program project1;

uses
  SysUtils,
  Strings,
  fp_glib2,
  fp_xml2;


  {$IFDEF Linux}
  function strtok(str: pchar; delim: pchar): pchar; external libc;
  function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external libc;
  {$ENDIF}

  {$IFDEF Windows}
  function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external libc name 'strtok_s';
  {$ENDIF}



  // ==============================

  //function createXPathNode(parent: PxmlNode; path: pchar): PxmlNode;
  //var
  //  currentNode: PxmlNode;
  //  child, newNode: PxmlNode;
  //  saveptr, token: pchar;
  //  pathCopy: PxmlChar;
  //begin
  //  pathCopy := xmlStrdup(path);
  //  token := strtok_r(pathCopy, '/', @saveptr);
  //
  //  currentNode := parent;
  //
  //  while token <> nil do begin
  //    child := xmlFirstElementChild(currentNode);
  //    newNode := nil;
  //
  //    while child <> nil do begin
  //      if xmlStrcmp(child^.Name, token) = 0 then begin
  //        newNode := child;
  //        Break;
  //      end;
  //      child := xmlNextElementSibling(child);
  //    end;
  //
  //    if newNode = nil then begin
  //      newNode := xmlNewChild(currentNode, nil, token, nil);
  //    end;
  //
  //    currentNode := newNode;
  //    token := strtok_r(nil, '/', @saveptr);
  //  end;
  //
  //  xmlFree(pathCopy);
  //  Result := currentNode;
  //end;

  function createXPathNode(parent: PxmlNode; const path: string): PxmlNode;
  var
    currentNode: PxmlNode;
    child, newNode: PxmlNode;
    splitPath: TAnsiStringArray;
    i: integer;
  begin
    splitPath := path.Split('/');

    currentNode := parent;

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

    Result := currentNode;
  end;

  procedure writeNewKey(doc: PxmlDoc; xpath, attrName, attrValue: pchar);
  var
    node: PxmlNode;
  begin
    node := createXPathNode(xmlDocGetRootElement(doc), xpath);
    xmlSetProp(node, attrName, attrValue);
  end;

  procedure CreateXML(path: pchar);
  var
    doc: PxmlDoc;
    root_node: PxmlNode;
  begin
    doc := xmlNewDoc('1.0');
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
