program project1;

uses
  fp_gumbo;

  procedure main;
  const
    html = '<html><head><title>Hallo Welt</title></head><body><p>Test</p></body></html>';
  var
    o: PGumboOutput;
  begin
    o := gumbo_parse(html);

    if o^.root^._type = GUMBO_NODE_ELEMENT then begin
      WriteLn('Das Dokument wurde erfolgreich geparst!');

      if o^.root^.v.element.tag = GUMBO_TAG_HTML then begin
        WriteLn('Das Root-Tag ist: <html>');
      end;
    end;
    gumbo_destroy_output(@kGumboDefaultOptions, o);
  end;

begin
  main;
end.
