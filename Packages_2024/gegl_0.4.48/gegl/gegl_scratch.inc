

{$IFDEF read_function}
function gegl_scratch_alloc(size: Tgsize): Tgpointer; cdecl; external libgegl;
function gegl_scratch_alloc0(size: Tgsize): Tgpointer; cdecl; external libgegl;
procedure gegl_scratch_free(ptr: Tgpointer); cdecl; external libgegl;
{$ENDIF read_function}

// === Konventiert am: 12-8-26 15:23:28 ===


{$IFDEF read_implementation}

{$ENDIF read_implementation}
