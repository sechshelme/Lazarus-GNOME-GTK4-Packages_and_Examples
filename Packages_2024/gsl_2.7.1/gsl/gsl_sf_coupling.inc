{$IFDEF read_interface}


function gsl_sf_coupling_3j_e(two_ja: longint; two_jb: longint; two_jc: longint; two_ma: longint; two_mb: longint;
  two_mc: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coupling_3j(two_ja: longint; two_jb: longint; two_jc: longint; two_ma: longint; two_mb: longint;
  two_mc: longint): double; cdecl; external libgsl;
function gsl_sf_coupling_6j_e(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coupling_6j(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint): double; cdecl; external libgsl;
function gsl_sf_coupling_RacahW_e(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coupling_RacahW(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint): double; cdecl; external libgsl;
function gsl_sf_coupling_9j_e(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint; two_jg: longint; two_jh: longint; two_ji: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl;
function gsl_sf_coupling_9j(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint; two_jg: longint; two_jh: longint; two_ji: longint): double; cdecl; external libgsl;

function gsl_sf_coupling_6j_INCORRECT_e(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint; result: Pgsl_sf_result): longint; cdecl; external libgsl; deprecated;
function gsl_sf_coupling_6j_INCORRECT(two_ja: longint; two_jb: longint; two_jc: longint; two_jd: longint; two_je: longint;
  two_jf: longint): double; cdecl; external libgsl; deprecated;

  // === Konventiert am: 22-8-25 14:04:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
