{$IFDEF read_interface}



function mgl_gauss_rnd: double; cdecl; external libmgl;
procedure mgl_fft_freq(freq: Pdouble; nn: longint); cdecl; external libmgl;
procedure mgl_strcls(str: pchar); cdecl; external libmgl;
function mgl_strpos(str: pchar; fnd: pchar): longint; cdecl; external libmgl;
function mgl_chrpos(str: pchar; fnd: char): longint; cdecl; external libmgl;
function mgl_fgetstr(fp: PFILE): pchar; cdecl; external libmgl;
procedure mgl_fgetpar(fp: PFILE; str: pchar; args: array of const); cdecl; external libmgl;
procedure mgl_fgetpar(fp: PFILE; str: pchar); cdecl; external libmgl;
function mgl_istrue(ch: char): longint; cdecl; external libmgl;
procedure mgl_test(str: pchar; args: array of const); cdecl; external libmgl;
procedure mgl_test(str: pchar); cdecl; external libmgl;
procedure mgl_info(str: pchar; args: array of const); cdecl; external libmgl;
procedure mgl_info(str: pchar); cdecl; external libmgl;
function mgl_next_data(fname: pchar; p: longint): PFILE; cdecl; external libmgl;
procedure mgl_fgetstr_mgl(enable: longint); cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
