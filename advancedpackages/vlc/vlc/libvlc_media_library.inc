{$IFDEF read_interface}

type
  Plibvlc_media_library_t = type Pointer;

function libvlc_media_library_new(p_instance: Plibvlc_instance_t): Plibvlc_media_library_t; cdecl; external libvlc;
procedure libvlc_media_library_release(p_mlib: Plibvlc_media_library_t); cdecl; external libvlc;
procedure libvlc_media_library_retain(p_mlib: Plibvlc_media_library_t); cdecl; external libvlc;
function libvlc_media_library_load(p_mlib: Plibvlc_media_library_t): longint; cdecl; external libvlc;
function libvlc_media_library_media_list(p_mlib: Plibvlc_media_library_t): Plibvlc_media_list_t; cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
