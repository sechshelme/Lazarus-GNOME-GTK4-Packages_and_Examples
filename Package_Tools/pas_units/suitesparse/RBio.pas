unit RBio;

interface

uses
  fp_suitesparse, SuiteSparse_config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  _FILE_OFFSET_BITS = 64;

const
  RBIO_OK = 0;
  RBIO_CP_INVALID = -(1);
  RBIO_ROW_INVALID = -(2);
  RBIO_DUPLICATE = -(3);
  RBIO_EXTRANEOUS = -(4);
  RBIO_TYPE_INVALID = -(5);
  RBIO_DIM_INVALID = -(6);
  RBIO_JUMBLED = -(7);
  RBIO_ARG_ERROR = -(8);
  RBIO_OUT_OF_MEMORY = -(9);
  RBIO_MKIND_INVALID = -(10);
  RBIO_UNSUPPORTED = -(11);
  RBIO_HEADER_IOERROR = -(91);
  RBIO_CP_IOERROR = -(92);
  RBIO_ROW_IOERROR = -(93);
  RBIO_VALUE_IOERROR = -(94);
  RBIO_FILE_IOERROR = -(95);
  RBIO_DATE = 'Jan 10, 2024';
  RBIO_MAIN_VERSION = 4;
  RBIO_SUB_VERSION = 3;
  RBIO_SUBSUB_VERSION = 1;

function RBIO_VER_CODE(main, sub: longint): longint;
function RBIO_VERSION: longint;

function RBkind_i(nrow: Tint32_t; ncol: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; mkind_in: Tint32_t; mkind: Pint32_t; skind: Pint32_t; mtype: pchar;
  xmin: Pdouble; xmax: Pdouble; cp: Pint32_t): longint; cdecl; external librbio;
function RBkind(nrow: Tint64_t; ncol: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; mkind_in: Tint64_t; mkind: Pint64_t; skind: Pint64_t; mtype: pchar;
  xmin: Pdouble; xmax: Pdouble; cp: Pint64_t): longint; cdecl; external librbio;

function RBread_i(filename: pchar; build_upper: Tint32_t; zero_handling: Tint32_t; title: pchar; key: pchar;
  mtype: pchar; nrow: Pint32_t; ncol: Pint32_t; mkind: Pint32_t; skind: Pint32_t;
  asize: Pint32_t; znz: Pint32_t; Ap: PPint32_t; Ai: PPint32_t; Ax: PPdouble;
  Az: PPdouble; Zp: PPint32_t; Zi: PPint32_t): longint; cdecl; external librbio;
function RBread(filename: pchar; build_upper: Tint64_t; zero_handling: Tint64_t; title: pchar; key: pchar;
  mtype: pchar; nrow: Pint64_t; ncol: Pint64_t; mkind: Pint64_t; skind: Pint64_t;
  asize: Pint64_t; znz: Pint64_t; Ap: PPint64_t; Ai: PPint64_t; Ax: PPdouble;
  Az: PPdouble; Zp: PPint64_t; Zi: PPint64_t): longint; cdecl; external librbio;

function RBreadraw_i(filename: pchar; title: pchar; key: pchar; mtype: pchar; nrow: Pint32_t;
  ncol: Pint32_t; nnz: Pint32_t; nelnz: Pint32_t; mkind: Pint32_t; skind: Pint32_t;
  fem: Pint32_t; xsize: Pint32_t; p_Ap: PPint32_t; p_Ai: PPint32_t; p_Ax: PPdouble): longint; cdecl; external librbio;
function RBreadraw(filename: pchar; title: pchar; key: pchar; mtype: pchar; nrow: Pint64_t;
  ncol: Pint64_t; nnz: Pint64_t; nelnz: Pint64_t; mkind: Pint64_t; skind: Pint64_t;
  fem: Pint64_t; xsize: Pint64_t; p_Ap: PPint64_t; p_Ai: PPint64_t; p_Ax: PPdouble): longint; cdecl; external librbio;

function RBwrite_i(filename: pchar; title: pchar; key: pchar; nrow: Tint32_t; ncol: Tint32_t;
  Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Az: Pdouble; Zp: Pint32_t;
  Zi: Pint32_t; mkind_in: Tint32_t; mtype: pchar): longint; cdecl; external librbio;
function RBwrite(filename: pchar; title: pchar; key: pchar; nrow: Tint64_t; ncol: Tint64_t;
  Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Az: Pdouble; Zp: Pint64_t;
  Zi: Pint64_t; mkind_in: Tint64_t; mtype: pchar): longint; cdecl; external librbio;

procedure RBget_entry_i(mkind: Tint32_t; Ax: Pdouble; Az: Pdouble; p: Tint32_t; xr: Pdouble;
  xz: Pdouble); cdecl; external librbio;
procedure RBget_entry(mkind: Tint64_t; Ax: Pdouble; Az: Pdouble; p: Tint64_t; xr: Pdouble;
  xz: Pdouble); cdecl; external librbio;

procedure RBput_entry_i(mkind: Tint32_t; Ax: Pdouble; Az: Pdouble; p: Tint32_t; xr: double;
  xz: double); cdecl; external librbio;
procedure RBput_entry(mkind: Tint64_t; Ax: Pdouble; Az: Pdouble; p: Tint64_t; xr: double;
  xz: double); cdecl; external librbio;

function RBok_i(nrow: Tint32_t; ncol: Tint32_t; nzmax: Tint32_t; Ap: Pint32_t; Ai: Pint32_t;
  Ax: Pdouble; Az: Pdouble; As_: pchar; mkind: Tint32_t; p_njumbled: Pint32_t;
  p_nzeros: Pint32_t): longint; cdecl; external librbio;
function RBok(nrow: Tint64_t; ncol: Tint64_t; nzmax: Tint64_t; Ap: Pint64_t; Ai: Pint64_t;
  Ax: Pdouble; Az: Pdouble; As_: pchar; mkind: Tint64_t; p_njumbled: Pint64_t;
  p_nzeros: Pint64_t): longint; cdecl; external librbio;

procedure RBerror(status: longint); cdecl; external librbio;
procedure RBio_version(version: Plongint); cdecl; external librbio;

// === Konventiert am: 4-11-25 19:29:22 ===


implementation


function RBIO_VER_CODE(main, sub: longint): longint;
begin
  RBIO_VER_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function RBIO_VERSION: longint;
begin
  RBIO_VERSION := RBIO_VER_CODE(4, 3);
end;


end.
