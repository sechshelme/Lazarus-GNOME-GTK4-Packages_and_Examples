program project1;
uses
  fp_gegl,
  fp_glib2;

  procedure main;
  const
    input_path = 'test.jpg';
    output_path = 'out.png';
  var
    graph, load, save, invert: PGeglNode;

  begin
    gegl_init(@argc, @argv);

    graph := gegl_node_new;
    load := gegl_node_new_child(graph, 'operation', 'gegl:load', 'path', input_path, nil);
    invert := gegl_node_new_child(graph, 'operation', 'gegl:invert', nil);
    save := gegl_node_new_child(graph, 'operation', 'gegl:png-save', 'path', output_path, nil);

    gegl_node_link_many(load, invert, save, nil);
    gegl_node_process(save);

    g_object_unref(graph);

    gegl_exit;

    g_print('Bildverarbeitung abgeschlossen. Ergebnis gespeichert in: '#10, output_path);
  end;

begin
  main;
end.
