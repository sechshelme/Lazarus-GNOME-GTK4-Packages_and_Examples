program project1;

uses
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

  procedure loadSongsFromXML(path: pchar);
  var
    doc: TxmlDocPtr;
    context: TxmlXPathContextPtr;
    res: TxmlXPathObjectPtr;
    nodeset: TxmlNodeSetPtr;
    i: integer;
    node: TxmlNodePtr;
    song: PxmlChar;
  begin
    doc := xmlParseFile(path);
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
      xmlFreeDoc(doc);
      xmlXPathFreeContext(context);
      Exit;
    end;

    nodeset := res^.nodesetval;
    if nodeset <> nil then begin
      for i := 0 to nodeset^.nodeNr do begin
        node := nodeset^.nodeTab[i];
        song := xmlNodeGetContent(node);
        WriteLn(song);
        xmlFree(song);
      end;
    end;
  end;



begin
  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);


  loadSongsFromXML('config.xml');
  //    xmlValidateNCName(nil, 0);

end.
