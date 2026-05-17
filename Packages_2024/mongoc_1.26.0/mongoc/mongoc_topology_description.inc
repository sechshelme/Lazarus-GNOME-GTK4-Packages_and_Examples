

  {$IFDEF read_struct}
type
  Pmongoc_topology_description_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_topology_description_destroy(description: Pmongoc_topology_description_t); cdecl; external libmongoc;
function mongoc_topology_description_new_copy(description: Pmongoc_topology_description_t): Pmongoc_topology_description_t; cdecl; external libmongoc;
function mongoc_topology_description_has_readable_server(td: Pmongoc_topology_description_t; prefs: Pmongoc_read_prefs_t): boolean; cdecl; external libmongoc;
function mongoc_topology_description_has_writable_server(td: Pmongoc_topology_description_t): boolean; cdecl; external libmongoc;
function mongoc_topology_description_type(td: Pmongoc_topology_description_t): pchar; cdecl; external libmongoc;
function mongoc_topology_description_get_servers(td: Pmongoc_topology_description_t; n: Psize_t): PPmongoc_server_description_t; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:22 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
