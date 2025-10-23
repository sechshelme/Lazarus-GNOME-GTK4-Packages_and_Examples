{$IFDEF read_interface}


var
  gmime_major_version: Tguint; cvar;external libgmime3;
  gmime_minor_version: Tguint; cvar;external libgmime3;
  gmime_micro_version: Tguint; cvar;external libgmime3;
  gmime_interface_age: Tguint; cvar;external libgmime3;
  gmime_binary_age: Tguint; cvar;external libgmime3;

function g_mime_check_version(major: Tguint; minor: Tguint; micro: Tguint): Tgboolean; cdecl; external libgmime3;
procedure g_mime_init; cdecl; external libgmime3;
procedure g_mime_shutdown; cdecl; external libgmime3;

// === Konventiert am: 21-9-25 13:37:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
