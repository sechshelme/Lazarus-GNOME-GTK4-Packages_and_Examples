{$IFDEF read_interface}


type
  TLDL_int = Tint64_t;

procedure ldl_version(version: Plongint); cdecl; external libldl;

procedure ldl_symbolic(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Lp: Pint32_t; Parent: Pint32_t;
  Lnz: Pint32_t; Flag: Pint32_t; P: Pint32_t; Pinv: Pint32_t); cdecl; external libldl;
function ldl_numeric(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Lp: Pint32_t;
  Parent: Pint32_t; Lnz: Pint32_t; Li: Pint32_t; Lx: Pdouble; D: Pdouble;
  Y: Pdouble; Pattern: Pint32_t; Flag: Pint32_t; P: Pint32_t; Pinv: Pint32_t): Tint32_t; cdecl; external libldl;
procedure ldl_lsolve(n: Tint32_t; X: Pdouble; Lp: Pint32_t; Li: Pint32_t; Lx: Pdouble); cdecl; external libldl;
procedure ldl_dsolve(n: Tint32_t; X: Pdouble; D: Pdouble); cdecl; external libldl;
procedure ldl_ltsolve(n: Tint32_t; X: Pdouble; Lp: Pint32_t; Li: Pint32_t; Lx: Pdouble); cdecl; external libldl;
procedure ldl_perm(n: Tint32_t; X: Pdouble; B: Pdouble; P: Pint32_t); cdecl; external libldl;
procedure ldl_permt(n: Tint32_t; X: Pdouble; B: Pdouble; P: Pint32_t); cdecl; external libldl;
function ldl_valid_perm(n: Tint32_t; P: Pint32_t; Flag: Pint32_t): Tint32_t; cdecl; external libldl;
function ldl_valid_matrix(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t): Tint32_t; cdecl; external libldl;

procedure ldl_l_symbolic(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Lp: Pint64_t; Parent: Pint64_t;
  Lnz: Pint64_t; Flag: Pint64_t; P: Pint64_t; Pinv: Pint64_t); cdecl; external libldl;
function ldl_l_numeric(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Lp: Pint64_t;
  Parent: Pint64_t; Lnz: Pint64_t; Li: Pint64_t; Lx: Pdouble; D: Pdouble;
  Y: Pdouble; Pattern: Pint64_t; Flag: Pint64_t; P: Pint64_t; Pinv: Pint64_t): Tint64_t; cdecl; external libldl;
procedure ldl_l_lsolve(n: Tint64_t; X: Pdouble; Lp: Pint64_t; Li: Pint64_t; Lx: Pdouble); cdecl; external libldl;
procedure ldl_l_dsolve(n: Tint64_t; X: Pdouble; D: Pdouble); cdecl; external libldl;
procedure ldl_l_ltsolve(n: Tint64_t; X: Pdouble; Lp: Pint64_t; Li: Pint64_t; Lx: Pdouble); cdecl; external libldl;
procedure ldl_l_perm(n: Tint64_t; X: Pdouble; B: Pdouble; P: Pint64_t); cdecl; external libldl;
procedure ldl_l_permt(n: Tint64_t; X: Pdouble; B: Pdouble; P: Pint64_t); cdecl; external libldl;
function ldl_l_valid_perm(n: Tint64_t; P: Pint64_t; Flag: Pint64_t): Tint64_t; cdecl; external libldl;
function ldl_l_valid_matrix(n: Tint64_t; Ap: Pint64_t; Ai: Pint64_t): Tint64_t; cdecl; external libldl;

const
  LDL_DATE = 'Jan 10, 2024';
  LDL_MAIN_VERSION = 3;
  LDL_SUB_VERSION = 3;
  LDL_SUBSUB_VERSION = 1;

function LDL_VERSION_CODE(main, sub: longint): longint;
function LDL_VERSION: longint;

// === Konventiert am: 4-11-25 19:29:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function LDL_VERSION_CODE(main, sub: longint): longint;
begin
  LDL_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function LDL_VERSION: longint;
begin
  LDL_VERSION := LDL_VERSION_CODE(3, 3);
end;


{$ENDIF read_implementation}
