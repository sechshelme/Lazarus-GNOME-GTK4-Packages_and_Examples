program project1;

uses
  ctypes,
  fp_glib2,
  fp_json_glib;

const
  path = 'example.json';

  procedure save_json(filename: pchar);
  var
    builder: PJsonBuilder;
    root: PJsonNode;
    gen: PJsonGenerator;
    err: PGError = nil;
  begin
    builder := json_builder_new;

    json_builder_begin_object(builder);
    json_builder_set_member_name(builder, 'name');
    json_builder_add_string_value(builder, 'Peter');
    json_builder_set_member_name(builder, 'age');
    json_builder_add_int_value(builder, 37);
    json_builder_end_object(builder);

    root := json_builder_get_root(builder);

    gen := json_generator_new();
    json_generator_set_root(gen, root);
    json_generator_to_file(gen, filename, @err);

    if err <> nil then begin
      g_print('Fehler beim Schreiben: %s'#10, err^.message);
      g_error_free(err);
    end else begin
      g_print('JSON-Datei ''%s'' erzeugt.'#10, filename);
    end;

    g_object_unref(gen);
    json_node_free(root);
    g_object_unref(builder);
  end;


  procedure load_json(filename: pchar);
  var
    parser: PJsonParser;
    err: PGError = nil;
    root: PJsonNode;
    obj: PJsonObject;
    name: Pgchar;
    age: Tgint64;
  begin
    parser := json_parser_new;

    json_parser_load_from_file(parser, path, @err);
    if err <> nil then begin
      g_print('Unable to parse ''%s'': %s'#10, path, err^.message);
      g_error_free(err);
      g_object_unref(parser);
      Exit;
    end;

    root := json_parser_get_root(parser);
    if JSON_NODE_HOLDS_OBJECT(root) then begin
      obj := json_node_get_object(root);
      if json_object_has_member(obj, 'name') then begin
        name := json_object_get_string_member(obj, 'name');
        g_print('Name: %s'#10, name);
      end;
      if json_object_has_member(obj, 'age') then begin
        age := json_object_get_int_member(obj, 'age');
        g_print('Age: %d'#10, age);
      end;
    end;

    g_object_unref(parser);
  end;

  function main(argc: cint; argv: PPChar): cint;
  begin
    save_json(path);
    load_json(path);
    Result := 0;
  end;

begin
  main(argc, argv);
end.
