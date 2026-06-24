{$IFDEF read_interface}


function g_printf(format: Pgchar): Tgint; cdecl; varargs; external libglib2;
function g_fprintf(file_: PFILE; format: Pgchar): Tgint; cdecl; varargs; external libglib2;
function g_sprintf(_string: Pgchar; format: Pgchar): Tgint; cdecl; varargs; external libglib2;
function g_vprintf(format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vfprintf(file_: PFILE; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vsprintf(_string: Pgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;
function g_vasprintf(_string: PPgchar; format: Pgchar; args: Tva_list): Tgint; cdecl; external libglib2;

// === Konventiert am: 22-6-26 17:16:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
