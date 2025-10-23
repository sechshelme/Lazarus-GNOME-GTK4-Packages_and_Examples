{$IFDEF read_interface}


function libvlc_media_list_new(p_instance: Plibvlc_instance_t): Plibvlc_media_list_t; cdecl; external libvlc;
procedure libvlc_media_list_release(p_ml: Plibvlc_media_list_t); cdecl; external libvlc;
procedure libvlc_media_list_retain(p_ml: Plibvlc_media_list_t); cdecl; external libvlc;
procedure libvlc_media_list_set_media(p_ml: Plibvlc_media_list_t; p_md: Plibvlc_media_t); cdecl; external libvlc;
function libvlc_media_list_media(p_ml: Plibvlc_media_list_t): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_list_add_media(p_ml: Plibvlc_media_list_t; p_md: Plibvlc_media_t): longint; cdecl; external libvlc;
function libvlc_media_list_insert_media(p_ml: Plibvlc_media_list_t; p_md: Plibvlc_media_t; i_pos: longint): longint; cdecl; external libvlc;
function libvlc_media_list_remove_index(p_ml: Plibvlc_media_list_t; i_pos: longint): longint; cdecl; external libvlc;
function libvlc_media_list_count(p_ml: Plibvlc_media_list_t): longint; cdecl; external libvlc;
function libvlc_media_list_item_at_index(p_ml: Plibvlc_media_list_t; i_pos: longint): Plibvlc_media_t; cdecl; external libvlc;
function libvlc_media_list_index_of_item(p_ml: Plibvlc_media_list_t; p_md: Plibvlc_media_t): longint; cdecl; external libvlc;
function libvlc_media_list_is_readonly(p_ml: Plibvlc_media_list_t): longint; cdecl; external libvlc;
procedure libvlc_media_list_lock(p_ml: Plibvlc_media_list_t); cdecl; external libvlc;
procedure libvlc_media_list_unlock(p_ml: Plibvlc_media_list_t); cdecl; external libvlc;
function libvlc_media_list_event_manager(p_ml: Plibvlc_media_list_t): Plibvlc_event_manager_t; cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
