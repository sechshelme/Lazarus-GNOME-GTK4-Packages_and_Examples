

{$IFDEF read_function}
function gegl_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libgegl;
function gegl_try_malloc(n_bytes: Tgsize): Tgpointer; cdecl; external libgegl;
procedure gegl_free(mem: Tgpointer); cdecl; external libgegl;
function gegl_calloc(size: Tgsize; n_memb: Tgint): Tgpointer; cdecl; external libgegl;
function gegl_memeq_zero(ptr: Tgconstpointer; size: Tgsize): Tgboolean; cdecl; external libgegl;
procedure gegl_memset_pattern(dst_ptr: Tgpointer; src_ptr: Tgconstpointer; pattern_size: Tgint; count: Tgint); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:09:08 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
