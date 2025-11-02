program project1;

uses
  fp_expat;

var
  depth: integer = 0;

  //void startElement(void *userData, const char *name, const char **atts) {
  //}
  //
  //void endElement(void *userData, const char *name) {
  //}
  //
  //void characterData(void *userData, const char *s, int len) {
  //}

  procedure startElement_cb(userData: pointer; name: PXML_Char; atts: PPXML_Char); cdecl;
  var
    i: integer;
  begin
    for i := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;
    WriteLn('Start-Tag: ', name);
    //
    //    for (int i = 0; atts[i]; i += 2) {
    //        const char *attrName = atts[i];
    //        const char *attrValue = atts[i+1];
    //        printf("              Attribut: %s = %s\n", attrName, attrValue);
    //    }
    //
    Inc(depth);

  end;

  procedure endElement_cb(userData: pointer; name: PXML_Char); cdecl;
  var
    i: integer;
  begin
    Dec(depth);
    for i := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;
    //    for (int i = 0; i < depth; i++) printf("  "); // Einrückung je nach Tiefe
    WriteLn('End-Tag: ', name);

  end;

  procedure characterData_cb(userData: pointer; s: PXML_Char; len: longint); cdecl;
  var
    i: integer;
  begin
    for i := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;

    //    for (int i = 0; i < depth; i++) printf("  "); // Einrückung je nach Tiefe
    //    printf("Text: %.*s\n", len, s);
    //      WriteLn('Text: ',s);

  end;

  procedure main;
  const
//    xml = '<root><child><blublu1>Text</blublu1><Options><Version width=''320'' height=''200''/><Version/></Options><blublu2>Text</blublu2></child></root>';
    //  const  xml = '<root><child></child></root>';
    xml:pchar = '<root><child><blublu1>Text</blublu1><Options><Version width=''320'' height=''200''/><Version/></Options><blublu2>Text</blublu2></child></root>';
  var
    parser: TXML_Parser;
  begin

    parser := XML_ParserCreate(nil);
    XML_SetElementHandler(parser, @startElement_cb, @endElement_cb);
    XML_SetCharacterDataHandler(parser, @characterData_cb);

    if XML_Parse(parser, xml, Length(xml), XML_TRUE) = XML_STATUS_ERROR then begin
      WriteLn('Parse Error at line ', XML_GetCurrentLineNumber(parser), ' : ', XML_ErrorString(XML_GetErrorCode(parser)));
      XML_ParserFree(parser);
      exit;
    end;

    XML_ParserFree(parser);
  end;

begin
  main;
end.
