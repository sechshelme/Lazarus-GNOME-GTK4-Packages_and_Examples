unit ccolamd;

interface

uses
  fp_suitesparse, SuiteSparse_config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CCOLAMD_DATE = 'Jan 20, 2024';
  CCOLAMD_MAIN_VERSION = 3;
  CCOLAMD_SUB_VERSION = 3;
  CCOLAMD_SUBSUB_VERSION = 2;

function CCOLAMD_VERSION_CODE(main, sub: longint): longint;
function CCOLAMD_VERSION: longint;

const
  CCOLAMD_KNOBS = 20;
  CCOLAMD_STATS = 20;
  CCOLAMD_DENSE_ROW = 0;
  CCOLAMD_DENSE_COL = 1;
  CCOLAMD_AGGRESSIVE = 2;
  CCOLAMD_LU = 3;
  CCOLAMD_DEFRAG_COUNT = 2;
  CCOLAMD_STATUS = 3;
  CCOLAMD_INFO2 = 5;
  CCOLAMD_INFO3 = 6;
  CCOLAMD_EMPTY_ROW = 7;
  CCOLAMD_EMPTY_COL = 8;
  CCOLAMD_NEWLY_EMPTY_ROW = 9;
  CCOLAMD_NEWLY_EMPTY_COL = 10;
  CCOLAMD_OK = 0;
  CCOLAMD_OK_BUT_JUMBLED = 1;
  CCOLAMD_ERROR_A_not_present = -(1);
  CCOLAMD_ERROR_p_not_present = -(2);
  CCOLAMD_ERROR_nrow_negative = -(3);
  CCOLAMD_ERROR_ncol_negative = -(4);
  CCOLAMD_ERROR_nnz_negative = -(5);
  CCOLAMD_ERROR_p0_nonzero = -(6);
  CCOLAMD_ERROR_A_too_small = -(7);
  CCOLAMD_ERROR_col_length_negative = -(8);
  CCOLAMD_ERROR_row_index_out_of_bounds = -(9);
  CCOLAMD_ERROR_out_of_memory = -(10);
  CCOLAMD_ERROR_invalid_cmember = -(11);
  CCOLAMD_ERROR_internal_error = -(999);

function ccolamd_recommended(nnz: longint; n_row: longint; n_col: longint): Tsize_t; cdecl; external libccolamd;
function ccolamd_l_recommended(nnz: Tint64_t; n_row: Tint64_t; n_col: Tint64_t): Tsize_t; cdecl; external libccolamd;
procedure ccolamd_set_defaults(knobs: Pdouble); cdecl; external libccolamd;
procedure ccolamd_l_set_defaults(knobs: Pdouble); cdecl; external libccolamd;
function ccolamd(n_row: longint; n_col: longint; Alen: longint; A: Plongint; p: Plongint;
  knobs: Pdouble; stats: Plongint; cmember: Plongint): longint; cdecl; external libccolamd;
function ccolamd_l(n_row: Tint64_t; n_col: Tint64_t; Alen: Tint64_t; A: Pint64_t; p: Pint64_t;
  knobs: Pdouble; stats: Pint64_t; cmember: Pint64_t): longint; cdecl; external libccolamd;

type
  Tcsymamd_func = function(para1: Tsize_t; para2: Tsize_t): pointer;
  Tcsymamd_func2 = procedure(para1: pointer);

function csymamd(n: longint; A: Plongint; p: Plongint; perm: Plongint; knobs: Pdouble;
  stats: Plongint; allocate: Tcsymamd_func; release: Tcsymamd_func2; cmember: Plongint; stype: longint): longint; cdecl; external libccolamd;
function csymamd_l(n: Tint64_t; A: Pint64_t; p: Pint64_t; perm: Pint64_t; knobs: Pdouble;
  stats: Pint64_t; allocate: Tcsymamd_func; release: Tcsymamd_func2; cmember: Pint64_t; stype: Tint64_t): longint; cdecl; external libccolamd;
procedure ccolamd_report(stats: Plongint); cdecl; external libccolamd;
procedure ccolamd_l_report(stats: Pint64_t); cdecl; external libccolamd;
procedure csymamd_report(stats: Plongint); cdecl; external libccolamd;
procedure csymamd_l_report(stats: Pint64_t); cdecl; external libccolamd;
procedure ccolamd_version(version: Plongint); cdecl; external libccolamd;

function ccolamd2(n_row: longint; n_col: longint; Alen: longint; A: Plongint; p: Plongint;
  knobs: Pdouble; stats: Plongint; Front_npivcol: Plongint; Front_nrows: Plongint; Front_ncols: Plongint;
  Front_parent: Plongint; Front_cols: Plongint; p_nfr: Plongint; InFront: Plongint; cmember: Plongint): longint; cdecl; external libccolamd;
function ccolamd2_l(n_row: Tint64_t; n_col: Tint64_t; Alen: Tint64_t; A: Pint64_t; p: Pint64_t;
  knobs: Pdouble; stats: Pint64_t; Front_npivcol: Pint64_t; Front_nrows: Pint64_t; Front_ncols: Pint64_t;
  Front_parent: Pint64_t; Front_cols: Pint64_t; p_nfr: Pint64_t; InFront: Pint64_t; cmember: Pint64_t): longint; cdecl; external libccolamd;
procedure ccolamd_apply_order(Front: Plongint; Order: Plongint; Temp: Plongint; nn: longint; nfr: longint); cdecl; external libccolamd;
procedure ccolamd_l_apply_order(Front: Pint64_t; Order: Pint64_t; Temp: Pint64_t; nn: Tint64_t; nfr: Tint64_t); cdecl; external libccolamd;
procedure ccolamd_fsize(nn: longint; MaxFsize: Plongint; Fnrows: Plongint; Fncols: Plongint; Parent: Plongint;
  Npiv: Plongint); cdecl; external libccolamd;
procedure ccolamd_l_fsize(nn: Tint64_t; MaxFsize: Pint64_t; Fnrows: Pint64_t; Fncols: Pint64_t; Parent: Pint64_t;
  Npiv: Pint64_t); cdecl; external libccolamd;
procedure ccolamd_postorder(nn: longint; Parent: Plongint; Npiv: Plongint; Fsize: Plongint; Order: Plongint;
  Child: Plongint; Sibling: Plongint; Stack: Plongint; Front_cols: Plongint; cmember: Plongint); cdecl; external libccolamd;
procedure ccolamd_l_postorder(nn: Tint64_t; Parent: Pint64_t; Npiv: Pint64_t; Fsize: Pint64_t; Order: Pint64_t;
  Child: Pint64_t; Sibling: Pint64_t; Stack: Pint64_t; Front_cols: Pint64_t; cmember: Pint64_t); cdecl; external libccolamd;
function ccolamd_post_tree(root: longint; k: longint; Child: Plongint; Sibling: Plongint; Order: Plongint;
  Stack: Plongint): longint; cdecl; external libccolamd;
function ccolamd_l_post_tree(root: Tint64_t; k: Tint64_t; Child: Pint64_t; Sibling: Pint64_t; Order: Pint64_t;
  Stack: Pint64_t): Tint64_t; cdecl; external libccolamd;

// === Konventiert am: 4-11-25 19:28:27 ===


implementation


function CCOLAMD_VERSION_CODE(main, sub: longint): longint;
begin
  CCOLAMD_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function CCOLAMD_VERSION: longint;
begin
  CCOLAMD_VERSION := CCOLAMD_VERSION_CODE(3, 3);
end;


end.
