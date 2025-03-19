program project1;

uses
  fp_glib2,
  fp_xml2;

  // === Create Config-XML

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

  procedure writeStringArr(doc: PxmlDoc; const key: Pgchar; sa: PPgchar);
  var
    i: integer;
    buf1: array[0..255] of Tgchar;
    buf2: array[0..15] of Tgchar;
  begin
    i := 0;
    while sa[i] <> nil do begin
      g_snprintf(buf1, SizeOf(buf1), '%s/items/item%d', key, i);
      writeKey(doc, buf1, 'value', sa[i]);
      Inc(i);
    end;
    g_snprintf(buf1, SizeOf(buf1), '%s/items', key);
    g_snprintf(buf2, SizeOf(buf2), '%d', i);
    writeKey(doc, buf1, 'count', buf2);
  end;

  function readStringArr(doc: PxmlDoc; const key: Pgchar): PPgchar;
  var
    i, len: Tgint64;
    buf1: array[0..255] of Tgchar;
    buf2: Pgchar;
  begin
    Result := nil;
    g_snprintf(buf1, SizeOf(buf1), '%s/items', key);
    buf2 := readKey(doc, buf1, 'count');
    if buf2 = nil then begin
      Exit(nil);
    end;
    len := g_ascii_strtoll(buf2, nil, 10);
    g_free(buf2);
    Result := g_malloc(SizeOf(Pgchar) * (len + 1));

    for i := 0 to len - 1 do begin
      g_snprintf(buf1, SizeOf(buf1), '%s/items/item%d', key, i);
      Result[i] := readKey(doc, buf1, 'value');
    end;
    Result[len] := nil;
  end;

  // ===================

  procedure CreateXML(path: pchar);
  var
    doc: PxmlDoc;
    root_node: PxmlNode;

  const
    fruits: array of Pgchar = ('Birnen', 'Äepfel', 'Kirschen', 'Quitten', 'Plaumen', 'Zwetschgen', 'Holunder', 'Erdbeeren', nil);
  begin
    doc := xmlNewDoc(nil);
    root_node := xmlNewNode(nil, 'config');
    xmlDocSetRootElement(doc, root_node);

    writeStringArr(doc, 'window/memo', PPChar(fruits));

    writeKey(doc, 'window/frame', 'border', '4');
    writeKey(doc, 'window/button/label', 'text', 'hello World äöü ÿ Ÿ');
    writeKey(doc, 'window/frame', 'width', '800');
    writeKey(doc, 'window/frame', 'height', '600');
    writeKey(doc, 'window/button', 'color', 'blue');
    writeKey(doc, 'window/button', 'font', 'monospace');
    writeKey(doc, 'window/button/font', 'size', '16');
    writeKey(doc, 'window/blu/blu/button/font', 'size', '16');

    xmlSaveFormatFile(path, doc, 1);
    xmlFreeDoc(doc);
  end;


  procedure AppendXML(path: pchar);
  var
    doc: PxmlDoc;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    writeKey(doc, 'window/frame', 'background', 'white');
    writeKey(doc, 'window/frame', 'foreground', 'black');

    xmlSaveFormatFile(path, doc, 1);
    xmlFreeDoc(doc);
  end;

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
    i: integer;
    sa: PPgchar;
    len: Tguint;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    printKey(doc, 'window/frame', 'width');
    printKey(doc, 'window/frame', 'height');
    printKey(doc, 'window/button/font', 'size');
    printKey(doc, 'window/button/label', 'text');

    sa := readStringArr(doc, 'window/memo');
    if sa <> nil then begin
      len := g_strv_length(sa);
      g_printf('count: %d'#10, len);
      for i := 0 to len - 1 do begin
        g_printf('  %3d. %s'#10, i, sa[i]);
      end;
      g_strfreev(sa);
    end;

    xmlFreeDoc(doc);
  end;

begin
  CreateXML('config2.xml');
  AppendXML('config2.xml');

  ReadXML('config2.xml');
end.
