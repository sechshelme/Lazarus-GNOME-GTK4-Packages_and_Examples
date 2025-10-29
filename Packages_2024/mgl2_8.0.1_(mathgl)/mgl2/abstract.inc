{$IFDEF read_interface}


  {----------------------------------------------------------------------------- }

type
  PmglDataA = Pointer;
  PmglNum = Pointer;

type
  PHMGL = ^THMGL;
  THMGL = pointer;

  PHMDT = ^THMDT;
  THMDT = pointer;

  PHADT = ^THADT;
  THADT = pointer;

  PHMEX = ^THMEX;
  THMEX = pointer;

  PHAEX = ^THAEX;
  THAEX = pointer;

  PHMPR = ^THMPR;
  THMPR = pointer;

  PHCDT = ^THCDT;
  THCDT = pointer;

function mgl_bsize(bsize: dword): dword; cdecl; external libmgl;
procedure mgl_srnd(seed: Tclong); cdecl; external libmgl;
function mgl_rnd: double; cdecl; external libmgl;
function mgl_rnd_: double; cdecl; external libmgl;
procedure mgl_data_set_name(dat: PmglDataA; name: pchar); cdecl; external libmgl;
procedure mgl_data_set_name_w(dat: PmglDataA; name: Pwchar_t); cdecl; external libmgl;
function mgl_data_get_name_w(dat: THCDT): Pwchar_t; cdecl; external libmgl;

type
  TDataSetFunc = procedure(para1: pointer); cdecl;

procedure mgl_data_set_func(dat: PmglDataA; func: TDataSetFunc; par: pointer); cdecl; external libmgl;
procedure mgl_data_set_id(d: PmglDataA; ids: pchar); cdecl; external libmgl;
function mgl_data_get_id(d: THCDT): pchar; cdecl; external libmgl;
procedure mgl_data_save(dat: THCDT; fname: pchar; ns: Tclong); cdecl; external libmgl;
procedure mgl_data_export(dat: THCDT; fname: pchar; scheme: pchar; v1: double; v2: double; ns: Tclong); cdecl; external libmgl;
procedure mgl_data_save_hdf(d: THCDT; fname: pchar; data: pchar; rewrite: longint); cdecl; external libmgl;
procedure mgl_dual_save_hdf(val: Tmdual; fname: pchar; data: pchar; rewrite: longint); cdecl; external libmgl;
procedure mgl_real_save_hdf(val: double; fname: pchar; data: pchar; rewrite: longint); cdecl; external libmgl;
procedure mgl_int_save_hdf(val: Tclong; fname: pchar; data: pchar; rewrite: longint); cdecl; external libmgl;
function mgl_data_info(dat: THCDT): pchar; cdecl; external libmgl;
function mgl_datas_hdf(fname: pchar; buf: pchar; size: Tclong): Tclong; cdecl; external libmgl;
function mgl_datas_hdf_str(fname: pchar): PPchar; cdecl; external libmgl;
function mgl_data_max(dat: THCDT): Tmreal; cdecl; external libmgl;
function mgl_data_neg_max(dat: THCDT): Tmreal; cdecl; external libmgl;
function mgl_data_min(dat: THCDT): Tmreal; cdecl; external libmgl;
function mgl_data_pos_min(dat: THCDT): Tmreal; cdecl; external libmgl;
function mgl_data_first(dat: THCDT; cond: pchar; i: Pclong; j: Pclong; k: Pclong): Tmreal; cdecl; external libmgl;
function mgl_data_last(dat: THCDT; cond: pchar; i: Pclong; j: Pclong; k: Pclong): Tmreal; cdecl; external libmgl;
function mgl_data_find(dat: THCDT; cond: pchar; dir: char; i: Tclong; j: Tclong; k: Tclong): Tclong; cdecl; external libmgl;
function mgl_data_find_any(dat: THCDT; cond: pchar): longint; cdecl; external libmgl;
function mgl_data_max_int(dat: THCDT; i: Pclong; j: Pclong; k: Pclong): Tmreal; cdecl; external libmgl;
function mgl_data_max_real(dat: THCDT; x: Pmreal; y: Pmreal; z: Pmreal): Tmreal; cdecl; external libmgl;
function mgl_data_min_int(dat: THCDT; i: Pclong; j: Pclong; k: Pclong): Tmreal; cdecl; external libmgl;
function mgl_data_min_real(dat: THCDT; x: Pmreal; y: Pmreal; z: Pmreal): Tmreal; cdecl; external libmgl;
function mgl_data_momentum_val(d: THCDT; dir: char; m: Pmreal; w: Pmreal; s: Pmreal; k: Pmreal): Tmreal; cdecl; external libmgl;
function mgl_data_max_first(d: THCDT; dir: char; from: Tclong; p1: Pclong; p2: Pclong): Tclong; cdecl; external libmgl;
function mgl_data_linear(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal): Tmreal; cdecl; external libmgl;
function mgl_data_linear_ext(dat: THCDT; x: Tmreal; y: Tmreal; z: Tmreal; dx: Pmreal; dy: Pmreal; dz: Pmreal): Tmreal; cdecl; external libmgl;
procedure mgl_mutex_lock(para1: pointer); cdecl; external libmgl;
procedure mgl_mutex_unlock(para1: pointer); cdecl; external libmgl;

function mgl_create_expr(expr: pchar): THMEX; cdecl; external libmgl;
procedure mgl_delete_expr(ex: THMEX); cdecl; external libmgl;
function mgl_expr_eval(ex: THMEX; x: double; y: double; z: double): double; cdecl; external libmgl;
function mgl_expr_eval_v(ex: THMEX; vars: Pmreal): double; cdecl; external libmgl;
function mgl_expr_diff(ex: THMEX; dir: char; x: double; y: double; z: double): double; cdecl; external libmgl;
function mgl_expr_diff_v(ex: THMEX; dir: char; vars: Pmreal): double; cdecl; external libmgl;

function mgl_create_cexpr(expr: pchar): THAEX; cdecl; external libmgl;
procedure mgl_delete_cexpr(ex: THAEX); cdecl; external libmgl;
function mgl_cexpr_eval(ex: THAEX; x: Tmdual; y: Tmdual; z: Tmdual): Tcmdual; cdecl; external libmgl;
function mgl_cexpr_eval_v(ex: THAEX; vars: Pmdual): Tcmdual; cdecl; external libmgl;

var
  mgl_ask_func: procedure(quest: Pwchar_t; res: Pwchar_t); cvar;external libmgl;

procedure mgl_ask_gets(quest: Pwchar_t; res: Pwchar_t); cdecl; external libmgl;

var
  mgl_progress_func: procedure(value: longint; maximal: longint; gr: THMGL); cvar;external libmgl;

procedure mgl_progress_txt(value: longint; maximal: longint; gr: THMGL); cdecl; external libmgl;
procedure mgl_progress(value: longint; maximal: longint; gr: THMGL); cdecl; external libmgl;

// === Konventiert am: 25-6-25 19:52:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
