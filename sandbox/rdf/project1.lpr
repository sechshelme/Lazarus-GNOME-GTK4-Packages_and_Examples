program project1;
uses
fp_librdf;

procedure main;
begin
  const char *uri_string = "http://planetrdf.com/index.rdf";
  librdf_world *world = NULL;
  librdf_storage *storage = NULL;
  librdf_model *model = NULL;
  librdf_uri *uri = NULL;
  librdf_parser *parser = NULL;
  librdf_stream *stream = NULL;

  /* Welt anlegen und öffnen */
  world = librdf_new_world();
  librdf_world_open(world);

  /* Storage und Model anlegen (im Speicher, kein persistenter Store) */
  storage = librdf_new_storage(world, "memory", NULL, NULL);
  model = librdf_new_model(world, storage, NULL);

  /* Parser für RDF/XML */
  parser = librdf_new_parser(world, "rdfxml", NULL, NULL);

  /* URI der Datenquelle */
  uri = librdf_new_uri(world, (const unsigned char *)uri_string);

  /* RDF in das Model einlesen */
  if(librdf_parser_parse_into_model(parser, uri, NULL, model)) {
      fprintf(stderr, "Fehler beim Parsen von %s\n", uri_string);
      goto cleanup;
  }

  /* Alle Statements aus dem Model holen */
  stream = librdf_model_as_stream(model);
  while(!librdf_stream_end(stream)) {
      librdf_statement *st = librdf_stream_get_object(stream);
      librdf_node *s = librdf_statement_get_subject(st);
      librdf_node *p = librdf_statement_get_predicate(st);
      librdf_node *o = librdf_statement_get_object(st);

      unsigned char *s_str = librdf_node_to_string(s);
      unsigned char *p_str = librdf_node_to_string(p);
      unsigned char *o_str = librdf_node_to_string(o);

      printf("S: %s\nP: %s\nO: %s\n\n", s_str, p_str, o_str);

      if(s_str) free(s_str);
      if(p_str) free(p_str);
      if(o_str) free(o_str);

      librdf_stream_next(stream);
  }

cleanup:
  if(stream) librdf_free_stream(stream);
  if(parser) librdf_free_parser(parser);
  if(uri) librdf_free_uri(uri);
  if(model) librdf_free_model(model);
  if(storage) librdf_free_storage(storage);
  if(world) librdf_free_world(world);

  return 0;
}


end;

begin
  main;



end.

