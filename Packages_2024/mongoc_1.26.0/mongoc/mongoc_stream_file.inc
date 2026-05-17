

  {$IFDEF read_struct}
type
  Pmongoc_stream_file_t = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function mongoc_stream_file_new(fd: longint): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_file_new_for_path(path: pchar; flags: longint; mode: longint): Pmongoc_stream_t; cdecl; external libmongoc;
function mongoc_stream_file_get_fd(stream: Pmongoc_stream_file_t): longint; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:41 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
