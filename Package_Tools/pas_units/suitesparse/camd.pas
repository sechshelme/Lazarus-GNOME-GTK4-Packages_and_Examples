unit camd;

interface

uses
  fp_suitesparse, SuiteSparse_config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function camd_order(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; P: Pint32_t; Control: Pdouble;
  Info: Pdouble; C: Pint32_t): longint; cdecl; external libcamd;
function camd_l_order(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; P: Pint64_t; Control: Pdouble;
  Info: Pdouble; C: Pint64_t): longint; cdecl; external libcamd;

procedure camd_2(n: Tint32_t; Pe: Pint32_t; Iw: Pint32_t; Len: Pint32_t; iwlen: Tint32_t;
  pfree: Tint32_t; Nv: Pint32_t; Next: Pint32_t; Last: Pint32_t; Head: Pint32_t;
  Elen: Pint32_t; Degree: Pint32_t; W: Pint32_t; Control: Pdouble; Info: Pdouble;
  C: Pint32_t; BucketSet: Pint32_t); cdecl; external libcamd;
procedure camd_l2(n: Tint64_t; Pe: Pint64_t; Iw: Pint64_t; Len: Pint64_t; iwlen: Tint64_t;
  pfree: Tint64_t; Nv: Pint64_t; Next: Pint64_t; Last: Pint64_t; Head: Pint64_t;
  Elen: Pint64_t; Degree: Pint64_t; W: Pint64_t; Control: Pdouble; Info: Pdouble;
  C: Pint64_t; BucketSet: Pint64_t); cdecl; external libcamd;

function camd_valid(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t): longint; cdecl; external libcamd;
function camd_l_valid(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t): longint; cdecl; external libcamd;

function camd_cvalid(n: Tint32_t; C: Pint32_t): longint; cdecl; external libcamd;
function camd_l_cvalid(n: Tint64_t; C: Pint64_t): longint; cdecl; external libcamd;

procedure camd_defaults(Control: Pdouble); cdecl; external libcamd;
procedure camd_l_defaults(Control: Pdouble); cdecl; external libcamd;
procedure camd_control(Control: Pdouble); cdecl; external libcamd;
procedure camd_l_control(Control: Pdouble); cdecl; external libcamd;
procedure camd_info(Info: Pdouble); cdecl; external libcamd;
procedure camd_l_info(Info: Pdouble); cdecl; external libcamd;
procedure camd_version(version: Plongint); cdecl; external libcamd;

const
  CAMD_CONTROL_ = 5;
  CAMD_INFO_ = 20;
  CAMD_DENSE = 0;
  CAMD_AGGRESSIVE = 1;
  CAMD_DEFAULT_DENSE = 10.0;
  CAMD_DEFAULT_AGGRESSIVE = 1;
  CAMD_STATUS = 0;
  CAMD_N = 1;
  CAMD_NZ = 2;
  CAMD_SYMMETRY = 3;
  CAMD_NZDIAG = 4;
  CAMD_NZ_A_PLUS_AT = 5;
  CAMD_NDENSE = 6;
  CAMD_MEMORY = 7;
  CAMD_NCMPA = 8;
  CAMD_LNZ = 9;
  CAMD_NDIV = 10;
  CAMD_NMULTSUBS_LDL = 11;
  CAMD_NMULTSUBS_LU = 12;
  CAMD_DMAX = 13;
  CAMD_OK = 0;
  CAMD_OUT_OF_MEMORY = -(1);
  CAMD_INVALID = -(2);
  CAMD_OK_BUT_JUMBLED = 1;
  CAMD_DATE = 'Jan 10, 2024';
  CAMD_MAIN_VERSION = 3;
  CAMD_SUB_VERSION = 3;
  CAMD_SUBSUB_VERSION = 1;

function CAMD_VERSION_CODE(main, sub: longint): longint;
function CAMD_VERSION: longint;


// === Konventiert am: 4-11-25 19:28:22 ===


implementation


function CAMD_VERSION_CODE(main, sub: longint): longint;
begin
  CAMD_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function CAMD_VERSION: longint;
begin
  CAMD_VERSION := CAMD_VERSION_CODE(3, 3);
end;


end.
