{$IFDEF read_interface}


var
  mglFitPnts: longint; cvar;external libmgl;
  mglFitRes: array[0..1023] of char; cvar;external libmgl;

function mgl_fit_1(gr: THMGL; y: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_2(gr: THMGL; z: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_3(gr: THMGL; a: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xy(gr: THMGL; x: THCDT; y: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xyza(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_ys(gr: THMGL; y: THCDT; s: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xys(gr: THMGL; x: THCDT; y: THCDT; s: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xyzs(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; s: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_fit_xyzas(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; s: THCDT; eq: pchar; vars: pchar; ini: THMDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_get_fit(gr: THMGL): pchar; cdecl; external libmgl;
function mgl_hist_x(gr: THMGL; x: THCDT; a: THCDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_hist_xy(gr: THMGL; x: THCDT; y: THCDT; a: THCDT; opt: pchar): THMDT; cdecl; external libmgl;
function mgl_hist_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; a: THCDT; opt: pchar): THMDT; cdecl; external libmgl;
procedure mgl_puts_fit(gr: THMGL; x: double; y: double; z: double; prefix: pchar; font: pchar; size: double); cdecl; external libmgl;
function mgl_get_fit_chi: Tmreal; cdecl; external libmgl;
function mgl_get_fit_covar: THCDT; cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
