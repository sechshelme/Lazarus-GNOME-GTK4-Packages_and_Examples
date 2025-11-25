{$IFDEF read_interface}


const
  UMFPACK_INFO = 90;
  UMFPACK_CONTROL = 20;
  UMFPACK_DATE = 'Jan 20, 2024';
  UMFPACK_MAIN_VERSION = 6;
  UMFPACK_SUB_VERSION = 3;
  UMFPACK_SUBSUB_VERSION = 2;

function UMFPACK_VER_CODE(main, sub: longint): longint;
function UMFPACK_VER: longint;

const
  UMFPACK_STATUS = 0;
  UMFPACK_NROW = 1;
  UMFPACK_NCOL = 16;
  UMFPACK_NZ = 2;
  UMFPACK_SIZE_OF_UNIT = 3;
  UMFPACK_SIZE_OF_INT = 4;
  UMFPACK_SIZE_OF_LONG = 5;
  UMFPACK_SIZE_OF_POINTER = 6;
  UMFPACK_SIZE_OF_ENTRY = 7;
  UMFPACK_NDENSE_ROW = 8;
  UMFPACK_NEMPTY_ROW = 9;
  UMFPACK_NDENSE_COL = 10;
  UMFPACK_NEMPTY_COL = 11;
  UMFPACK_SYMBOLIC_DEFRAG = 12;
  UMFPACK_SYMBOLIC_PEAK_MEMORY = 13;
  UMFPACK_SYMBOLIC_SIZE = 14;
  UMFPACK_SYMBOLIC_TIME = 15;
  UMFPACK_SYMBOLIC_WALLTIME = 17;
  UMFPACK_STRATEGY_USED = 18;
  UMFPACK_ORDERING_USED = 19;
  UMFPACK_QFIXED = 31;
  UMFPACK_DIAG_PREFERRED = 32;
  UMFPACK_PATTERN_SYMMETRY = 33;
  UMFPACK_NZ_A_PLUS_AT = 34;
  UMFPACK_NZDIAG = 35;
  UMFPACK_SYMMETRIC_LUNZ = 36;
  UMFPACK_SYMMETRIC_FLOPS = 37;
  UMFPACK_SYMMETRIC_NDENSE = 38;
  UMFPACK_SYMMETRIC_DMAX = 39;
  UMFPACK_COL_SINGLETONS = 56;
  UMFPACK_ROW_SINGLETONS = 57;
  UMFPACK_N2 = 58;
  UMFPACK_S_SYMMETRIC = 59;
  UMFPACK_NUMERIC_SIZE_ESTIMATE = 20;
  UMFPACK_PEAK_MEMORY_ESTIMATE = 21;
  UMFPACK_FLOPS_ESTIMATE = 22;
  UMFPACK_LNZ_ESTIMATE = 23;
  UMFPACK_UNZ_ESTIMATE = 24;
  UMFPACK_VARIABLE_INIT_ESTIMATE = 25;
  UMFPACK_VARIABLE_PEAK_ESTIMATE = 26;
  UMFPACK_VARIABLE_FINAL_ESTIMATE = 27;
  UMFPACK_MAX_FRONT_SIZE_ESTIMATE = 28;
  UMFPACK_MAX_FRONT_NROWS_ESTIMATE = 29;
  UMFPACK_MAX_FRONT_NCOLS_ESTIMATE = 30;
  UMFPACK_NUMERIC_SIZE = 40;
  UMFPACK_PEAK_MEMORY = 41;
  UMFPACK_FLOPS = 42;
  UMFPACK_LNZ = 43;
  UMFPACK_UNZ = 44;
  UMFPACK_VARIABLE_INIT = 45;
  UMFPACK_VARIABLE_PEAK = 46;
  UMFPACK_VARIABLE_FINAL = 47;
  UMFPACK_MAX_FRONT_SIZE = 48;
  UMFPACK_MAX_FRONT_NROWS = 49;
  UMFPACK_MAX_FRONT_NCOLS = 50;
  UMFPACK_NUMERIC_DEFRAG = 60;
  UMFPACK_NUMERIC_REALLOC = 61;
  UMFPACK_NUMERIC_COSTLY_REALLOC = 62;
  UMFPACK_COMPRESSED_PATTERN = 63;
  UMFPACK_LU_ENTRIES = 64;
  UMFPACK_NUMERIC_TIME = 65;
  UMFPACK_UDIAG_NZ = 66;
  UMFPACK_RCOND = 67;
  UMFPACK_WAS_SCALED = 68;
  UMFPACK_RSMIN = 69;
  UMFPACK_RSMAX = 70;
  UMFPACK_UMIN = 71;
  UMFPACK_UMAX = 72;
  UMFPACK_ALLOC_INIT_USED = 73;
  UMFPACK_FORCED_UPDATES = 74;
  UMFPACK_NUMERIC_WALLTIME = 75;
  UMFPACK_NOFF_DIAG = 76;
  UMFPACK_ALL_LNZ = 77;
  UMFPACK_ALL_UNZ = 78;
  UMFPACK_NZDROPPED = 79;
  UMFPACK_IR_TAKEN = 80;
  UMFPACK_IR_ATTEMPTED = 81;
  UMFPACK_OMEGA1 = 82;
  UMFPACK_OMEGA2 = 83;
  UMFPACK_SOLVE_FLOPS = 84;
  UMFPACK_SOLVE_TIME = 85;
  UMFPACK_SOLVE_WALLTIME = 86;
  UMFPACK_PRL = 0;
  UMFPACK_DENSE_ROW = 1;
  UMFPACK_DENSE_COL = 2;
  UMFPACK_BLOCK_SIZE = 4;
  UMFPACK_STRATEGY = 5;
  UMFPACK_ORDERING = 10;
  UMFPACK_FIXQ = 13;
  UMFPACK_AMD_DENSE = 14;
  UMFPACK_AGGRESSIVE = 19;
  UMFPACK_SINGLETONS = 11;
  UMFPACK_PIVOT_TOLERANCE = 3;
  UMFPACK_ALLOC_INIT = 6;
  UMFPACK_SYM_PIVOT_TOLERANCE = 15;
  UMFPACK_SCALE = 16;
  UMFPACK_FRONT_ALLOC_INIT = 17;
  UMFPACK_DROPTOL = 18;
  UMFPACK_IRSTEP = 7;
  UMFPACK_COMPILED_WITH_BLAS = 8;
  UMFPACK_STRATEGY_THRESH_SYM = 9;
  UMFPACK_STRATEGY_THRESH_NNZDIAG = 12;
  UMFPACK_STRATEGY_AUTO = 0;
  UMFPACK_STRATEGY_UNSYMMETRIC = 1;
  UMFPACK_STRATEGY_OBSOLETE = 2;
  UMFPACK_STRATEGY_SYMMETRIC = 3;
  UMFPACK_SCALE_NONE = 0;
  UMFPACK_SCALE_SUM = 1;
  UMFPACK_SCALE_MAX = 2;
  UMFPACK_ORDERING_CHOLMOD = 0;
  UMFPACK_ORDERING_AMD = 1;
  UMFPACK_ORDERING_GIVEN = 2;
  UMFPACK_ORDERING_METIS = 3;
  UMFPACK_ORDERING_BEST = 4;
  UMFPACK_ORDERING_NONE = 5;
  UMFPACK_ORDERING_USER = 6;
  UMFPACK_ORDERING_METIS_GUARD = 7;
  UMFPACK_DEFAULT_PRL = 1;
  UMFPACK_DEFAULT_DENSE_ROW = 0.2;
  UMFPACK_DEFAULT_DENSE_COL = 0.2;
  UMFPACK_DEFAULT_PIVOT_TOLERANCE = 0.1;
  UMFPACK_DEFAULT_SYM_PIVOT_TOLERANCE = 0.001;
  UMFPACK_DEFAULT_BLOCK_SIZE = 32;
  UMFPACK_DEFAULT_ALLOC_INIT = 0.7;
  UMFPACK_DEFAULT_FRONT_ALLOC_INIT = 0.5;
  UMFPACK_DEFAULT_IRSTEP = 2;
  UMFPACK_DEFAULT_SCALE = UMFPACK_SCALE_SUM;
  UMFPACK_DEFAULT_STRATEGY = UMFPACK_STRATEGY_AUTO;
  UMFPACK_DEFAULT_AMD_DENSE = AMD_DEFAULT_DENSE;
  UMFPACK_DEFAULT_FIXQ = 0;
  UMFPACK_DEFAULT_AGGRESSIVE = 1;
  UMFPACK_DEFAULT_DROPTOL = 0;
  UMFPACK_DEFAULT_ORDERING = UMFPACK_ORDERING_AMD;
  UMFPACK_DEFAULT_SINGLETONS = True;
  UMFPACK_DEFAULT_STRATEGY_THRESH_SYM = 0.3;
  UMFPACK_DEFAULT_STRATEGY_THRESH_NNZDIAG = 0.9;
  UMFPACK_OK = 0;
  UMFPACK_WARNING_singular_matrix = 1;
  UMFPACK_WARNING_determinant_underflow = 2;
  UMFPACK_WARNING_determinant_overflow = 3;
  UMFPACK_ERROR_out_of_memory = -(1);
  UMFPACK_ERROR_invalid_Numeric_object = -(3);
  UMFPACK_ERROR_invalid_Symbolic_object = -(4);
  UMFPACK_ERROR_argument_missing = -(5);
  UMFPACK_ERROR_n_nonpositive = -(6);
  UMFPACK_ERROR_invalid_matrix = -(8);
  UMFPACK_ERROR_different_pattern = -(11);
  UMFPACK_ERROR_invalid_system = -(13);
  UMFPACK_ERROR_invalid_permutation = -(15);
  UMFPACK_ERROR_internal_error = -(911);
  UMFPACK_ERROR_file_IO = -(17);
  UMFPACK_ERROR_ordering_failed = -(18);
  UMFPACK_ERROR_invalid_blob = -(19);
  UMFPACK_A = 0;
  UMFPACK_At = 1;
  UMFPACK_Aat = 2;
  UMFPACK_Pt_L = 3;
  UMFPACK_L = 4;
  UMFPACK_Lt_P = 5;
  UMFPACK_Lat_P = 6;
  UMFPACK_Lt = 7;
  UMFPACK_Lat = 8;
  UMFPACK_U_Qt = 9;
  UMFPACK_U = 10;
  UMFPACK_Q_Ut = 11;
  UMFPACK_Q_Uat = 12;
  UMFPACK_Ut = 13;
  UMFPACK_Uat = 14;

procedure umfpack_version(version: Plongint); cdecl; external libumfpack;

function umfpack_di_symbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_symbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_symbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_symbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_numeric(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Symbolic: pointer; Numeric: Ppointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_numeric(Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Symbolic: pointer; Numeric: Ppointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_numeric(Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Az: Pdouble; Symbolic: pointer;
  Numeric: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_numeric(Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Az: Pdouble; Symbolic: pointer;
  Numeric: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_solve(sys: longint; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; X: Pdouble;
  B: Pdouble; Numeric: pointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_solve(sys: longint; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; X: Pdouble;
  B: Pdouble; Numeric: pointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_solve(sys: longint; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Az: Pdouble;
  Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_solve(sys: longint; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Az: Pdouble;
  Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;

procedure umfpack_di_free_symbolic(Symbolic: Ppointer); cdecl; external libumfpack;
procedure umfpack_dl_free_symbolic(Symbolic: Ppointer); cdecl; external libumfpack;
procedure umfpack_zi_free_symbolic(Symbolic: Ppointer); cdecl; external libumfpack;
procedure umfpack_zl_free_symbolic(Symbolic: Ppointer); cdecl; external libumfpack;

procedure umfpack_di_free_numeric(Numeric: Ppointer); cdecl; external libumfpack;
procedure umfpack_dl_free_numeric(Numeric: Ppointer); cdecl; external libumfpack;
procedure umfpack_zi_free_numeric(Numeric: Ppointer); cdecl; external libumfpack;
procedure umfpack_zl_free_numeric(Numeric: Ppointer); cdecl; external libumfpack;

procedure umfpack_di_defaults(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_dl_defaults(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_zi_defaults(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_zl_defaults(Control: Pdouble); cdecl; external libumfpack;

function umfpack_di_qsymbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Qinit: Pint32_t; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_qsymbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Qinit: Pint64_t; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_qsymbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; Qinit: Pint32_t; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_qsymbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; Qinit: Pint64_t; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;

type
  Tfssymbolic_func = function(para1: Tint32_t; para2: Tint32_t; para3: Tint32_t; para4: Pint32_t; para5: Pint32_t; para6: Pint32_t; para7: pointer; para8: Pdouble): longint; cdecl;

function umfpack_di_fsymbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_fsymbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_fsymbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; Control: Pdouble;
  Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_fsymbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; Control: Pdouble;
  Info: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_paru_symbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Qinit: Pint32_t; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; SW: Ppointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_paru_symbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Qinit: Pint64_t; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer; SW: Ppointer;
  Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_paru_symbolic(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; Qinit: Pint32_t; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer;
  SW: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_paru_symbolic(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; Qinit: Pint64_t; user_ordering: Tfssymbolic_func; user_params: pointer; Symbolic: Ppointer;
  SW: Ppointer; Control: Pdouble; Info: Pdouble): longint; cdecl; external libumfpack;

procedure umfpack_di_paru_free_sw(SW: Ppointer); cdecl; external libumfpack;
procedure umfpack_dl_paru_free_sw(SW: Ppointer); cdecl; external libumfpack;
procedure umfpack_zi_paru_free_sw(SW: Ppointer); cdecl; external libumfpack;
procedure umfpack_zl_paru_free_sw(SW: Ppointer); cdecl; external libumfpack;

function umfpack_di_wsolve(sys: longint; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; X: Pdouble;
  B: Pdouble; Numeric: pointer; Control: Pdouble; Info: Pdouble; Wi: Pint32_t;
  W: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_wsolve(sys: longint; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; X: Pdouble;
  B: Pdouble; Numeric: pointer; Control: Pdouble; Info: Pdouble; Wi: Pint64_t;
  W: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_wsolve(sys: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Az: Pdouble;
  Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer;
  Control: Pdouble; Info: Pdouble; Wi: Pint32_t; W: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_wsolve(sys: longint; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Az: Pdouble;
  Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer;
  Control: Pdouble; Info: Pdouble; Wi: Pint64_t; W: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_triplet_to_col(n_row: Tint32_t; n_col: Tint32_t; nz: Tint32_t; Ti: Pint32_t; Tj: Pint32_t;
  Tx: Pdouble; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble; Map: Pint32_t): longint; cdecl; external libumfpack;
function umfpack_dl_triplet_to_col(n_row: Tint64_t; n_col: Tint64_t; nz: Tint64_t; Ti: Pint64_t; Tj: Pint64_t;
  Tx: Pdouble; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble; Map: Pint64_t): longint; cdecl; external libumfpack;
function umfpack_zi_triplet_to_col(n_row: Tint32_t; n_col: Tint32_t; nz: Tint32_t; Ti: Pint32_t; Tj: Pint32_t;
  Tx: Pdouble; Tz: Pdouble; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; Map: Pint32_t): longint; cdecl; external libumfpack;
function umfpack_zl_triplet_to_col(n_row: Tint64_t; n_col: Tint64_t; nz: Tint64_t; Ti: Pint64_t; Tj: Pint64_t;
  Tx: Pdouble; Tz: Pdouble; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; Map: Pint64_t): longint; cdecl; external libumfpack;

function umfpack_di_col_to_triplet(n_col: Tint32_t; Ap: Pint32_t; Tj: Pint32_t): longint; cdecl; external libumfpack;
function umfpack_dl_col_to_triplet(n_col: Tint64_t; Ap: Pint64_t; Tj: Pint64_t): longint; cdecl; external libumfpack;
function umfpack_zi_col_to_triplet(n_col: Tint32_t; Ap: Pint32_t; Tj: Pint32_t): longint; cdecl; external libumfpack;
function umfpack_zl_col_to_triplet(n_col: Tint64_t; Ap: Pint64_t; Tj: Pint64_t): longint; cdecl; external libumfpack;

function umfpack_di_transpose(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  P: Pint32_t; Q: Pint32_t; Rp: Pint32_t; Ri: Pint32_t; Rx: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_transpose(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  P: Pint64_t; Q: Pint64_t; Rp: Pint64_t; Ri: Pint64_t; Rx: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_transpose(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; P: Pint32_t; Q: Pint32_t; Rp: Pint32_t; Ri: Pint32_t;
  Rx: Pdouble; Rz: Pdouble; do_conjugate: longint): longint; cdecl; external libumfpack;
function umfpack_zl_transpose(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; P: Pint64_t; Q: Pint64_t; Rp: Pint64_t; Ri: Pint64_t;
  Rx: Pdouble; Rz: Pdouble; do_conjugate: longint): longint; cdecl; external libumfpack;

function umfpack_di_scale(X: Pdouble; B: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_scale(X: Pdouble; B: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_scale(Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_scale(Xx: Pdouble; Xz: Pdouble; Bx: Pdouble; Bz: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;

function umfpack_di_get_lunz(lnz: Pint32_t; unz: Pint32_t; n_row: Pint32_t; n_col: Pint32_t; nz_udiag: Pint32_t;
  Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_get_lunz(lnz: Pint64_t; unz: Pint64_t; n_row: Pint64_t; n_col: Pint64_t; nz_udiag: Pint64_t;
  Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_get_lunz(lnz: Pint32_t; unz: Pint32_t; n_row: Pint32_t; n_col: Pint32_t; nz_udiag: Pint32_t;
  Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_get_lunz(lnz: Pint64_t; unz: Pint64_t; n_row: Pint64_t; n_col: Pint64_t; nz_udiag: Pint64_t;
  Numeric: pointer): longint; cdecl; external libumfpack;

function umfpack_di_get_numeric(Lp: Pint32_t; Lj: Pint32_t; Lx: Pdouble; Up: Pint32_t; Ui: Pint32_t;
  Ux: Pdouble; P: Pint32_t; Q: Pint32_t; Dx: Pdouble; do_recip: Pint32_t;
  Rs: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_get_numeric(Lp: Pint64_t; Lj: Pint64_t; Lx: Pdouble; Up: Pint64_t; Ui: Pint64_t;
  Ux: Pdouble; P: Pint64_t; Q: Pint64_t; Dx: Pdouble; do_recip: Pint64_t;
  Rs: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_get_numeric(Lp: Pint32_t; Lj: Pint32_t; Lx: Pdouble; Lz: Pdouble; Up: Pint32_t;
  Ui: Pint32_t; Ux: Pdouble; Uz: Pdouble; P: Pint32_t; Q: Pint32_t;
  Dx: Pdouble; Dz: Pdouble; do_recip: Pint32_t; Rs: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_get_numeric(Lp: Pint64_t; Lj: Pint64_t; Lx: Pdouble; Lz: Pdouble; Up: Pint64_t;
  Ui: Pint64_t; Ux: Pdouble; Uz: Pdouble; P: Pint64_t; Q: Pint64_t;
  Dx: Pdouble; Dz: Pdouble; do_recip: Pint64_t; Rs: Pdouble; Numeric: pointer): longint; cdecl; external libumfpack;

function umfpack_di_get_symbolic(n_row: Pint32_t; n_col: Pint32_t; n1: Pint32_t; nz: Pint32_t; nfr: Pint32_t;
  nchains: Pint32_t; P: Pint32_t; Q: Pint32_t; Front_npivcol: Pint32_t; Front_parent: Pint32_t;
  Front_1strow: Pint32_t; Front_leftmostdesc: Pint32_t; Chain_start: Pint32_t; Chain_maxrows: Pint32_t; Chain_maxcols: Pint32_t;
  Dmap: Pint32_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_get_symbolic(n_row: Pint64_t; n_col: Pint64_t; n1: Pint64_t; nz: Pint64_t; nfr: Pint64_t;
  nchains: Pint64_t; P: Pint64_t; Q: Pint64_t; Front_npivcol: Pint64_t; Front_parent: Pint64_t;
  Front_1strow: Pint64_t; Front_leftmostdesc: Pint64_t; Chain_start: Pint64_t; Chain_maxrows: Pint64_t; Chain_maxcols: Pint64_t;
  Dmap: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_get_symbolic(n_row: Pint32_t; n_col: Pint32_t; n1: Pint32_t; nz: Pint32_t; nfr: Pint32_t;
  nchains: Pint32_t; P: Pint32_t; Q: Pint32_t; Front_npivcol: Pint32_t; Front_parent: Pint32_t;
  Front_1strow: Pint32_t; Front_leftmostdesc: Pint32_t; Chain_start: Pint32_t; Chain_maxrows: Pint32_t; Chain_maxcols: Pint32_t;
  Dmap: Pint32_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_get_symbolic(n_row: Pint64_t; n_col: Pint64_t; n1: Pint64_t; nz: Pint64_t; nfr: Pint64_t;
  nchains: Pint64_t; P: Pint64_t; Q: Pint64_t; Front_npivcol: Pint64_t; Front_parent: Pint64_t;
  Front_1strow: Pint64_t; Front_leftmostdesc: Pint64_t; Chain_start: Pint64_t; Chain_maxrows: Pint64_t; Chain_maxcols: Pint64_t;
  Dmap: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;

function umfpack_di_save_numeric(Numeric: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_dl_save_numeric(Numeric: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zi_save_numeric(Numeric: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zl_save_numeric(Numeric: pointer; filename: pchar): longint; cdecl; external libumfpack;

function umfpack_di_load_numeric(Numeric: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_dl_load_numeric(Numeric: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zi_load_numeric(Numeric: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zl_load_numeric(Numeric: Ppointer; filename: pchar): longint; cdecl; external libumfpack;

function umfpack_di_copy_numeric(Numeric: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_copy_numeric(Numeric: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_copy_numeric(Numeric: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_copy_numeric(Numeric: Ppointer; Original: pointer): longint; cdecl; external libumfpack;

function umfpack_di_serialize_numeric_size(blobsize: Pint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_serialize_numeric_size(blobsize: Pint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_serialize_numeric_size(blobsize: Pint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_serialize_numeric_size(blobsize: Pint64_t; Numeric: pointer): longint; cdecl; external libumfpack;

function umfpack_di_serialize_numeric(blob: Pint8_t; blobsize: Tint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_serialize_numeric(blob: Pint8_t; blobsize: Tint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_serialize_numeric(blob: Pint8_t; blobsize: Tint64_t; Numeric: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_serialize_numeric(blob: Pint8_t; blobsize: Tint64_t; Numeric: pointer): longint; cdecl; external libumfpack;

function umfpack_di_deserialize_numeric(Numeric: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_dl_deserialize_numeric(Numeric: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_zi_deserialize_numeric(Numeric: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_zl_deserialize_numeric(Numeric: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;

function umfpack_di_save_symbolic(Symbolic: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_dl_save_symbolic(Symbolic: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zi_save_symbolic(Symbolic: pointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zl_save_symbolic(Symbolic: pointer; filename: pchar): longint; cdecl; external libumfpack;

function umfpack_di_load_symbolic(Symbolic: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_dl_load_symbolic(Symbolic: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zi_load_symbolic(Symbolic: Ppointer; filename: pchar): longint; cdecl; external libumfpack;
function umfpack_zl_load_symbolic(Symbolic: Ppointer; filename: pchar): longint; cdecl; external libumfpack;

function umfpack_di_copy_symbolic(Symbolic: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_copy_symbolic(Symbolic: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_copy_symbolic(Symbolic: Ppointer; Original: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_copy_symbolic(Symbolic: Ppointer; Original: pointer): longint; cdecl; external libumfpack;

function umfpack_di_serialize_symbolic_size(blobsize: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_serialize_symbolic_size(blobsize: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_serialize_symbolic_size(blobsize: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_serialize_symbolic_size(blobsize: Pint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;

function umfpack_di_serialize_symbolic(blob: Pint8_t; blobsize: Tint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_dl_serialize_symbolic(blob: Pint8_t; blobsize: Tint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zi_serialize_symbolic(blob: Pint8_t; blobsize: Tint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;
function umfpack_zl_serialize_symbolic(blob: Pint8_t; blobsize: Tint64_t; Symbolic: pointer): longint; cdecl; external libumfpack;

function umfpack_di_deserialize_symbolic(Symbolic: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_dl_deserialize_symbolic(Symbolic: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_zi_deserialize_symbolic(Symbolic: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;
function umfpack_zl_deserialize_symbolic(Symbolic: Ppointer; blob: Pint8_t; blobsize: Tint64_t): longint; cdecl; external libumfpack;

function umfpack_di_get_determinant(Mx: Pdouble; Ex: Pdouble; Numeric: pointer; User_Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_get_determinant(Mx: Pdouble; Ex: Pdouble; Numeric: pointer; User_Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_get_determinant(Mx: Pdouble; Mz: Pdouble; Ex: Pdouble; Numeric: pointer; User_Info: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_get_determinant(Mx: Pdouble; Mz: Pdouble; Ex: Pdouble; Numeric: pointer; User_Info: Pdouble): longint; cdecl; external libumfpack;

procedure umfpack_di_report_status(Control: Pdouble; status: longint); cdecl; external libumfpack;
procedure umfpack_dl_report_status(Control: Pdouble; status: longint); cdecl; external libumfpack;
procedure umfpack_zi_report_status(Control: Pdouble; status: longint); cdecl; external libumfpack;
procedure umfpack_zl_report_status(Control: Pdouble; status: longint); cdecl; external libumfpack;

procedure umfpack_di_report_info(Control: Pdouble; Info: Pdouble); cdecl; external libumfpack;
procedure umfpack_dl_report_info(Control: Pdouble; Info: Pdouble); cdecl; external libumfpack;
procedure umfpack_zi_report_info(Control: Pdouble; Info: Pdouble); cdecl; external libumfpack;
procedure umfpack_zl_report_info(Control: Pdouble; Info: Pdouble); cdecl; external libumfpack;

procedure umfpack_di_report_control(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_dl_report_control(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_zi_report_control(Control: Pdouble); cdecl; external libumfpack;
procedure umfpack_zl_report_control(Control: Pdouble); cdecl; external libumfpack;

function umfpack_di_report_matrix(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  col_form: longint; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_matrix(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  col_form: longint; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_matrix(n_row: Tint32_t; n_col: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Ax: Pdouble;
  Az: Pdouble; col_form: longint; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_matrix(n_row: Tint64_t; n_col: Tint64_t; Ap: Pint64_t; Ai: Pint64_t; Ax: Pdouble;
  Az: Pdouble; col_form: longint; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_report_triplet(n_row: Tint32_t; n_col: Tint32_t; nz: Tint32_t; Ti: Pint32_t; Tj: Pint32_t;
  Tx: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_triplet(n_row: Tint64_t; n_col: Tint64_t; nz: Tint64_t; Ti: Pint64_t; Tj: Pint64_t;
  Tx: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_triplet(n_row: Tint32_t; n_col: Tint32_t; nz: Tint32_t; Ti: Pint32_t; Tj: Pint32_t;
  Tx: Pdouble; Tz: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_triplet(n_row: Tint64_t; n_col: Tint64_t; nz: Tint64_t; Ti: Pint64_t; Tj: Pint64_t;
  Tx: Pdouble; Tz: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_report_vector(n: Tint32_t; X: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_vector(n: Tint64_t; X: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_vector(n: Tint32_t; Xx: Pdouble; Xz: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_vector(n: Tint64_t; Xx: Pdouble; Xz: Pdouble; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_report_symbolic(Symbolic: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_symbolic(Symbolic: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_symbolic(Symbolic: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_symbolic(Symbolic: pointer; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_report_numeric(Numeric: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_numeric(Numeric: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_numeric(Numeric: pointer; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_numeric(Numeric: pointer; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_di_report_perm(np: Tint32_t; Perm: Pint32_t; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_dl_report_perm(np: Tint64_t; Perm: Pint64_t; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zi_report_perm(np: Tint32_t; Perm: Pint32_t; Control: Pdouble): longint; cdecl; external libumfpack;
function umfpack_zl_report_perm(np: Tint64_t; Perm: Pint64_t; Control: Pdouble): longint; cdecl; external libumfpack;

function umfpack_timer: double; cdecl; external libumfpack;

procedure umfpack_tic(stats: Pdouble); cdecl; external libumfpack;
procedure umfpack_toc(stats: Pdouble); cdecl; external libumfpack;

// === Konventiert am: 4-11-25 19:29:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function UMFPACK_VER_CODE(main, sub: longint): longint;
begin
  UMFPACK_VER_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function UMFPACK_VER: longint;
begin
  UMFPACK_VER := UMFPACK_VER_CODE(6, 3);
end;


{$ENDIF read_implementation}
