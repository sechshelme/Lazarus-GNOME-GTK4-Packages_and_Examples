{$IFDEF read_interface}


type
  Tsfons_allocator_t = record
    alloc_fn: function(size: Tsize_t; user_data: pointer): pointer; cdecl;
    free_fn: procedure(ptr: pointer; user_data: pointer); cdecl;
    user_data: pointer;
  end;
  Psfons_allocator_t = ^Tsfons_allocator_t;

  Tsfons_desc_t = record
    width: longint;
    height: longint;
    allocator: Tsfons_allocator_t;
  end;
  Psfons_desc_t = ^Tsfons_desc_t;

function sfons_create(desc: Psfons_desc_t): PFONScontext; cdecl; external libsokol;
procedure sfons_destroy(ctx: PFONScontext); cdecl; external libsokol;
procedure sfons_flush(ctx: PFONScontext); cdecl; external libsokol;
function sfons_rgba(r: Tuint8_t; g: Tuint8_t; b: Tuint8_t; a: Tuint8_t): Tuint32_t; cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:39:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
