program project1;

uses
  Strings,
  xml2_common,

  xmlversion,         // io.
  xmlstring,          // io.
  list,               // io.
  dict,               // io. -> xmlstring
  hash,               // io. -> xmlstring, dict
  tree,               // -> xmlstring, dict     ( Pointer wegen unit circular in: xmlIO, parser)
  entities,           // io. -> xmlstring, tree
  encoding,           // io. -> tree
  xmlIO,              // io. -> xmlstring, encoding, tree
  xmlerror,           // io. -> tree
  xmlregexp,          // io. -> xmlstring, dict, tree
  valid,              // io. -> tree, list, xmlstring, xmlautomata
  parser,             // io. -> xmlstring, tree, valid, dict, hash, xmlerror, encoding, xmlIO, entities
  xpath,              // io. -> xmlstring, xmlerror, tree, hash, dict
  xmlautomata,        // io. -> xmlstring, xmlregexp
  chvalid,            // io.
  xmlmemory,          // io.
  globals,            // io. -> tree, encoding, parser, xmlerror, xmlmemory, xmlIO
  xmlwriter,          // io. -> xmlstring, tree, xmlIO
  HTMLparser,         // io. -> xmlstring, xmlIO, tree, parser, encoding
  parserInternals,    // io. -> xmlstring, tree, encoding, HTMLparser, chvalid, entities
  schemasInternals,   // io. -> xmlstring, xmlregexp, tree, hash, dict
  xpathInternals,     // io. -> xmlstring, xpath, tree
  xmlschemas,         // io. -> xmlerror, tree, encoding, schemasInternals, xmlIO, parser
  relaxng,            // io. -> xmlstring, xmlerror, tree
  xmlreader,          // io. -> xmlstring, xmlschemas, xmlIO, xmlerror, tree, relaxng, schemasInternals
  xlink,              // io. -> xmlstring, tree
  xmlunicode,         // io.
  catalog,            // io. -> xmlstring, tree
  debugXML,           // io. -> xmlstring, tree, xpath
  SAX,                // io. -> xmlstring, tree, parser, entities
  SAX2,               // io. -> xmlstring, tree, parser, entities
  nanoftp,            // io.
  schematron,         // io. -> xmlerror, tree
  xmlschemastypes,    // io. -> xmlstring, xmlschemas, tree, schemasInternals
  c14n,               // io. -> xmlstring, tree, xpath, xmlIO
  DOCBparser,         // io. -> xmlstring, encoding, tree, parser
  HTMLtree,           // io. -> xmlstring, tree, HTMLparser, xmlIO
  xpointer,           // io. -> xmlstring, xpath, tree
  pattern,            // io. -> xmlstring, dict, tree
  uri,                // io. -> xmlstring
  xinclude,           // io. -> xmlstring, tree
  xmlsave,            // io. -> xmlIO, tree, encoding
  nanohttp,           // io.
  threads,            // io. -> globals
  xmlmodule;          // io.


const
  {$IFDEF Linux}
  libc = 'libc';
    function strtok(str: pchar; delim: pchar): pchar; external libc;
    function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external libc;
  {$ENDIF}

  {$IFDEF Windows}
  libc = 'msvcrt.dll';
  function strtok_r(s: pchar; delim: pchar; saveptr: PPChar): pchar; cdecl; external libc name 'strtok_s';
  {$ENDIF}


  // ==============================

  function createXPathNode(parent: PxmlNode; path: pchar): PxmlNode;
  var
    currentNode: PxmlNode;
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
    doc: PxmlDoc;
  begin
    doc := xmlReadFile(path, nil, XML_PARSE_NOBLANKS);

    writeNewKey(doc, 'window/frame', 'background', 'white');
    writeNewKey(doc, 'window/frame', 'foreground', 'black');

    xmlSaveFormatFileEnc(path, doc, 'UTF-8', 1);
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

  procedure ReadXML(path: pchar);
  var
    doc: PxmlDoc;
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

  {$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
  procedure SetMXCSR;
  var
    w2: word = 8064;
  begin
    asm
                 Ldmxcsr w2
    end;
  end;
  {$ENDIF}
  {$ENDIF}

begin
  {$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
    SetMXCSR;
  {$ENDIF}
  {$ENDIF}
//     SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  CreateXML('config2.xml');
  AppenXML('config2.xml');

  WriteLn('---------------------------------');

  ReadXML('config2.xml');
end.
