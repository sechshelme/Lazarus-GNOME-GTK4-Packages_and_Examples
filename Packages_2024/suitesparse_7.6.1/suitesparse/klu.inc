{$IFDEF read_interface}


type
  Tklu_symbolic = record
    symmetry: double;
    est_flops: double;
    lnz: double;
    unz: double;
    Lnz_: Pdouble;
    n: Tint32_t;
    nz: Tint32_t;
    P: Pint32_t;
    Q: Pint32_t;
    R: Pint32_t;
    nzoff: Tint32_t;
    nblocks: Tint32_t;
    maxblock: Tint32_t;
    ordering: Tint32_t;
    do_btf: Tint32_t;
    structural_rank: Tint32_t;
  end;
  Pklu_symbolic = ^Tklu_symbolic;
  PPklu_symbolic = ^Pklu_symbolic;

  Tklu_l_symbolic = record
    symmetry: double;
    est_flops: double;
    lnz: double;
    unz: double;
    Lnz_: Pdouble;
    n: Tint64_t;
    nz: Tint64_t;
    P: Pint64_t;
    Q: Pint64_t;
    R: Pint64_t;
    nzoff: Tint64_t;
    nblocks: Tint64_t;
    maxblock: Tint64_t;
    ordering: Tint64_t;
    do_btf: Tint64_t;
    structural_rank: Tint64_t;
  end;
  Pklu_l_symbolic = ^Tklu_l_symbolic;
  PPklu_l_symbolic = ^Pklu_l_symbolic;

  Tklu_numeric = record
    n: Tint32_t;
    nblocks: Tint32_t;
    lnz: Tint32_t;
    unz: Tint32_t;
    max_lnz_block: Tint32_t;
    max_unz_block: Tint32_t;
    Pnum: Pint32_t;
    Pinv: Pint32_t;
    Lip: Pint32_t;
    Uip: Pint32_t;
    Llen: Pint32_t;
    Ulen: Pint32_t;
    LUbx: ^pointer;
    LUsize: Psize_t;
    Udiag: pointer;
    Rs: Pdouble;
    worksize: Tsize_t;
    Work: pointer;
    Xwork: pointer;
    Iwork: Pint32_t;
    Offp: Pint32_t;
    Offi: Pint32_t;
    Offx: pointer;
    nzoff: Tint32_t;
  end;
  Pklu_numeric = ^Tklu_numeric;
  PPklu_numeric = ^Pklu_numeric;

  Tklu_l_numeric = record
    n: Tint64_t;
    nblocks: Tint64_t;
    lnz: Tint64_t;
    unz: Tint64_t;
    max_lnz_block: Tint64_t;
    max_unz_block: Tint64_t;
    Pnum: Pint64_t;
    Pinv: Pint64_t;
    Lip: Pint64_t;
    Uip: Pint64_t;
    Llen: Pint64_t;
    Ulen: Pint64_t;
    LUbx: ^pointer;
    LUsize: Psize_t;
    Udiag: pointer;
    Rs: Pdouble;
    worksize: Tsize_t;
    Work: pointer;
    Xwork: pointer;
    Iwork: Pint64_t;
    Offp: Pint64_t;
    Offi: Pint64_t;
    Offx: pointer;
    nzoff: Tint64_t;
  end;
  Pklu_l_numeric = ^Tklu_l_numeric;
  PPklu_l_numeric = ^Pklu_l_numeric;

const
  KLU_OK = 0;
  KLU_SINGULAR = 1;
  KLU_OUT_OF_MEMORY = -(2);
  KLU_INVALID = -(3);
  KLU_TOO_LARGE = -(4);

type
  Pklu_common = ^Tklu_common;

  Tklu_common = record
    tol: double;
    memgrow: double;
    initmem_amd: double;
    initmem: double;
    maxwork: double;
    btf: longint;
    ordering: longint;
    scale: longint;
    user_order: function(para1: Tint32_t; para2: Pint32_t; para3: Pint32_t; para4: Pint32_t; para5: Pklu_common): Tint32_t; cdecl;
    user_data: pointer;
    halt_if_singular: longint;
    status: longint;
    nrealloc: longint;
    structural_rank: Tint32_t;
    numerical_rank: Tint32_t;
    singular_col: Tint32_t;
    noffdiag: Tint32_t;
    flops: double;
    rcond: double;
    condest: double;
    rgrowth: double;
    work: double;
    memusage: Tsize_t;
    mempeak: Tsize_t;
  end;

  Pklu_l_common = ^Tklu_l_common;

  Tklu_l_common = record
    tol: double;
    memgrow: double;
    initmem_amd: double;
    initmem: double;
    maxwork: double;
    btf: longint;
    ordering: longint;
    scale: longint;
    user_order: function(para1: Tint64_t; para2: Pint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pklu_l_common): Tint64_t; cdecl;
    user_data: pointer;
    halt_if_singular: longint;
    status: longint;
    nrealloc: longint;
    structural_rank: Tint64_t;
    numerical_rank: Tint64_t;
    singular_col: Tint64_t;
    noffdiag: Tint64_t;
    flops: double;
    rcond: double;
    condest: double;
    rgrowth: double;
    work: double;
    memusage: Tsize_t;
    mempeak: Tsize_t;
  end;

function klu_defaults(Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_defaults(Common: Pklu_l_common): longint; cdecl; external libklu;

function klu_analyze(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Common: Pklu_common): Pklu_symbolic; cdecl; external libklu;
function klu_l_analyze(para1: Tint64_t; para2: Pint64_t; para3: Pint64_t; Common: Pklu_l_common): Pklu_l_symbolic; cdecl; external libklu;

function klu_analyze_given(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; P: Pint32_t; Q: Pint32_t;
  Common: Pklu_common): Pklu_symbolic; cdecl; external libklu;
function klu_l_analyze_given(para1: Tint64_t; para2: Pint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pklu_l_common): Pklu_l_symbolic; cdecl; external libklu;

function klu_factor(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Common: Pklu_common): Pklu_numeric; cdecl; external libklu;
function klu_z_factor(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Common: Pklu_common): Pklu_numeric; cdecl; external libklu;
function klu_l_factor(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_common): Pklu_l_numeric; cdecl; external libklu;
function klu_zl_factor(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_common): Pklu_l_numeric; cdecl; external libklu;
function klu_solve(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; ldim: Tint32_t; nrhs: Tint32_t; B: Pdouble;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_solve(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; ldim: Tint32_t; nrhs: Tint32_t; B: Pdouble;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_solve(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Tint64_t; para4: Tint64_t; para5: Pdouble;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_solve(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Tint64_t; para4: Tint64_t; para5: Pdouble;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_tsolve(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; ldim: Tint32_t; nrhs: Tint32_t; B: Pdouble;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_tsolve(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; ldim: Tint32_t; nrhs: Tint32_t; B: Pdouble;
  conj_solve: longint; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_tsolve(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Tint64_t; para4: Tint64_t; para5: Pdouble;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_tsolve(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Tint64_t; para4: Tint64_t; para5: Pdouble;
  para6: longint; para7: Pklu_l_common): longint; cdecl; external libklu;

function klu_refactor(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_refactor(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_refactor(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_numeric;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_refactor(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_numeric;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_free_symbolic(Symbolic: PPklu_symbolic; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_free_symbolic(para1: PPklu_l_symbolic; para2: Pklu_l_common): longint; cdecl; external libklu;
function klu_free_numeric(Numeric: PPklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_free_numeric(Numeric: PPklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_free_numeric(para1: PPklu_l_numeric; para2: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_free_numeric(para1: PPklu_l_numeric; para2: Pklu_l_common): longint; cdecl; external libklu;

function klu_sort(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_sort(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_sort(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_sort(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;

function klu_flops(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_flops(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_flops(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_flops(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;

function klu_rgrowth(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_rgrowth(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_rgrowth(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_numeric;
  para6: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_rgrowth(para1: Pint64_t; para2: Pint64_t; para3: Pdouble; para4: Pklu_l_symbolic; para5: Pklu_l_numeric;
  para6: Pklu_l_common): longint; cdecl; external libklu;

function klu_condest(Ap: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_condest(Ap: Pint32_t; Ax: Pdouble; Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_condest(para1: Pint64_t; para2: Pdouble; para3: Pklu_l_symbolic; para4: Pklu_l_numeric; para5: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_condest(para1: Pint64_t; para2: Pdouble; para3: Pklu_l_symbolic; para4: Pklu_l_numeric; para5: Pklu_l_common): longint; cdecl; external libklu;

function klu_rcond(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_rcond(Symbolic: Pklu_symbolic; Numeric: Pklu_numeric; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_rcond(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_rcond(para1: Pklu_l_symbolic; para2: Pklu_l_numeric; para3: Pklu_l_common): longint; cdecl; external libklu;

function klu_scale(scale: longint; n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Rs: Pdouble; W: Pint32_t; Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_scale(scale: longint; n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Rs: Pdouble; W: Pint32_t; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_scale(para1: longint; para2: Tint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pdouble;
  para6: Pdouble; para7: Pint64_t; para8: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_scale(para1: longint; para2: Tint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pdouble;
  para6: Pdouble; para7: Pint64_t; para8: Pklu_l_common): longint; cdecl; external libklu;

function klu_extract(Numeric: Pklu_numeric; Symbolic: Pklu_symbolic; Lp: Pint32_t; Li: Pint32_t; Lx: Pdouble;
  Up: Pint32_t; Ui: Pint32_t; Ux: Pdouble; Fp: Pint32_t; Fi: Pint32_t;
  Fx: Pdouble; P: Pint32_t; Q: Pint32_t; Rs: Pdouble; R: Pint32_t;
  Common: Pklu_common): longint; cdecl; external libklu;
function klu_z_extract(Numeric: Pklu_numeric; Symbolic: Pklu_symbolic; Lp: Pint32_t; Li: Pint32_t; Lx: Pdouble;
  Lz: Pdouble; Up: Pint32_t; Ui: Pint32_t; Ux: Pdouble; Uz: Pdouble;
  Fp: Pint32_t; Fi: Pint32_t; Fx: Pdouble; Fz: Pdouble; P: Pint32_t;
  Q: Pint32_t; Rs: Pdouble; R: Pint32_t; Common: Pklu_common): longint; cdecl; external libklu;
function klu_l_extract(para1: Pklu_l_numeric; para2: Pklu_l_symbolic; para3: Pint64_t; para4: Pint64_t; para5: Pdouble;
  para6: Pint64_t; para7: Pint64_t; para8: Pdouble; para9: Pint64_t; para10: Pint64_t;
  para11: Pdouble; para12: Pint64_t; para13: Pint64_t; para14: Pdouble; para15: Pint64_t;
  para16: Pklu_l_common): longint; cdecl; external libklu;
function klu_zl_extract(para1: Pklu_l_numeric; para2: Pklu_l_symbolic; para3: Pint64_t; para4: Pint64_t; para5: Pdouble;
  para6: Pdouble; para7: Pint64_t; para8: Pint64_t; para9: Pdouble; para10: Pdouble;
  para11: Pint64_t; para12: Pint64_t; para13: Pdouble; para14: Pdouble; para15: Pint64_t;
  para16: Pint64_t; para17: Pdouble; para18: Pint64_t; para19: Pklu_l_common): longint; cdecl; external libklu;

function klu_malloc(n: Tsize_t; size: Tsize_t; Common: Pklu_common): pointer; cdecl; external libklu;
function klu_free(p: pointer; n: Tsize_t; size: Tsize_t; Common: Pklu_common): pointer; cdecl; external libklu;
function klu_realloc(nnew: Tsize_t; nold: Tsize_t; size: Tsize_t; p: pointer; Common: Pklu_common): pointer; cdecl; external libklu;
function klu_l_malloc(para1: Tsize_t; para2: Tsize_t; para3: Pklu_l_common): pointer; cdecl; external libklu;
function klu_l_free(para1: pointer; para2: Tsize_t; para3: Tsize_t; para4: Pklu_l_common): pointer; cdecl; external libklu;
function klu_l_realloc(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: pointer; para5: Pklu_l_common): pointer; cdecl; external libklu;
procedure klu_version(version: Plongint); cdecl; external libklu;

const
  KLU_DATE = 'Jan 20, 2024';
  KLU_MAIN_VERSION = 2;
  KLU_SUB_VERSION = 3;
  KLU_SUBSUB_VERSION = 2;

function KLU_VERSION_CODE(main, sub: longint): longint;
function KLU_VERSION: longint;

// === Konventiert am: 4-11-25 19:28:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function KLU_VERSION_CODE(main, sub: longint): longint;
begin
  KLU_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function KLU_VERSION: longint;
begin
  KLU_VERSION := KLU_VERSION_CODE(2, 3);
end;


{$ENDIF read_implementation}
