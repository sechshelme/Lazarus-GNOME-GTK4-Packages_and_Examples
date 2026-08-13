program project1;
uses
  gegl_version,
  gegl_types,
  gegl_enums,
  gegl_buffer_enums,
  gegl_buffer_backend,
  gegl_tile_source,
  gegl_matrix,
  gegl_buffer_matrix2,
  gegl_apply,
  gegl_audio_fragment,
  gegl_buffer_swap,
  gegl_tile,
  gegl_buffer,
  gegl_tile_handler,
  gegl_tile_backend,
  gegl_buffer_iterator,
  gegl_color,
  gegl_cpuaccel,
  gegl_curve,
  gegl_node,
  gegl_debug,
  gegl_graph_debug,
  gegl_init,
  gegl_lookup,
  gegl_math,
  gegl_memory,
  gegl_metadata,
  gegl_metadatastore,
  gegl_metadatahash,
  gegl_op,
  gegl_operations_util,
  gegl_parallel,
  gegl_paramspecs,
  gegl_path,
  gegl_plugin,
  gegl_processor,
  gegl_random,
  gegl_rectangle,
  gegl_scratch,
  gegl_utils,


  fp_glib2,
  fp_gegl;

  procedure main;
  const
    input_path = 'test.jpg';
    output_path = 'out.jpg';
  var
    graph, load, save, invert: PGeglNode;

  begin
    gegl_init.gegl_init(@argc, @argv); // ???

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
  main;;
end.
