  {$IFDEF read_interface}



{$ifdef linux}
function epoxy_has_glx_extension(dpy: PDisplay; screen: longint; extension: pchar): Tbool; cdecl; external libepoxy;
function epoxy_glx_version(dpy: PDisplay; screen: longint): longint; cdecl; external libepoxy;
function epoxy_has_glx(dpy: PDisplay): Tbool; cdecl; external libepoxy;
{$endif}

// === Konventiert am: 4-5-26 15:03:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
