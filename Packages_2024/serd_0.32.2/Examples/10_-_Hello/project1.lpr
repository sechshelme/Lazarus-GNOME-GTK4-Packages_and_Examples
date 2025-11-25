program project1;

uses
  fp_serd;

  function on_statement(handle: pointer; flags: TSerdStatementFlags; graph, subject, predicate, obj, object_datatype, object_lang: PSerdNode): TSerdStatus; cdecl;
  begin
    WriteLn('Gefunden:');
    if graph <> nil then  begin
      WriteLn('  Graph:    ', graph^.buf);
    end;
    if subject <> nil then  begin
      WriteLn('  Subjekt:  ', subject^.buf);
    end;
    if predicate <> nil then  begin
      WriteLn('  Prädikat: ', predicate^.buf);
    end;
    if obj <> nil then  begin
      WriteLn('  Objekt:   ', obj^.buf);
    end;
    WriteLn();

    Result := SERD_SUCCESS;
  end;

  procedure main;
  const
    input_data: pchar =
      '@prefix foaf: <http://xmlns.com/foaf/0.1/> .'#10 +
      '<http://example.org/Graph1> {' +
      '  <http://example.org/PersonA> a foaf:Person ;'#10 +
      '    foaf:name "Max Mustermann" ;'#10 +
      '    foaf:knows <http://example.org/PersonB> .' +
      '}';

  var
    reader: PSerdReader;
    status: TSerdStatus;

  begin
    reader := serd_reader_new(SERD_TURTLE, nil, nil, nil, nil, @on_statement, nil);

    WriteLn('Starte Parsing...'#10);

    status := serd_reader_read_string(reader, input_data);
    if status <> SERD_SUCCESS then begin
      WriteLn('Fehler beim Parsen: ', status);
    end;

    serd_reader_free(reader);
  end;

begin
  main;
end.
