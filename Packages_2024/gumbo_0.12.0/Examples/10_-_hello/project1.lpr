program project1;
uses
  fp_gumbo;

  procedure FindElements(Node: PGumboNode);
  var
    I: integer;
    Child: PGumboNode;
  begin
    if Node = nil then begin
      Exit;
    end;

    if Node^._type = GUMBO_NODE_ELEMENT then begin
      if longint(Node^.v.element.tag) = GUMBO_TAG_TITLE then begin
        WriteLn('-> Gefunden: Ein <title> Tag!');
      end else if longint(Node^.v.element.tag) = GUMBO_TAG_P then begin
        WriteLn('-> Gefunden: Ein Textabsatz <p>!');
      end;

      for I := 0 to Node^.v.element.children.length - 1 do begin
        Child := PGumboNode(Node^.v.element.children.data[I]);
        FindElements(Child);
      end;
    end;
  end;

  procedure Main;
  const
    HTML_DATA: pchar = '<html><head><title>Hallo Welt</title></head><body><p>Test</p></body></html>';
  var
    O: PGumboOutput;
  begin
    O := gumbo_parse(HTML_DATA);

    if O = nil then begin
      WriteLn('Fehler: Parser konnte nicht gestartet werden.');
      Exit;
    end;

    if (O^.root <> nil) and (O^.root^._type = GUMBO_NODE_ELEMENT) then begin
      WriteLn('Das Dokument wurde erfolgreich geparst!');

      FindElements(O^.root);
    end;
  end;


begin
  main;
end.
