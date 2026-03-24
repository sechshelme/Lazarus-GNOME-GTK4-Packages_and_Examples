{$IFDEF read_interface}


type
  Tsmemtrack_info_t = record
    num_allocs: longint;
    num_bytes: longint;
  end;
  Psmemtrack_info_t = ^Tsmemtrack_info_t;

function smemtrack_info: Tsmemtrack_info_t; cdecl; external libsokol;
function smemtrack_alloc(size: Tsize_t; user_data: pointer): pointer; cdecl; external libsokol;
procedure smemtrack_free(ptr: pointer; user_data: pointer); cdecl; external libsokol;

// === Konventiert am: 24-3-26 13:40:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
