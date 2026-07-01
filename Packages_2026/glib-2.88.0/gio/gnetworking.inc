

  {$IFDEF read_enum}
const
  T_SRV = 33;
  _PATH_RESCONF = '/etc/resolv.conf';
  {$ENDIF read_enum}

{$IFDEF read_function}
procedure g_networking_init; cdecl; external libgio2;
{$ENDIF read_function}

// === Konventiert am: 26-6-26 19:43:45 ===



{$IFDEF read_implementation}


{$ENDIF read_implementation}
