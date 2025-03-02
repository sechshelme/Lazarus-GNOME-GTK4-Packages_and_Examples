program project1;

uses
  Strings,
  xml2_common,

  xmlstring,          // io.
  list,               // io.
  dict,               // io. -> xmlstring
  hash,               // io. -> xmlstring, dict
  tree,               // -> xmlstring, dict     ( Pointer wegen unit circular )
  encoding,           // io. -> tree
  xmlerror,           // io. -> tree
  xmlIO,              // io. -> xmlstring, encoding, tree
  xmlregexp,          // io. -> xmlstring, dict, tree
  xmlautomata,        // io. -> xmlstring, xmlregexp
  valid,              // io. -> tree, list, xmlstring, xmlautomata
  parser,             // io. -> xmlstring, tree, valid, dict, hash, xmlerror, encoding, xmlIO

  xpath,              // io. -> xmlstring, xmlerror, tree, hash, dict
  xmlmemory,
  globals,

  Math;

  procedure loadSongsFromXML1(path: pchar);
  var
    doc: TxmlDocPtr;
    context: TxmlXPathContextPtr;
    res: TxmlXPathObjectPtr;
    nodeset: TxmlNodeSetPtr;
    i: integer;
    node: TxmlNodePtr;
    song: PxmlChar;
  begin
    doc := xmlReadFile(path, nil, 0);
    if doc = nil then begin
      WriteLn('Fehler beim öffnen der doc');
      Exit;
    end;

    context := xmlXPathNewContext(doc);
    if context = nil then begin
      WriteLn('Fehler beim erstellen des XPath context');
      xmlFreeDoc(doc);
      Exit;
    end;

    res := xmlXPathEvalExpression('//songs/items/@song', context);
    if res = nil then begin
      WriteLn('Fehler bei XPath Auswertung');
      xmlXPathFreeContext(context);
      xmlFreeDoc(doc);
      Exit;
    end;

    nodeset := res^.nodesetval;
    if nodeset <> nil then begin
      WriteLn('count: ', nodeset^.nodeNr);
      for i := 0 to nodeset^.nodeNr - 1 do begin
        node := nodeset^.nodeTab[i];
        song := xmlNodeGetContent(node);
        WriteLn(song);
        xmlFree(song);
      end;
    end;

    xmlXPathFreeObject(res);
    xmlXPathFreeContext(context);
    xmlFreeDoc(doc);
  end;

  // https://www.perplexity.ai/search/wie-kann-ihc-mit-der-libxml2-f-0z0rsVD2Tm6YhRyvK_LX6g

  procedure parse_songs(node: PxmlNode);
  var
    index, song: pchar;
    cur_node: PxmlNode;
  begin
    cur_node := node;

    while cur_node <> nil do begin
      if (cur_node^._type = XML_ELEMENT_NODE) and (strcomp(cur_node^.Name, 'items') = 0) then begin
        index := xmlGetProp(cur_node, PChar('index'));
        song := xmlGetProp(cur_node, PChar('song'));

        WriteLn('Index: ', index, ', Song: ', song);

        xmlFree(index);
        xmlFree(song);
      end;

      parse_songs(cur_node^.children);
      cur_node := cur_node^.Next;
    end;
  end;


  procedure loadSongsFromXML2(path: pchar);
  var
    doc: TxmlDocPtr;
    root_element: TxmlNodePtr;
  begin
    doc := xmlReadFile(path, nil, 0);
    if doc = nil then begin
      WriteLn('Fehler beim öffnen der doc');
      Exit;
    end;

    root_element := xmlDocGetRootElement(doc);
    if root_element = nil then begin
      WriteLn('Leeres oder fehlerhaftes Doc');
      Exit;
    end;

    WriteLn('Root Element: ', root_element^.Name);
    parse_songs(root_element);

    xmlFreeDoc(doc);
    xmlCleanupParser;

  end;


  ///////////

  function strtok(str: pchar; delim: pchar): pchar; external 'libc';    // msvcrt.dll
  function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external 'libc';

  // https://www.perplexity.ai/search/ich-will-eine-config-xml-mit-l-iRnb5Pk8Sri0IqhTn9GzAQ
  // https://www.perplexity.ai/search/wie-wurde-man-folgendes-beispu-KAmXKQNhS5qsQb.MOYcR7Q

  // ==============================


  //  https://www.perplexity.ai/search/das-schreiben-eines-keys-sieht-M19BI.JKRG.GS24Ame9QCw
  // https://www.perplexity.ai/search/ich-will-folgendes-mit-libxml2-uUjHrYrgT.y8dou5uWImXg

  function createXPathNode(parent: TxmlNodePtr; path: pchar): TxmlNodePtr;
  var
    currentNode: TxmlNodePtr;
    child, newNode: PxmlNode;
    saveptr, token: pchar;
    pathCopy: PxmlChar;
  begin
    pathCopy := xmlStrdup(path);
    token := strtok_r(pathCopy, '/', @saveptr);

    currentNode := parent;

    while token <> nil do begin
      child := xmlFirstElementChild(currentNode);
      newNode := nil;

      while child <> nil do begin
        if xmlStrcmp(child^.Name, token) = 0 then begin
          newNode := child;
          Break;
        end;
        child := xmlNextElementSibling(child);
      end;

      if newNode = nil then begin
        newNode := xmlNewChild(currentNode, nil, token, nil);
      end;

      currentNode := newNode;
      token := strtok_r(nil, '/', @saveptr);
    end;

    xmlFree(pathCopy);
    Result:=currentNode;
  end;

  procedure writeNewKey(doc: TxmlDocPtr; xpath, attrName, attrValue: pchar);
  var
    node: TxmlNodePtr;
  begin
    node := createXPathNode(xmlDocGetRootElement(doc), xpath);
    xmlSetProp(node, attrName, attrValue);
  end;

  procedure CreateXML(path: pchar);
  var
    doc: TxmlDocPtr;
    root_node: TxmlNodePtr;
  begin
    doc := xmlNewDoc('1.0');
    root_node := xmlNewNode(nil, 'config');
    xmlDocSetRootElement(doc, root_node);

    writeNewKey(doc, '/window/frame', 'border', '4');
    writeNewKey(doc, '/window/button/label', 'text', 'hello äöü');
    writeNewKey(doc, '/window/frame', 'width', '800');
    writeNewKey(doc, '/window/frame', 'height', '600');
    writeNewKey(doc, '/window/button', 'color', 'blue');
    writeNewKey(doc, '/window/button', 'font', 'monospace');
    writeNewKey(doc, '/window/button/font', 'size', '16');
    writeNewKey(doc, '/window/blu/blu/button/font', 'size', '16');

    xmlSaveFormatFileEnc(path, doc, 'UTF-8', 1);
    xmlFreeDoc(doc);
  end;


  procedure AppenXML(path: pchar);
  var
    doc: TxmlDocPtr;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    writeNewKey(doc, '/window/frame', 'background', 'white');
    writeNewKey(doc, '/window/frame', 'foreground', 'black');

    xmlSaveFormatFileEnc(path, doc, 'UTF-8', 1);
    xmlFreeDoc(doc);
  end;



begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);

  //  WriteXLM('config.xml');
  CreateXML('config2.xml');
  AppenXML('config2.xml');


  WriteLn('---------------------------------');

  //  loadSongsFromXML1('config.xml');
  WriteLn('---------------------------------');
  //  loadSongsFromXML2('config.xml');
  //    xmlValidateNCName(nil, 0);

end.
