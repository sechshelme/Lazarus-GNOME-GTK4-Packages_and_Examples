  {$IFDEF read_interface}


function epoxy_has_egl_extension(dpy: TEGLDisplay; extension: pchar): Tbool; cdecl; external libepoxy;
function epoxy_egl_version(dpy: TEGLDisplay): longint; cdecl; external libepoxy;
function epoxy_has_egl: Tbool; cdecl; external libepoxy;

// === Konventiert am: 4-5-26 15:03:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
