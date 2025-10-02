program project1;

uses
  xb_node,
  xb_builder_node,         // xb_node
  xb_builder_fixup,        // xb_builder_node
  xb_builder_source_ctx,
  xb_builder_source,       // xb_builder_node, xb_builder_source_ctx, xb_builder_fixup
  xb_opcode,
  xb_stack,                // xb_opcode
  xb_value_bindings,       // xb_opcode
  xb_machine,              // xb_stack, xb_value_bindings, xb_opcode
  xb_node_silo,            // xb_node
  xb_query,
  xb_query_context,        // xb_value_bindings, xb_query, xb_node
  xb_node_query,           // xb_node, xb_query, xb_query_context
  xb_silo,                 // xb_query
  xb_silo_export,          // xb_node
  xb_silo_query,           // xb_query, xb_query_context
  xb_builder,              // xb_builder_source, xb_builder_node, xb_builder_fixup, , xb_silo
  xb_string,
  xb_version,


  fp_glib2,
  fp_xmlb;

// Aus der test.xml eine test.xmlb erzeugen:
// xb-tool compile test.xmlb test.xml


  function main(argc: integer; argv: PPChar): integer;
  var
    silo: PXbSilo;
    err: PGError;
    root: PXbNode;
  begin
        silo := xb_silo_new;
        if not xb_silo_load_from_file(silo, 'test.xmlb',0, nil,@err )then begin
            g_printf('XMLB konnte nicht geladen werden!');
            Exit(1);
        end;

        // Wurzelknoten abfragen
        root := xb_silo_get_root(silo);
        g_print('Root node: %s'#10, xb_node_get_name(root));

        // Beispiel: Über die erste Child-Node
        for (XbNode *child = xb_node_get_first_child(root); child != NULL; child = xb_node_get_next(child)) {
            g_print("Child node: %s\n", xb_node_get_name(child));
        }
        g_object_unref(silo);
        return 0;
    }

  end;

begin
  main(argc, argv);
end.
