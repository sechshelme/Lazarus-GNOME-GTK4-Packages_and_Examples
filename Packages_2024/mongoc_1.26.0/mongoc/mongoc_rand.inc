

{$IFDEF read_function}
procedure mongoc_rand_seed(buf: pointer; num: longint); cdecl; external libmongoc;
procedure mongoc_rand_add(buf: pointer; num: longint; entropy: double); cdecl; external libmongoc;
function mongoc_rand_status: longint; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:07 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
