program project1;

uses
  fp_expat;

var
  depth: integer = 0;

  procedure printFeatureList;
  var
    list: PXML_Feature;
  begin
    WriteLn('Features:');
    list := XML_GetFeatureList;
    if list <> nil then begin
      while list^.name <> nil do begin
        WriteLn('  ',list^.name);
        Inc(list);
      end;
    end;
    WriteLn(#10);
  end;

  procedure startElement_cb(userData: pointer; name: PXML_Char; atts: PPXML_Char); cdecl;
  var
    j, i: integer;
  begin
    for j := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;
    WriteLn('Start-Tag: ', name);

    j := 0;
    while atts[j] <> nil do begin
      for i := 0 to depth * 2 + 1 do begin
        Write(' ');
      end;
      WriteLn(atts[j], ' "', atts[j + 1], '"');
      Inc(j, 2);
    end;
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
    WriteLn('End-Tag: ', name);
  end;

  procedure characterData_cb(userData: pointer; s: PXML_Char; len: longint); cdecl;
  var
    i: integer;
  begin
    for i := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;
    WriteLn('Text: ', copy(s, 1, len));
  end;

  procedure comment_cp(userData: pointer; data: PXML_Char); cdecl;
  var
    i: integer;
  begin
    for i := 0 to depth * 2 - 1 do begin
      Write(' ');
    end;
    WriteLn('Comment: ', data);
  end;

  procedure main;
  const
    xml = '<root><!-- Ich bin ein Kommentar --><child><blublu1>Hello XML</blublu1><Options><Version width=''320'' height=''200''/><Version/></Options><blublu2>Text</blublu2></child></root>';
  var
    parser: TXML_Parser;
  begin
    WriteLn('Version: ', XML_ExpatVersion, #10);
    printFeatureList;

    parser := XML_ParserCreate(nil);
    XML_SetElementHandler(parser, @startElement_cb, @endElement_cb);
    XML_SetCharacterDataHandler(parser, @characterData_cb);
    XML_SetCommentHandler(parser, @comment_cp);

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
