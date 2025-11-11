{$IFDEF read_interface}


function amd_order(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; P: Pint32_t; Control: Pdouble; Info: Pdouble): longint; cdecl; external libamd;
function amd_l_order(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; P: Pint64_t; Control: Pdouble; Info: Pdouble): longint; cdecl; external libamd;

procedure amd_2(n: Tint32_t; Pe: Pint32_t; Iw: Pint32_t; Len: Pint32_t; iwlen: Tint32_t;
  pfree: Tint32_t; Nv: Pint32_t; Next: Pint32_t; Last: Pint32_t; Head: Pint32_t;
  Elen: Pint32_t; Degree: Pint32_t; W: Pint32_t; Control: Pdouble; Info: Pdouble); cdecl; external libamd;
procedure amd_l2(n: Tint64_t; Pe: Pint64_t; Iw: Pint64_t; Len: Pint64_t; iwlen: Tint64_t;
  pfree: Tint64_t; Nv: Pint64_t; Next: Pint64_t; Last: Pint64_t; Head: Pint64_t;
  Elen: Pint64_t; Degree: Pint64_t; W: Pint64_t; Control: Pdouble; Info: Pdouble); cdecl; external libamd;

function amd_valid(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t): longint; cdecl; external libamd;
function amd_l_valid(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t): longint; cdecl; external libamd;

procedure amd_defaults(Control: Pdouble); cdecl; external libamd;
procedure amd_l_defaults(Control: Pdouble); cdecl; external libamd;
procedure amd_control(Control: Pdouble); cdecl; external libamd;
procedure amd_l_control(Control: Pdouble); cdecl; external libamd;
procedure amd_info(Info: Pdouble); cdecl; external libamd;
procedure amd_l_info(Info: Pdouble); cdecl; external libamd;
procedure amd_version(version: Plongint); cdecl; external libamd;

const
  AMD_CONTROL_ = 5;
  AMD_INFO_ = 20;
  AMD_DENSE = 0;
  AMD_AGGRESSIVE = 1;
  AMD_DEFAULT_DENSE = 10.0;
  AMD_DEFAULT_AGGRESSIVE = 1;
  AMD_STATUS = 0;
  AMD_N = 1;
  AMD_NZ = 2;
  AMD_SYMMETRY = 3;
  AMD_NZDIAG = 4;
  AMD_NZ_A_PLUS_AT = 5;
  AMD_NDENSE = 6;
  AMD_MEMORY = 7;
  AMD_NCMPA = 8;
  AMD_LNZ = 9;
  AMD_NDIV = 10;
  AMD_NMULTSUBS_LDL = 11;
  AMD_NMULTSUBS_LU = 12;
  AMD_DMAX = 13;
  AMD_OK = 0;
  AMD_OUT_OF_MEMORY = -(1);
  AMD_INVALID = -(2);
  AMD_OK_BUT_JUMBLED = 1;

  AMD_DATE = 'Jan 10, 2024';
  AMD_MAIN_VERSION = 3;
  AMD_SUB_VERSION = 3;
  AMD_SUBSUB_VERSION = 1;

function AMD_VERSION_CODE(main, sub: longint): longint;
function AMD_VERSION: longint;


// === Konventiert am: 4-11-25 19:28:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function AMD_VERSION_CODE(main, sub: longint): longint;
begin
  AMD_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function AMD_VERSION: longint;
begin
  AMD_VERSION := AMD_VERSION_CODE(3, 3);
end;


{$ENDIF read_implementation}
