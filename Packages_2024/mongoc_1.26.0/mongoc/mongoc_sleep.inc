

  {$IFDEF read_struct}
type
  Tmongoc_usleep_func_t = procedure(usec: Tint64_t; user_data: pointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure mongoc_client_set_usleep_impl(client: Pmongoc_client_t; usleep_func: Tmongoc_usleep_func_t; user_data: pointer); cdecl; external libmongoc;
procedure mongoc_usleep_default_impl(usec: Tint64_t; user_data: pointer); cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:14:53 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
