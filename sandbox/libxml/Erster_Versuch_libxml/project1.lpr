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

  parserInternals,
  schemasInternals,
  xpathInternals,


  xpath,              // io. -> xmlstring, xmlerror, tree, hash, dict
  xmlmemory,          // io.
  globals,            // io. -> tree, encoding, parser, xmlerror, xmlmemory
  xmlwriter,          // io. -> xmlstring, tree
  HTMLparser,         // io. -> xmlstring, xmlIO, tree, parser, encoding
  xmlschemas,         // io. -> xmlerror, tree, encoding, schemasInternals
  relaxng,            // io. -> xmlstring, xmlerror, tree
  xmlreader,          // io. -> xmlstring, xmlschemas, xmlIO, xmlerror, tree, relaxng
  chvalid,            // io.
  xlink,              // io. -> xmlstring, tree
  xmlunicode,         // io.
  xmlversion,         // io.
  catalog,            // io. -> xmlstring, tree
  debugXML,           // io. -> xmlstring, tree, xpath
  entities,           // io. -> xmlstring, tree
  SAX2,               // io. -> xmlstring, tree, parser
  nanoftp,            // io.
  SAX,                // io. -> xmlstring, tree, parser
  schematron,         // io. -> xmlerror, tree
  xmlschemastypes,    // io. -> xmlstring, xmlschemas, tree, schemasInternals
  c14n,               // io. -> xmlstring, tree, xpath
  DOCBparser,         // io. -> xmlstring, encoding, tree, parser
  HTMLtree,           // io. -> xmlstring, tree, HTMLparser
  xpointer,           // io. -> xmlstring, xpath, tree


  Math;


  function strtok(str: pchar; delim: pchar): pchar; external 'libc';    // msvcrt.dll
  function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external 'libc';

  // ==============================

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
    Result := currentNode;
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

    writeNewKey(doc, 'window/frame', 'border', '4');
    writeNewKey(doc, 'window/button/label', 'text', 'hello äöü');
    writeNewKey(doc, 'window/frame', 'width', '800');
    writeNewKey(doc, 'window/frame', 'height', '600');
    writeNewKey(doc, 'window/button', 'color', 'blue');
    writeNewKey(doc, 'window/button', 'font', 'monospace');
    writeNewKey(doc, 'window/button/font', 'size', '16');
    writeNewKey(doc, 'window/blu/blu/button/font', 'size', '16');

    xmlSaveFormatFileEnc(path, doc, 'UTF-8', 1);
    xmlFreeDoc(doc);
  end;


  procedure AppenXML(path: pchar);
  var
    doc: TxmlDocPtr;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    writeNewKey(doc, 'window/frame', 'background', 'white');
    writeNewKey(doc, 'window/frame', 'foreground', 'black');

    xmlSaveFormatFileEnc(path, doc, 'UTF-8', 1);
    xmlFreeDoc(doc);
  end;

  // ==========

  function readKey(doc: TxmlDocPtr; xpath, attrName: pchar): pchar;
  var
    context: TxmlXPathContextPtr;
    res: TxmlXPathObjectPtr;
    node, root: TxmlNodePtr;
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

  procedure ReadXML(path: pchar);
  var
    doc: TxmlDocPtr;
    val: pchar;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    val := readKey(doc, 'window/frame', 'width');
    WriteLn('width: ', val);
    xmlFree(val);

    val := readKey(doc, 'window/frame', 'height');
    WriteLn('height: ', val);
    xmlFree(val);

  end;


begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);

  CreateXML('config2.xml');
  AppenXML('config2.xml');

  WriteLn('---------------------------------');

  ReadXML('config2.xml');
end.
