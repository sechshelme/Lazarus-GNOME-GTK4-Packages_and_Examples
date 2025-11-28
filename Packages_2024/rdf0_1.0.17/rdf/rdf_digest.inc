{$IFDEF read_interface}



function librdf_new_digest(world: Plibrdf_world; name: pchar): Plibrdf_digest; cdecl; external librdf;
procedure librdf_free_digest(digest: Plibrdf_digest); cdecl; external librdf;
procedure librdf_digest_init(digest: Plibrdf_digest); cdecl; external librdf;
procedure librdf_digest_update(digest: Plibrdf_digest; buf: pbyte; length: Tsize_t); cdecl; external librdf;
procedure librdf_digest_update_string(digest: Plibrdf_digest; _string: pbyte); cdecl; external librdf;
procedure librdf_digest_final(digest: Plibrdf_digest); cdecl; external librdf;
function librdf_digest_get_digest(digest: Plibrdf_digest): pointer; cdecl; external librdf;
function librdf_digest_get_digest_length(digest: Plibrdf_digest): Tsize_t; cdecl; external librdf;
function librdf_digest_to_string(digest: Plibrdf_digest): pchar; cdecl; external librdf;
procedure librdf_digest_print(digest: Plibrdf_digest; fh: PFILE); cdecl; external librdf;

// === Konventiert am: 27-11-25 17:39:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
