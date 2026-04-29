

  {$IFDEF read_function}
var
  vips__thread_profile : Tgboolean;cvar;external libvips;

procedure vips_profile_set(profile: Tgboolean); cdecl; external libvips;
procedure vips__thread_profile_attach(thread_name: pchar); cdecl; external libvips;
procedure vips__thread_profile_detach; cdecl; external libvips;
procedure vips__thread_profile_stop; cdecl; external libvips;
procedure vips__thread_gate_start(gate_name: pchar); cdecl; external libvips;
procedure vips__thread_gate_stop(gate_name: pchar); cdecl; external libvips;
procedure vips__thread_malloc_free(size: Tgint64); cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:20 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
