{$IFDEF read_interface}

function ges_timeline_new_audio_video: PGESTimeline; cdecl; external libges;
function ges_pspec_equal(key_spec_1: Tgconstpointer; key_spec_2: Tgconstpointer): Tgboolean; cdecl; external libges;
function ges_pspec_hash(key_spec: Tgconstpointer): Tguint; cdecl; external libges;

// === Konventiert am: 12-12-24 15:18:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
