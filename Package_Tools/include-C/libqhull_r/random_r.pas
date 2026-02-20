unit random_r;

interface

uses
  fp_qhull_r, libqhull_r_, user_r;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  qhDEFrandom = 1;

function qh_argv_to_command(argc: longint; argv: PPchar; command: pchar; max_size: longint): longint; cdecl; external libqhull_r;
function qh_argv_to_command_size(argc: longint; argv: PPchar): longint; cdecl; external libqhull_r;
function qh_rand(qh: PqhT): longint; cdecl; external libqhull_r;
procedure qh_srand(qh: PqhT; seed: longint); cdecl; external libqhull_r;
function qh_randomfactor(qh: PqhT; scale: TrealT; offset: TrealT): TrealT; cdecl; external libqhull_r;
procedure qh_randommatrix(qh: PqhT; buffer: PrealT; dim: longint; row: PPrealT); cdecl; external libqhull_r;
function qh_strtol(s: pchar; endp: PPchar): longint; cdecl; external libqhull_r;
function qh_strtod(s: pchar; endp: PPchar): double; cdecl; external libqhull_r;

// === Konventiert am: 19-2-26 17:34:09 ===


implementation



end.
