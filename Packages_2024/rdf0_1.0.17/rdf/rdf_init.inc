{$IFDEF read_interface}


type
  Tlibrdf_raptor_init_handler = procedure(user_data: pointer; raptor_world_ptr: Praptor_world); cdecl;
  Tlibrdf_rasqal_init_handler = procedure(user_data: pointer; rasqal_world_ptr: Prasqal_world); cdecl;

function librdf_new_world: Plibrdf_world; cdecl; external librdf;
procedure librdf_free_world(world: Plibrdf_world); cdecl; external librdf;
procedure librdf_world_open(world: Plibrdf_world); cdecl; external librdf;
procedure librdf_world_init_mutex(world: Plibrdf_world); cdecl; external librdf;
procedure librdf_world_set_rasqal(world: Plibrdf_world; rasqal_world_ptr: Prasqal_world); cdecl; external librdf;
procedure librdf_world_set_raptor_init_handler(world: Plibrdf_world; user_data: pointer; handler: Tlibrdf_raptor_init_handler); cdecl; external librdf;
procedure librdf_world_set_rasqal_init_handler(world: Plibrdf_world; user_data: pointer; handler: Tlibrdf_rasqal_init_handler); cdecl; external librdf;
function librdf_world_get_rasqal(world: Plibrdf_world): Prasqal_world; cdecl; external librdf;
procedure librdf_world_set_error(world: Plibrdf_world; user_data: pointer; error_handler: Tlibrdf_log_level_func); cdecl; external librdf;
procedure librdf_world_set_warning(world: Plibrdf_world; user_data: pointer; warning_handler: Tlibrdf_log_level_func); cdecl; external librdf;
procedure librdf_world_set_logger(world: Plibrdf_world; user_data: pointer; log_handler: Tlibrdf_log_func); cdecl; external librdf;
procedure librdf_world_set_digest(world: Plibrdf_world; name: pchar); cdecl; external librdf;
procedure librdf_free_memory(ptr: pointer); cdecl; external librdf;
function librdf_alloc_memory(size: Tsize_t): pointer; cdecl; external librdf;
function librdf_calloc_memory(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external librdf;

const
  LIBRDF_WORLD_FEATURE_GENID_BASE = 'http://feature.librdf.org/genid-base';
  LIBRDF_WORLD_FEATURE_GENID_COUNTER = 'http://feature.librdf.org/genid-counter';

function librdf_world_get_feature(world: Plibrdf_world; feature: Plibrdf_uri): Plibrdf_node; cdecl; external librdf;
function librdf_world_set_feature(world: Plibrdf_world; feature: Plibrdf_uri; value: Plibrdf_node): longint; cdecl; external librdf;
procedure librdf_init_world(digest_factory_name: pchar; not_used2: pointer); cdecl; external librdf; deprecated;
procedure librdf_destroy_world; cdecl; external librdf; deprecated;
function librdf_basename(name: pchar): pchar; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
