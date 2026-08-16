{$IFDEF read_interface}


function rist_flow_id_create: Tuint32_t; cdecl; external librist;
function rist_sender_create(ctx: PPrist_ctx; profile: Trist_profile; flow_id: Tuint32_t; logging_settings: Prist_logging_settings): longint; cdecl; external librist;
function rist_sender_npd_enable(ctx: Prist_ctx): longint; cdecl; external librist;
function rist_sender_npd_disable(ctx: Prist_ctx): longint; cdecl; external librist;
function rist_sender_flow_id_get(ctx: Prist_ctx; flow_id: Puint32_t): longint; cdecl; external librist;
function rist_sender_flow_id_set(ctx: Prist_ctx; flow_id: Tuint32_t): longint; cdecl; external librist;
function rist_sender_data_write(ctx: Prist_ctx; data_block: Prist_data_block): longint; cdecl; external librist;

// === Konventiert am: 15-8-26 19:16:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
