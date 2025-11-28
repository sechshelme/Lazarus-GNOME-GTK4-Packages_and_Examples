{$IFDEF read_interface}

function librdf_new_hash(world: Plibrdf_world; name: pchar): Plibrdf_hash; cdecl; external librdf;
function librdf_new_hash_from_string(world: Plibrdf_world; name: pchar; _string: pchar): Plibrdf_hash; cdecl; external librdf;
function librdf_new_hash_from_array_of_strings(world: Plibrdf_world; name: pchar; arr: PPchar): Plibrdf_hash; cdecl; external librdf;
function librdf_new_hash_from_hash(old_hash: Plibrdf_hash): Plibrdf_hash; cdecl; external librdf;
procedure librdf_free_hash(hash: Plibrdf_hash); cdecl; external librdf;
function librdf_hash_get(hash: Plibrdf_hash; key: pchar): pchar; cdecl; external librdf;
function librdf_hash_get_as_boolean(hash: Plibrdf_hash; key: pchar): longint; cdecl; external librdf;
function librdf_hash_get_as_long(hash: Plibrdf_hash; key: pchar): Tlong; cdecl; external librdf;
function librdf_hash_get_del(hash: Plibrdf_hash; key: pchar): pchar; cdecl; external librdf;
function librdf_hash_put_strings(hash: Plibrdf_hash; key: pchar; value: pchar): longint; cdecl; external librdf;
function librdf_hash_from_string(hash: Plibrdf_hash; _string: pchar): longint; cdecl; external librdf;
function librdf_hash_to_string(hash: Plibrdf_hash; filter: PPchar): pchar; cdecl; external librdf;
procedure librdf_hash_print(hash: Plibrdf_hash; fh: PFILE); cdecl; external librdf;
procedure librdf_hash_print_keys(hash: Plibrdf_hash; fh: PFILE); cdecl; external librdf;
procedure librdf_hash_print_values(hash: Plibrdf_hash; key_string: pchar; fh: PFILE); cdecl; external librdf;
function librdf_hash_interpret_template(template_string: pbyte; dictionary: Plibrdf_hash; prefix: pbyte; suffix: pbyte): pbyte; cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
