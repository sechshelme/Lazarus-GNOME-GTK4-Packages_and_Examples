unit colamd;

interface

uses
  fp_suitesparse, SuiteSparse_config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  COLAMD_DATE = 'Jan 20, 2024';
  COLAMD_MAIN_VERSION = 3;
  COLAMD_SUB_VERSION = 3;
  COLAMD_SUBSUB_VERSION = 2;

function COLAMD_VERSION_CODE(main, sub: longint): longint;
function COLAMD_VERSION: longint;

const
  COLAMD_KNOBS = 20;
  COLAMD_STATS = 20;
  COLAMD_DENSE_ROW = 0;
  COLAMD_DENSE_COL = 1;
  COLAMD_AGGRESSIVE = 2;
  COLAMD_DEFRAG_COUNT = 2;
  COLAMD_STATUS = 3;
  COLAMD_INFO2 = 5;
  COLAMD_INFO3 = 6;
  COLAMD_OK = 0;
  COLAMD_OK_BUT_JUMBLED = 1;
  COLAMD_ERROR_A_not_present = -(1);
  COLAMD_ERROR_p_not_present = -(2);
  COLAMD_ERROR_nrow_negative = -(3);
  COLAMD_ERROR_ncol_negative = -(4);
  COLAMD_ERROR_nnz_negative = -(5);
  COLAMD_ERROR_p0_nonzero = -(6);
  COLAMD_ERROR_A_too_small = -(7);
  COLAMD_ERROR_col_length_negative = -(8);
  COLAMD_ERROR_row_index_out_of_bounds = -(9);
  COLAMD_ERROR_out_of_memory = -(10);
  COLAMD_ERROR_internal_error = -(999);

function colamd_recommended(nnz: Tint32_t; n_row: Tint32_t; n_col: Tint32_t): Tsize_t; cdecl; external libcolamd;
function colamd_l_recommended(nnz: Tint64_t; n_row: Tint64_t; n_col: Tint64_t): Tsize_t; cdecl; external libcolamd;
procedure colamd_set_defaults(knobs: Pdouble); cdecl; external libcolamd;
procedure colamd_l_set_defaults(knobs: Pdouble); cdecl; external libcolamd;
function colamd(n_row: Tint32_t; n_col: Tint32_t; Alen: Tint32_t; A: Pint32_t; p: Pint32_t;
  knobs: Pdouble; stats: Pint32_t): longint; cdecl; external libcolamd;
function colamd_l(n_row: Tint64_t; n_col: Tint64_t; Alen: Tint64_t; A: Pint64_t; p: Pint64_t;
  knobs: Pdouble; stats: Pint64_t): longint; cdecl; external libcolamd;

type
  Tsymamd_func = function(para1: Tsize_t; para2: Tsize_t): pointer;
  Tsymamd_func2 = procedure(para1: pointer);

function symamd(n: Tint32_t; A: Pint32_t; p: Pint32_t; perm: Pint32_t; knobs: Pdouble;
  stats: Pint32_t; allocate: Tsymamd_func; release: Tsymamd_func2): longint; cdecl; external libcolamd;
function symamd_l(n: Tint64_t; A: Pint64_t; p: Pint64_t; perm: Pint64_t; knobs: Pdouble;
  stats: Pint64_t; allocate: Tsymamd_func; release: Tsymamd_func2): longint; cdecl; external libcolamd;
procedure colamd_report(stats: Pint32_t); cdecl; external libcolamd;
procedure colamd_l_report(stats: Pint64_t); cdecl; external libcolamd;
procedure symamd_report(stats: Pint32_t); cdecl; external libcolamd;
procedure symamd_l_report(stats: Pint64_t); cdecl; external libcolamd;
procedure colamd_version(version: Plongint); cdecl; external libcolamd;

// === Konventiert am: 4-11-25 19:28:42 ===


implementation


function COLAMD_VERSION_CODE(main, sub: longint): longint;
begin
  COLAMD_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function COLAMD_VERSION: longint;
begin
  COLAMD_VERSION := COLAMD_VERSION_CODE(3, 3);
end;


end.
