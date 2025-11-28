program project1;

uses
  fp_rdf;

  procedure main;
  const
    uri_string = 'http://planetrdf.com/index.rdf';
  var
    world: Plibrdf_world;
    storage: Plibrdf_storage;
    model: Plibrdf_model;
    parser: Plibrdf_parser;
    uri: Plibrdf_uri;
    stream: Plibrdf_stream;
    st: Plibrdf_statement;
    s, p, o: Plibrdf_node;
    s_str, p_str, o_str: pchar;
  begin
    WriteLn('Version:  ',librdf_version_string);
    WriteLn('Copright: ',librdf_copyright_string);
    WriteLn();

    world := librdf_new_world;
    librdf_world_open(world);

    storage := librdf_new_storage(world, 'memory', nil, nil);
    model := librdf_new_model(world, storage, nil);

    parser := librdf_new_parser(world, 'rdfxml', nil, nil);

    uri := librdf_new_uri(world, uri_string);

    if librdf_parser_parse_into_model(parser, uri, nil, model) <> 0 then begin
      WriteLn('Fehler beim Parsen von ', uri_string);
      //      goto cleanup;
    end;

    stream := librdf_model_as_stream(model);
    while librdf_stream_end(stream) = 0 do begin
      st := librdf_stream_get_object(stream);
      s := librdf_statement_get_subject(st);
      p := librdf_statement_get_predicate(st);
      o := librdf_statement_get_object(st);

      s_str := librdf_node_to_string(s);
      p_str := librdf_node_to_string(p);
      o_str := librdf_node_to_string(o);

      WriteLn('S: ', s_str, '#10P: ', p_str, '#10O: ', o_str,#10#10);

      if s_str <> nil then begin
        librdf_free_memory(s_str);
      end;
      if p_str <> nil then begin
        librdf_free_memory(p_str);
      end;
      if o_str <> nil then begin
        librdf_free_memory(o_str);
      end;

      librdf_stream_next(stream);
    end;

    librdf_free_stream(stream);
    librdf_free_parser(parser);
    librdf_free_uri(uri);
    librdf_free_model(model);
    librdf_free_storage(storage);
    librdf_free_world(world);
  end;

begin
  main;
end.
