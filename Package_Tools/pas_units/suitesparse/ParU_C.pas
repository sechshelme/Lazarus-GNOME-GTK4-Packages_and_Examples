unit ParU_C;

interface

uses
  fp_suitesparse, ParU_definitions, cholmod;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TParU_C_Control_struct = record
    mem_chunk: Tint64_t;
    umfpack_ordering: Tint64_t;
    umfpack_strategy: Tint64_t;
    umfpack_default_singleton: Tint64_t;
    relaxed_amalgamation_threshold: Tint64_t;
    scale: Tint64_t;
    panel_width: Tint64_t;
    paru_strategy: Tint64_t;
    piv_toler: double;
    diag_toler: double;
    trivial: Tint64_t;
    worthwhile_dgemm: Tint64_t;
    worthwhile_trsm: Tint64_t;
    paru_max_threads: Tint32_t;
  end;
  PParU_C_Control_struct = ^TParU_C_Control_struct;

  TParU_C_Control = TParU_C_Control_struct;
  PParU_C_Control = ^TParU_C_Control;

  TParU_C_Symbolic_struct = record
    m: Tint64_t;
    n: Tint64_t;
    anz: Tint64_t;
    Qfill: Pint64_t;
    sym_handle: pointer;
  end;
  PParU_C_Symbolic_struct = ^TParU_C_Symbolic_struct;

  TParU_C_Symbolic = TParU_C_Symbolic_struct;
  PParU_C_Symbolic = ^TParU_C_Symbolic;
  PPParU_C_Symbolic = ^PParU_C_Symbolic;

  TParU_C_Numeric_struct = record
    rcond: double;
    Pfin: Pint64_t;
    Rs: Pdouble;
    num_handle: pointer;
  end;
  PParU_C_Numeric_struct = ^TParU_C_Numeric_struct;

  TParU_C_Numeric = TParU_C_Numeric_struct;
  PParU_C_Numeric = ^TParU_C_Numeric;
  PPParU_C_Numeric = ^PParU_C_Numeric;

function ParU_C_Version(ver: Plongint; date: pchar): TParU_Ret; cdecl; external libparu;
function ParU_C_Init_Control(Control_C: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Analyze(A: Pcholmod_sparse; Sym_handle: PPParU_C_Symbolic; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Factorize(A: Pcholmod_sparse; Sym: PParU_C_Symbolic; Num_handle: PPParU_C_Numeric; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Solve_Axx(Sym: PParU_C_Symbolic; Num: PParU_C_Numeric; b: Pdouble; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Solve_Axb(Sym: PParU_C_Symbolic; Num: PParU_C_Numeric; b: Pdouble; x: Pdouble; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Solve_AXX(Sym: PParU_C_Symbolic; Num: PParU_C_Numeric; nrhs: Tint64_t; B: Pdouble; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Solve_AXB(Sym: PParU_C_Symbolic; Num: PParU_C_Numeric; nrhs: Tint64_t; B: Pdouble; X: Pdouble;
  Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Residual_bAx(A: Pcholmod_sparse; x: Pdouble; b: Pdouble; m: Tint64_t; resid: Pdouble;
  anorm: Pdouble; xnorm: Pdouble; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Residual_BAX(A: Pcholmod_sparse; X: Pdouble; B: Pdouble; m: Tint64_t; nrhs: Tint64_t;
  resid: Pdouble; anorm: Pdouble; xnorm: Pdouble; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Freenum(Num_handle: PPParU_C_Numeric; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;
function ParU_C_Freesym(Sym_handle: PPParU_C_Symbolic; Control: PParU_C_Control): TParU_Ret; cdecl; external libparu;

// === Konventiert am: 4-11-25 19:29:16 ===


implementation



end.
