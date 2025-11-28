{$IFDEF read_interface}


type
  Tserializer_register_proc = procedure(para1: Plibrdf_serializer_factory);

procedure librdf_serializer_register_factory(world: Plibrdf_world; name: pchar; _label: pchar; mime_type: pchar; uri_string: pbyte;
  factory: Tserializer_register_proc); cdecl; external librdf;
function librdf_serializer_enumerate(world: Plibrdf_world; counter: dword; name: PPchar; _label: PPchar): longint; cdecl; external librdf; deprecated;
function librdf_serializer_get_description(world: Plibrdf_world; counter: dword): Praptor_syntax_description; cdecl; external librdf;
function librdf_serializer_check_name(world: Plibrdf_world; name: pchar): longint; cdecl; external librdf;
function librdf_new_serializer(world: Plibrdf_world; name: pchar; mime_type: pchar; type_uri: Plibrdf_uri): Plibrdf_serializer; cdecl; external librdf;
function librdf_new_serializer_from_factory(world: Plibrdf_world; factory: Plibrdf_serializer_factory): Plibrdf_serializer; cdecl; external librdf;
procedure librdf_free_serializer(serializer: Plibrdf_serializer); cdecl; external librdf;
function librdf_serializer_serialize_model(serializer: Plibrdf_serializer; handle: PFILE; base_uri: Plibrdf_uri; model: Plibrdf_model): longint; cdecl; external librdf; deprecated;
function librdf_serializer_serialize_stream_to_file_handle(serializer: Plibrdf_serializer; handle: PFILE; base_uri: Plibrdf_uri; stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_serializer_serialize_model_to_file_handle(serializer: Plibrdf_serializer; handle: PFILE; base_uri: Plibrdf_uri; model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_serializer_serialize_stream_to_file(serializer: Plibrdf_serializer; name: pchar; base_uri: Plibrdf_uri; stream: Plibrdf_stream): longint; cdecl; external librdf;
function librdf_serializer_serialize_model_to_file(serializer: Plibrdf_serializer; name: pchar; base_uri: Plibrdf_uri; model: Plibrdf_model): longint; cdecl; external librdf;
function librdf_serializer_serialize_stream_to_string(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; stream: Plibrdf_stream): pbyte; cdecl; external librdf;
function librdf_serializer_serialize_model_to_string(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; model: Plibrdf_model): pbyte; cdecl; external librdf;
function librdf_serializer_serialize_stream_to_counted_string(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; stream: Plibrdf_stream; length_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_serializer_serialize_model_to_counted_string(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; model: Plibrdf_model; length_p: Psize_t): pbyte; cdecl; external librdf;
function librdf_serializer_serialize_stream_to_iostream(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; stream: Plibrdf_stream; iostr: Praptor_iostream): longint; cdecl; external librdf;
function librdf_serializer_serialize_model_to_iostream(serializer: Plibrdf_serializer; base_uri: Plibrdf_uri; model: Plibrdf_model; iostr: Praptor_iostream): longint; cdecl; external librdf;
procedure librdf_serializer_set_error(serializer: Plibrdf_serializer; user_data: pointer; error_fn: Tset_msg_proc); cdecl; external librdf;
procedure librdf_serializer_set_warning(serializer: Plibrdf_serializer; user_data: pointer; warning_fn: Tset_msg_proc); cdecl; external librdf;
function librdf_serializer_get_feature(serializer: Plibrdf_serializer; feature: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_serializer_set_feature(serializer: Plibrdf_serializer; feature: Plibrdf_uri; value: Plibrdf_node): longint; cdecl; external librdf;
function librdf_serializer_set_namespace(serializer: Plibrdf_serializer; uri: Plibrdf_uri; prefix: pchar): longint; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
