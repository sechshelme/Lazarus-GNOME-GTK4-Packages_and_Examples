{$IFDEF read_interface}



function curl_mprintf(format: pchar): longint; cdecl; varargs; external libcurl;
function curl_mfprintf(fd: PFILE; format: pchar): longint; cdecl; varargs; external libcurl;
function curl_msprintf(buffer: pchar; format: pchar): longint; cdecl; varargs; external libcurl;
function curl_msnprintf(buffer: pchar; maxlength: Tsize_t; format: pchar): longint; cdecl; varargs; external libcurl;
function curl_mvprintf(format: pchar; args: Tva_list): longint; cdecl; external libcurl;
function curl_mvfprintf(fd: PFILE; format: pchar; args: Tva_list): longint; cdecl; external libcurl;
function curl_mvsprintf(buffer: pchar; format: pchar; args: Tva_list): longint; cdecl; external libcurl;
function curl_mvsnprintf(buffer: pchar; maxlength: Tsize_t; format: pchar; args: Tva_list): longint; cdecl; external libcurl;
function curl_maprintf(format: pchar): pchar; cdecl; varargs; external libcurl;
function curl_mvaprintf(format: pchar; args: Tva_list): pchar; cdecl; external libcurl;

// === Konventiert am: 12-7-25 13:50:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
