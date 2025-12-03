program project1;

uses
  fp_raptor2;

var
  stdout: PFILE; cvar;external 'c';

  function puts(s: pchar): longint; cdecl; external 'c';

  procedure triple_handler(user_data: pointer; statement: Praptor_statement); cdecl;
  begin
    WriteLn('--- TRIPEL GEFUNDEN ---');

    raptor_statement_print_as_ntriples(statement, stdout);
    puts(#10);
    WriteLn;
  end;

  procedure main;
  const
    rdf_content =
      '<?xml version="1.0"?>'#10 +
      '<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"'#10 +
      '         xmlns:ex="http://example.org/terms/">'#10 +
      '  <rdf:Description rdf:about="http://example.org/book/123">'#10 +
      '    <ex:title>FPC-Beispiel mit Raptor2</ex:title>'#10 +
      '    <ex:author>Gemini AI</ex:author>'#10 +
      '    <ex:hello>Hello World !</ex:hello>'#10 +
      '  </rdf:Description>'#10 +
      '</rdf:RDF>';
  var
    world: Praptor_world;
    parser: Praptor_parser;
    base_uri: Praptor_uri;
    res: longint;
  begin
    world := raptor_new_world;
    if world = nil then begin
      WriteLn('Fehler: Konnte raptor world nicht initialisieren.');
      Exit;;
    end;

    parser := raptor_new_parser(world, 'rdfxml');
    if parser = nil then begin
      WriteLn('Fehler: Konnte RDF/XML-Parser nicht erstellen.');
      raptor_free_world(world);
      Exit;
    end;

    raptor_parser_set_statement_handler(parser, nil, @triple_handler);

    WriteLn('Starte das Parsen des RDF/XML-Strings...'#10);

    base_uri := raptor_new_uri(world, 'http://example.org/base');

    res := raptor_parser_parse_start(parser, base_uri);
    if res <> 0 then begin
      WriteLn('Fehler: Start des Parsens fehlgeschlagen (Fehlercode ',res,').');
      raptor_free_uri(base_uri);
      raptor_free_parser(parser);
      raptor_free_world(world);
      Exit;
    end;

    res := raptor_parser_parse_chunk(parser, rdf_content, strlen(rdf_content), 1);
    if res <> 0 then begin
      WriteLn('Fehler: Parsen des Chunks fehlgeschlagen (Fehlercode ',res,').');
    end else begin
      WriteLn(#10'Parsen erfolgreich abgeschlossen.');
    end;

    raptor_free_uri(base_uri);
    raptor_free_parser(parser);
    raptor_free_world(world);
  end;

begin
  main;
end.

