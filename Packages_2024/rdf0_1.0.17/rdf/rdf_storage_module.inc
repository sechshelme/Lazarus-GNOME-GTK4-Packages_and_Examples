{$IFDEF read_interface}


type
  Plibrdf_storage_instance = ^Tlibrdf_storage_instance;
  Tlibrdf_storage_instance = pointer;

const
  LIBRDF_STORAGE_MIN_INTERFACE_VERSION = 1;
  LIBRDF_STORAGE_MAX_INTERFACE_VERSION = 1;
  LIBRDF_STORAGE_INTERFACE_VERSION = LIBRDF_STORAGE_MAX_INTERFACE_VERSION;

type
  Tlibrdf_storage_factory_s = record
    version: longint;
    name: pchar;
    _label: pchar;
    init: function(storage: Plibrdf_storage; name: pchar; options: Plibrdf_hash): longint; cdecl;
    clone: function(new_storage: Plibrdf_storage; old_storage: Plibrdf_storage): longint; cdecl;
    terminate: procedure(storage: Plibrdf_storage); cdecl;
    open: function(storage: Plibrdf_storage; model: Plibrdf_model): longint; cdecl;
    close: function(storage: Plibrdf_storage): longint; cdecl;
    size: function(storage: Plibrdf_storage): longint; cdecl;
    add_statement: function(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl;
    add_statements: function(storage: Plibrdf_storage; statement_stream: Plibrdf_stream): longint; cdecl;
    remove_statement: function(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl;
    contains_statement: function(storage: Plibrdf_storage; statement: Plibrdf_statement): longint; cdecl;
    has_arc_in: function(storage: Plibrdf_storage; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl;
    has_arc_out: function(storage: Plibrdf_storage; node: Plibrdf_node; _property: Plibrdf_node): longint; cdecl;
    serialise: function(storage: Plibrdf_storage): Plibrdf_stream; cdecl;
    find_statements: function(storage: Plibrdf_storage; statement: Plibrdf_statement): Plibrdf_stream; cdecl;
    find_statements_with_options: function(storage: Plibrdf_storage; statement: Plibrdf_statement; context_node: Plibrdf_node; options: Plibrdf_hash): Plibrdf_stream; cdecl;
    find_sources: function(storage: Plibrdf_storage; arc: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl;
    find_arcs: function(storage: Plibrdf_storage; src: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl;
    find_targets: function(storage: Plibrdf_storage; src: Plibrdf_node; target: Plibrdf_node): Plibrdf_iterator; cdecl;
    get_arcs_in: function(storage: Plibrdf_storage; node: Plibrdf_node): Plibrdf_iterator; cdecl;
    get_arcs_out: function(storage: Plibrdf_storage; node: Plibrdf_node): Plibrdf_iterator; cdecl;
    context_add_statement: function(storage: Plibrdf_storage; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl;
    context_remove_statement: function(storage: Plibrdf_storage; context: Plibrdf_node; statement: Plibrdf_statement): longint; cdecl;
    context_serialise: function(storage: Plibrdf_storage; context: Plibrdf_node): Plibrdf_stream; cdecl;
    sync: function(storage: Plibrdf_storage): longint; cdecl;
    context_add_statements: function(storage: Plibrdf_storage; context: Plibrdf_node; stream: Plibrdf_stream): longint; cdecl;
    context_remove_statements: function(storage: Plibrdf_storage; context: Plibrdf_node): longint; cdecl;
    find_statements_in_context: function(storage: Plibrdf_storage; statement: Plibrdf_statement; context_node: Plibrdf_node): Plibrdf_stream; cdecl;
    get_contexts: function(storage: Plibrdf_storage): Plibrdf_iterator; cdecl;
    get_feature: function(storaage: Plibrdf_storage; feature: Plibrdf_uri): Plibrdf_node; cdecl;
    set_feature: function(storage: Plibrdf_storage; feature: Plibrdf_uri; value: Plibrdf_node): longint; cdecl;
    transaction_start: function(storage: Plibrdf_storage): longint; cdecl;
    transaction_start_with_handle: function(storage: Plibrdf_storage; handle: pointer): longint; cdecl;
    transaction_commit: function(storage: Plibrdf_storage): longint; cdecl;
    transaction_rollback: function(storage: Plibrdf_storage): longint; cdecl;
    transaction_get_handle: function(storage: Plibrdf_storage): pointer; cdecl;
    supports_query: function(storage: Plibrdf_storage; query: Plibrdf_query): longint; cdecl;
    query_execute: function(storage: Plibrdf_storage; query: Plibrdf_query): Plibrdf_query_results; cdecl;
  end;
  Plibrdf_storage_factory_s = ^Tlibrdf_storage_factory_s;

  Tlibrdf_storage_module_register_function = procedure(world: Plibrdf_world); cdecl;

  // === Konventiert am: 27-11-25 17:39:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
