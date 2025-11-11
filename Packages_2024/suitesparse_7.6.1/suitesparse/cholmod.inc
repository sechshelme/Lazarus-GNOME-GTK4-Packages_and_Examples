{$IFDEF read_interface}


const
  CHOLMOD_PATTERN = 0;
  CHOLMOD_REAL = 1;
  CHOLMOD_COMPLEX = 2;
  CHOLMOD_ZOMPLEX = 3;
  CHOLMOD_DOUBLE = 0;
  CHOLMOD_SINGLE = 4;
  CHOLMOD_INT = 0;
  CHOLMOD_LONG = 2;
  CHOLMOD_DATE = 'Jan 20, 2024';
  CHOLMOD_MAIN_VERSION = 5;
  CHOLMOD_SUB_VERSION = 2;
  CHOLMOD_SUBSUB_VERSION = 0;

function CHOLMOD_VER_CODE(main, sub: longint): longint;
function CHOLMOD_VERSION: longint;

type
  TCHOLMOD_CUBLAS_HANDLE = Pointer;
  TCHOLMOD_CUDASTREAM = Pointer;
  TCHOLMOD_CUDAEVENT = Pointer;

function cholmod_version(version: Plongint): longint; cdecl; external libcholmod;
function cholmod_l_version(version: Plongint): longint; cdecl; external libcholmod;

const
  _FILE_OFFSET_BITS = 64;

const
  CHOLMOD_DEVICE_SUPERNODE_BUFFERS = 6;
  CHOLMOD_HOST_SUPERNODE_BUFFERS = 8;
  CHOLMOD_DEVICE_STREAMS = 2;
  CHOLMOD_COMMON = 0;
  CHOLMOD_SPARSE = 1;
  CHOLMOD_FACTOR = 2;
  CHOLMOD_DENSE = 3;
  CHOLMOD_TRIPLET = 4;
  CHOLMOD_SIMPLICIAL = 0;
  CHOLMOD_AUTO = 1;
  CHOLMOD_SUPERNODAL = 2;
  CHOLMOD_NATURAL = 0;
  CHOLMOD_GIVEN = 1;
  CHOLMOD_AMD_ = 2;
  CHOLMOD_METIS_ = 3;
  CHOLMOD_NESDIS = 4;
  CHOLMOD_COLAMD_ = 5;
  CHOLMOD_POSTORDERED = 6;
  CHOLMOD_MAXMETHODS = 9;
  CHOLMOD_OK = 0;
  CHOLMOD_NOT_INSTALLED = -(1);
  CHOLMOD_OUT_OF_MEMORY = -(2);
  CHOLMOD_TOO_LARGE = -(3);
  CHOLMOD_INVALID = -(4);
  CHOLMOD_GPU_PROBLEM = -(5);
  CHOLMOD_NOT_POSDEF = 1;
  CHOLMOD_DSMALL = 2;

type
  Tcholmod_common = record
    dbound: double;
    grow0: double;
    grow1: double;
    grow2: Tsize_t;
    maxrank: Tsize_t;
    supernodal_switch: double;
    supernodal: longint;
    final_asis: longint;
    final_super: longint;
    final_ll: longint;
    final_pack: longint;
    final_monotonic: longint;
    final_resymbol: longint;
    zrelax: array[0..2] of double;
    nrelax: array[0..2] of Tsize_t;
    prefer_zomplex: longint;
    prefer_upper: longint;
    quick_return_if_not_posdef: longint;
    prefer_binary: longint;
    print: longint;
    precise: longint;
    try_catch: longint;
    error_handler: procedure(status: longint; file_: pchar; line: longint; message: pchar); cdecl;
    nmethods: longint;
    current: longint;
    selected: longint;
    method: array[0..(CHOLMOD_MAXMETHODS + 1) - 1] of record
      lnz: double;
      fl: double;
      prune_dense: double;
      prune_dense2: double;
      nd_oksep: double;
      other_1: array[0..3] of double;
      nd_small: Tsize_t;
      other_2: array[0..3] of double;
      aggressive: longint;
      order_for_lu: longint;
      nd_compress: longint;
      nd_camd: longint;
      nd_components: longint;
      ordering: longint;
      other_3: array[0..3] of Tsize_t;
      end;
    postorder: longint;
    default_nesdis: longint;
    metis_memory: double;
    metis_dswitch: double;
    metis_nswitch: Tsize_t;
    nrow: Tsize_t;
    mark: Tint64_t;
    iworksize: Tsize_t;
    xworkbytes: Tsize_t;
    Flag: pointer;
    Head: pointer;
    Xwork: pointer;
    Iwork: pointer;
    itype: longint;
    other_5: longint;
    no_workspace_reallocate: longint;
    status: longint;
    fl: double;
    lnz: double;
    anz: double;
    modfl: double;
    malloc_count: Tsize_t;
    memory_usage: Tsize_t;
    memory_inuse: Tsize_t;
    nrealloc_col: double;
    nrealloc_factor: double;
    ndbounds_hit: double;
    rowfacfl: double;
    aatfl: double;
    called_nd: longint;
    blas_ok: longint;
    SPQR_grain: double;
    SPQR_small: double;
    SPQR_shrink: longint;
    SPQR_nthreads: longint;
    SPQR_flopcount: double;
    SPQR_analyze_time: double;
    SPQR_factorize_time: double;
    SPQR_solve_time: double;
    SPQR_flopcount_bound: double;
    SPQR_tol_used: double;
    SPQR_norm_E_fro: double;
    SPQR_istat: array[0..7] of Tint64_t;
    nsbounds_hit: double;
    sbound: single;
    other_6: single;
    useGPU: longint;
    maxGpuMemBytes: Tsize_t;
    maxGpuMemFraction: double;
    gpuMemorySize: Tsize_t;
    gpuKernelTime: double;
    gpuFlops: Tint64_t;
    gpuNumKernelLaunches: longint;
    cublasHandle: TCHOLMOD_CUBLAS_HANDLE;
    gpuStream: array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS) - 1] of TCHOLMOD_CUDASTREAM;
    cublasEventPotrf: array[0..2] of TCHOLMOD_CUDAEVENT;
    updateCKernelsComplete: TCHOLMOD_CUDAEVENT;
    updateCBuffersFree: array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS) - 1] of TCHOLMOD_CUDAEVENT;
    dev_mempool: pointer;
    dev_mempool_size: Tsize_t;
    host_pinned_mempool: pointer;
    host_pinned_mempool_size: Tsize_t;
    devBuffSize: Tsize_t;
    ibuffer: longint;
    syrkStart: double;
    cholmod_cpu_gemm_time: double;
    cholmod_cpu_syrk_time: double;
    cholmod_cpu_trsm_time: double;
    cholmod_cpu_potrf_time: double;
    cholmod_gpu_gemm_time: double;
    cholmod_gpu_syrk_time: double;
    cholmod_gpu_trsm_time: double;
    cholmod_gpu_potrf_time: double;
    cholmod_assemble_time: double;
    cholmod_assemble_time2: double;
    cholmod_cpu_gemm_calls: Tsize_t;
    cholmod_cpu_syrk_calls: Tsize_t;
    cholmod_cpu_trsm_calls: Tsize_t;
    cholmod_cpu_potrf_calls: Tsize_t;
    cholmod_gpu_gemm_calls: Tsize_t;
    cholmod_gpu_syrk_calls: Tsize_t;
    cholmod_gpu_trsm_calls: Tsize_t;
    cholmod_gpu_potrf_calls: Tsize_t;
    chunk: double;
    nthreads_max: longint;
    blas_dump: PFILE;
  end;
  Pcholmod_common = ^Tcholmod_common;

function cholmod_start(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_start(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_finish(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_finish(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_defaults(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_defaults(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_maxrank(n: Tsize_t; Common: Pcholmod_common): Tsize_t; cdecl; external libcholmod;
function cholmod_l_maxrank(para1: Tsize_t; para2: Pcholmod_common): Tsize_t; cdecl; external libcholmod;

function cholmod_allocate_work(nrow: Tsize_t; iworksize: Tsize_t; xworksize: Tsize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_allocate_work(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_alloc_work(nrow: Tsize_t; iworksize: Tsize_t; xworksize: Tsize_t; dtype: longint; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_alloc_work(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: longint; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_free_work(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_free_work(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_clear_flag(Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_clear_flag(para1: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_error(status: longint; file_: pchar; line: longint; message: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_error(para1: longint; para2: pchar; para3: longint; para4: pchar; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_dbound(para1: double; para2: Pcholmod_common): double; cdecl; external libcholmod;
function cholmod_l_dbound(para1: double; para2: Pcholmod_common): double; cdecl; external libcholmod;
function cholmod_sbound(para1: single; para2: Pcholmod_common): single; cdecl; external libcholmod;
function cholmod_l_sbound(para1: single; para2: Pcholmod_common): single; cdecl; external libcholmod;

function cholmod_hypot(x: double; y: double): double; cdecl; external libcholmod;
function cholmod_l_hypot(para1: double; para2: double): double; cdecl; external libcholmod;

function cholmod_divcomplex(ar: double; ai: double; br: double; bi: double; cr: Pdouble;
  ci: Pdouble): longint; cdecl; external libcholmod;
function cholmod_l_divcomplex(para1: double; para2: double; para3: double; para4: double; para5: Pdouble;
  para6: Pdouble): longint; cdecl; external libcholmod;

type
  Tcholmod_sparse = record
    nrow: Tsize_t;
    ncol: Tsize_t;
    nzmax: Tsize_t;
    p: pointer;
    i: pointer;
    nz: pointer;
    x: pointer;
    z: pointer;
    stype: longint;
    itype: longint;
    xtype: longint;
    dtype: longint;
    sorted: longint;
    packed_: longint;
  end;
  Pcholmod_sparse = ^Tcholmod_sparse;
  PPcholmod_sparse = ^Pcholmod_sparse;

function cholmod_allocate_sparse(nrow: Tsize_t; ncol: Tsize_t; nzmax: Tsize_t; sorted: longint; packed_: longint;
  stype: longint; xdtype: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_allocate_sparse(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: longint; para5: longint;
  para6: longint; para7: longint; para8: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_free_sparse(A: PPcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_free_sparse(para1: PPcholmod_sparse; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_reallocate_sparse(nznew: Tsize_t; A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_reallocate_sparse(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_nnz(A: Pcholmod_sparse; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_nnz(para1: Pcholmod_sparse; para2: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_speye(nrow: Tsize_t; ncol: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_speye(para1: Tsize_t; para2: Tsize_t; para3: longint; para4: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_spzeros(nrow: Tsize_t; ncol: Tsize_t; nzmax: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_spzeros(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: longint; para5: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_transpose(A: Pcholmod_sparse; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_transpose(para1: Pcholmod_sparse; para2: longint; para3: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_transpose_unsym(A: Pcholmod_sparse; mode: longint; Perm: Pint32_t; fset: Pint32_t; fsize: Tsize_t;
  C: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_transpose_unsym(para1: Pcholmod_sparse; para2: longint; para3: Pint64_t; para4: Pint64_t; para5: Tsize_t;
  para6: Pcholmod_sparse; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_transpose_sym(A: Pcholmod_sparse; mode: longint; Perm: Pint32_t; C: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_transpose_sym(para1: Pcholmod_sparse; para2: longint; para3: Pint64_t; para4: Pcholmod_sparse; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_ptranspose(A: Pcholmod_sparse; mode: longint; Perm: Pint32_t; fset: Pint32_t; fsize: Tsize_t;
  Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_ptranspose(para1: Pcholmod_sparse; para2: longint; para3: Pint64_t; para4: Pint64_t; para5: Tsize_t;
  para6: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_sort(A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_sort(para1: Pcholmod_sparse; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_band_nnz(A: Pcholmod_sparse; k1: Tint64_t; k2: Tint64_t; ignore_diag: boolean; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_band_nnz(para1: Pcholmod_sparse; para2: Tint64_t; para3: Tint64_t; para4: boolean; para5: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_band(A: Pcholmod_sparse; k1: Tint64_t; k2: Tint64_t; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_band(para1: Pcholmod_sparse; para2: Tint64_t; para3: Tint64_t; para4: longint; para5: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_band_inplace(k1: Tint64_t; k2: Tint64_t; mode: longint; A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_band_inplace(para1: Tint64_t; para2: Tint64_t; para3: longint; para4: Pcholmod_sparse; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_aat(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_aat(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_copy_sparse(A: Pcholmod_sparse; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_copy_sparse(para1: Pcholmod_sparse; para2: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_copy(A: Pcholmod_sparse; stype: longint; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_copy(para1: Pcholmod_sparse; para2: longint; para3: longint; para4: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_add(A: Pcholmod_sparse; B: Pcholmod_sparse; alpha: Pdouble; beta: Pdouble; mode: longint;
  sorted: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_add(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pdouble; para4: Pdouble; para5: longint;
  para6: longint; para7: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_sparse_xtype(to_xdtype: longint; A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_sparse_xtype(para1: longint; para2: Pcholmod_sparse; para3: Pcholmod_common): longint; cdecl; external libcholmod;

type
  Tcholmod_factor = record
    n: Tsize_t;
    minor: Tsize_t;
    Perm: pointer;
    ColCount: pointer;
    IPerm: pointer;
    nzmax: Tsize_t;
    p: pointer;
    i: pointer;
    x: pointer;
    z: pointer;
    nz: pointer;
    next: pointer;
    prev: pointer;
    nsuper: Tsize_t;
    ssize: Tsize_t;
    xsize: Tsize_t;
    maxcsize: Tsize_t;
    maxesize: Tsize_t;
    super: pointer;
    pi: pointer;
    px: pointer;
    s: pointer;
    ordering: longint;
    is_ll: longint;
    is_super: longint;
    is_monotonic: longint;
    itype: longint;
    xtype: longint;
    dtype: longint;
    useGPU: longint;
  end;
  Pcholmod_factor = ^Tcholmod_factor;
  PPcholmod_factor = ^Pcholmod_factor;

function cholmod_allocate_factor(n: Tsize_t; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_allocate_factor(para1: Tsize_t; para2: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_alloc_factor(n: Tsize_t; dtype: longint; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_alloc_factor(para1: Tsize_t; para2: longint; para3: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_free_factor(L: PPcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_free_factor(para1: PPcholmod_factor; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_reallocate_factor(nznew: Tsize_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_reallocate_factor(para1: Tsize_t; para2: Pcholmod_factor; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_change_factor(to_xtype: longint; to_ll: longint; to_super: longint; to_packed: longint; to_monotonic: longint;
  L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_change_factor(para1: longint; para2: longint; para3: longint; para4: longint; para5: longint;
  para6: Pcholmod_factor; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_pack_factor(L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_pack_factor(para1: Pcholmod_factor; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_reallocate_column(j: Tsize_t; need: Tsize_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_reallocate_column(para1: Tsize_t; para2: Tsize_t; para3: Pcholmod_factor; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_factor_to_sparse(L: Pcholmod_factor; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_factor_to_sparse(para1: Pcholmod_factor; para2: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_copy_factor(L: Pcholmod_factor; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_copy_factor(para1: Pcholmod_factor; para2: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_factor_xtype(to_xdtype: longint; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_factor_xtype(para1: longint; para2: Pcholmod_factor; para3: Pcholmod_common): longint; cdecl; external libcholmod;

type
  Tcholmod_dense = record
    nrow: Tsize_t;
    ncol: Tsize_t;
    nzmax: Tsize_t;
    d: Tsize_t;
    x: pointer;
    z: pointer;
    xtype: longint;
    dtype: longint;
  end;
  Pcholmod_dense = ^Tcholmod_dense;
  PPcholmod_dense = ^Pcholmod_dense;

function cholmod_allocate_dense(nrow: Tsize_t; ncol: Tsize_t; d: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_allocate_dense(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: longint; para5: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_zeros(nrow: Tsize_t; ncol: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_zeros(para1: Tsize_t; para2: Tsize_t; para3: longint; para4: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_ones(nrow: Tsize_t; ncol: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_ones(para1: Tsize_t; para2: Tsize_t; para3: longint; para4: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_eye(nrow: Tsize_t; ncol: Tsize_t; xdtype: longint; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_eye(para1: Tsize_t; para2: Tsize_t; para3: longint; para4: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_free_dense(X: PPcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_free_dense(para1: PPcholmod_dense; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_ensure_dense(X: PPcholmod_dense; nrow: Tsize_t; ncol: Tsize_t; d: Tsize_t; xdtype: longint;
  Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_ensure_dense(para1: PPcholmod_dense; para2: Tsize_t; para3: Tsize_t; para4: Tsize_t; para5: longint;
  para6: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_sparse_to_dense(A: Pcholmod_sparse; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_sparse_to_dense(para1: Pcholmod_sparse; para2: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_dense_nnz(X: Pcholmod_dense; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_dense_nnz(para1: Pcholmod_dense; para2: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_dense_to_sparse(X: Pcholmod_dense; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_dense_to_sparse(para1: Pcholmod_dense; para2: longint; para3: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_copy_dense(X: Pcholmod_dense; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_copy_dense(para1: Pcholmod_dense; para2: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_copy_dense2(X: Pcholmod_dense; Y: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_copy_dense2(para1: Pcholmod_dense; para2: Pcholmod_dense; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_dense_xtype(to_xdtype: longint; X: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_dense_xtype(para1: longint; para2: Pcholmod_dense; para3: Pcholmod_common): longint; cdecl; external libcholmod;

type
  Tcholmod_triplet = record
    nrow: Tsize_t;
    ncol: Tsize_t;
    nzmax: Tsize_t;
    nnz: Tsize_t;
    i: pointer;
    j: pointer;
    x: pointer;
    z: pointer;
    stype: longint;
    itype: longint;
    xtype: longint;
    dtype: longint;
  end;
  Pcholmod_triplet = ^Tcholmod_triplet;
  PPcholmod_triplet = ^Pcholmod_triplet;

function cholmod_allocate_triplet(nrow: Tsize_t; ncol: Tsize_t; nzmax: Tsize_t; stype: longint; xdtype: longint;
  Common: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;
function cholmod_l_allocate_triplet(para1: Tsize_t; para2: Tsize_t; para3: Tsize_t; para4: longint; para5: longint;
  para6: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;

function cholmod_free_triplet(T: PPcholmod_triplet; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_free_triplet(para1: PPcholmod_triplet; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_reallocate_triplet(nznew: Tsize_t; T: Pcholmod_triplet; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_reallocate_triplet(para1: Tsize_t; para2: Pcholmod_triplet; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_sparse_to_triplet(A: Pcholmod_sparse; Common: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;
function cholmod_l_sparse_to_triplet(para1: Pcholmod_sparse; para2: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;

function cholmod_triplet_to_sparse(T: Pcholmod_triplet; nzmax: Tsize_t; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_triplet_to_sparse(para1: Pcholmod_triplet; para2: Tsize_t; para3: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_copy_triplet(T: Pcholmod_triplet; Common: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;
function cholmod_l_copy_triplet(para1: Pcholmod_triplet; para2: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;

function cholmod_triplet_xtype(to_xdtype: longint; T: Pcholmod_triplet; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_triplet_xtype(para1: longint; para2: Pcholmod_triplet; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_malloc(n: Tsize_t; size: Tsize_t; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_malloc(para1: Tsize_t; para2: Tsize_t; para3: Pcholmod_common): pointer; cdecl; external libcholmod;

function cholmod_calloc(n: Tsize_t; size: Tsize_t; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_calloc(para1: Tsize_t; para2: Tsize_t; para3: Pcholmod_common): pointer; cdecl; external libcholmod;

function cholmod_free(n: Tsize_t; size: Tsize_t; p: pointer; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_free(para1: Tsize_t; para2: Tsize_t; para3: pointer; para4: Pcholmod_common): pointer; cdecl; external libcholmod;

function cholmod_realloc(nnew: Tsize_t; size: Tsize_t; p: pointer; n: Psize_t; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_realloc(para1: Tsize_t; para2: Tsize_t; para3: pointer; para4: Psize_t; para5: Pcholmod_common): pointer; cdecl; external libcholmod;

function cholmod_realloc_multiple(nnew: Tsize_t; nint: longint; xdtype: longint; I_block: Ppointer; J_block: Ppointer;
  X_block: Ppointer; Z_block: Ppointer; n: Psize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_realloc_multiple(para1: Tsize_t; para2: longint; para3: longint; para4: Ppointer; para5: Ppointer;
  para6: Ppointer; para7: Ppointer; para8: Psize_t; para9: Pcholmod_common): longint; cdecl; external libcholmod;

function CHOLMOD_IS_ZERO(x: longint): boolean;
function CHOLMOD_IS_NONZERO(x: longint): boolean;
function CHOLMOD_IS_LT_ZERO(x: longint): boolean;
function CHOLMOD_IS_GT_ZERO(x: longint): boolean;
function CHOLMOD_IS_LE_ZERO(x: longint): boolean;

function cholmod_check_common(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_common(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_common(name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_common(para1: pchar; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_gpu_stats(para1: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_stats(para1: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_sparse(A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_sparse(para1: Pcholmod_sparse; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_sparse(A: Pcholmod_sparse; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_sparse(para1: Pcholmod_sparse; para2: pchar; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_dense(X: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_dense(para1: Pcholmod_dense; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_dense(X: Pcholmod_dense; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_dense(para1: Pcholmod_dense; para2: pchar; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_factor(L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_factor(para1: Pcholmod_factor; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_factor(L: Pcholmod_factor; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_factor(para1: Pcholmod_factor; para2: pchar; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_triplet(T: Pcholmod_triplet; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_triplet(para1: Pcholmod_triplet; para2: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_triplet(T: Pcholmod_triplet; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_triplet(para1: Pcholmod_triplet; para2: pchar; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_subset(Set_: Pint32_t; len: Tint64_t; n: Tsize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_subset(para1: Pint64_t; para2: Tint64_t; para3: Tsize_t; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_subset(Set_: Pint32_t; len: Tint64_t; n: Tsize_t; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_subset(para1: Pint64_t; para2: Tint64_t; para3: Tsize_t; para4: pchar; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_perm(Perm: Pint32_t; len: Tsize_t; n: Tsize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_perm(para1: Pint64_t; para2: Tsize_t; para3: Tsize_t; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_perm(Perm: Pint32_t; len: Tsize_t; n: Tsize_t; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_perm(para1: Pint64_t; para2: Tsize_t; para3: Tsize_t; para4: pchar; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_check_parent(Parent: Pint32_t; n: Tsize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_check_parent(para1: Pint64_t; para2: Tsize_t; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_print_parent(Parent: Pint32_t; n: Tsize_t; name: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_print_parent(para1: Pint64_t; para2: Tsize_t; para3: pchar; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_read_sparse(f: PFILE; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_read_sparse(para1: PFILE; para2: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_read_sparse2(f: PFILE; dtype: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_read_sparse2(para1: PFILE; para2: longint; para3: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_read_triplet(f: PFILE; Common: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;
function cholmod_l_read_triplet(para1: PFILE; para2: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;

function cholmod_read_triplet2(f: PFILE; dtype: longint; Common: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;
function cholmod_l_read_triplet2(para1: PFILE; para2: longint; para3: Pcholmod_common): Pcholmod_triplet; cdecl; external libcholmod;

function cholmod_read_dense(f: PFILE; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_read_dense(para1: PFILE; para2: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_read_dense2(f: PFILE; dtype: longint; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_read_dense2(para1: PFILE; para2: longint; para3: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_read_matrix(f: PFILE; prefer: longint; mtype: Plongint; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_read_matrix(para1: PFILE; para2: longint; para3: Plongint; para4: Pcholmod_common): pointer; cdecl; external libcholmod;

function cholmod_read_matrix2(f: PFILE; prefer: longint; dtype: longint; mtype: Plongint; Common: Pcholmod_common): pointer; cdecl; external libcholmod;
function cholmod_l_read_matrix2(para1: PFILE; para2: longint; para3: longint; para4: Plongint; para5: Pcholmod_common): pointer; cdecl; external libcholmod;

const
  CHOLMOD_MM_RECTANGULAR = 1;
  CHOLMOD_MM_UNSYMMETRIC = 2;
  CHOLMOD_MM_SYMMETRIC = 3;
  CHOLMOD_MM_HERMITIAN = 4;
  CHOLMOD_MM_SKEW_SYMMETRIC = 5;
  CHOLMOD_MM_SYMMETRIC_POSDIAG = 6;
  CHOLMOD_MM_HERMITIAN_POSDIAG = 7;

function cholmod_write_sparse(f: PFILE; A: Pcholmod_sparse; Z: Pcholmod_sparse; comments: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_write_sparse(para1: PFILE; para2: Pcholmod_sparse; para3: Pcholmod_sparse; c: pchar; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_write_dense(f: PFILE; X: Pcholmod_dense; comments: pchar; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_write_dense(para1: PFILE; para2: Pcholmod_dense; para3: pchar; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_analyze(A: Pcholmod_sparse; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_analyze(para1: Pcholmod_sparse; para2: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_analyze_p(A: Pcholmod_sparse; UserPerm: Pint32_t; fset: Pint32_t; fsize: Tsize_t; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_analyze_p(para1: Pcholmod_sparse; para2: Pint64_t; para3: Pint64_t; para4: Tsize_t; para5: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_analyze_p2(for_whom: longint; A: Pcholmod_sparse; UserPerm: Pint32_t; fset: Pint32_t; fsize: Tsize_t; Common: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;
function cholmod_l_analyze_p2(para1: longint; para2: Pcholmod_sparse; para3: Pint64_t; para4: Pint64_t; para5: Tsize_t; para6: Pcholmod_common): Pcholmod_factor; cdecl; external libcholmod;

function cholmod_factorize(A: Pcholmod_sparse; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_factorize(para1: Pcholmod_sparse; para2: Pcholmod_factor; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_factorize_p(A: Pcholmod_sparse; beta: Pdouble; fset: Pint32_t; fsize: Tsize_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_factorize_p(para1: Pcholmod_sparse; para2: Pdouble; para3: Pint64_t; para4: Tsize_t; para5: Pcholmod_factor; para6: Pcholmod_common): longint; cdecl; external libcholmod;

const
  CHOLMOD_A = 0;
  CHOLMOD_LDLt = 1;
  CHOLMOD_LD = 2;
  CHOLMOD_DLt = 3;
  CHOLMOD_L = 4;
  CHOLMOD_Lt = 5;
  CHOLMOD_D = 6;
  CHOLMOD_P = 7;
  CHOLMOD_Pt = 8;

function cholmod_solve(sys: longint; L: Pcholmod_factor; B: Pcholmod_dense; Common: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;
function cholmod_l_solve(para1: longint; para2: Pcholmod_factor; para3: Pcholmod_dense; para4: Pcholmod_common): Pcholmod_dense; cdecl; external libcholmod;

function cholmod_solve2(sys: longint; L: Pcholmod_factor; B: Pcholmod_dense; Bset: Pcholmod_sparse; X_Handle: PPcholmod_dense;
  Xset_Handle: PPcholmod_sparse; Y_Handle: PPcholmod_dense; E_Handle: PPcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_solve2(para1: longint; para2: Pcholmod_factor; para3: Pcholmod_dense; para4: Pcholmod_sparse; para5: PPcholmod_dense;
  para6: PPcholmod_sparse; para7: PPcholmod_dense; para8: PPcholmod_dense; para9: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_spsolve(sys: longint; L: Pcholmod_factor; B: Pcholmod_sparse; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_spsolve(para1: longint; para2: Pcholmod_factor; para3: Pcholmod_sparse; para4: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_etree(A: Pcholmod_sparse; Parent: Pint32_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_etree(para1: Pcholmod_sparse; para2: Pint64_t; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowcolcounts(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; Parent: Pint32_t; Post: Pint32_t;
  RowCount: Pint32_t; ColCount: Pint32_t; First: Pint32_t; Level: Pint32_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowcolcounts(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pint64_t; para7: Pint64_t; para8: Pint64_t; para9: Pint64_t; para10: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_analyze_ordering(A: Pcholmod_sparse; ordering: longint; Perm: Pint32_t; fset: Pint32_t; fsize: Tsize_t;
  Parent: Pint32_t; Post: Pint32_t; ColCount: Pint32_t; First: Pint32_t; Level: Pint32_t;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_analyze_ordering(para1: Pcholmod_sparse; para2: longint; para3: Pint64_t; para4: Pint64_t; para5: Tsize_t;
  para6: Pint64_t; para7: Pint64_t; para8: Pint64_t; para9: Pint64_t; para10: Pint64_t;
  para11: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_amd(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; Perm: Pint32_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_amd(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Pint64_t; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_colamd(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; postorder: longint; Perm: Pint32_t;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_colamd(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pint64_t;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowfac(A: Pcholmod_sparse; F: Pcholmod_sparse; beta: Pdouble; kstart: Tsize_t; kend: Tsize_t;
  L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowfac(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pdouble; para4: Tsize_t; para5: Tsize_t;
  para6: Pcholmod_factor; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowfac_mask(A: Pcholmod_sparse; F: Pcholmod_sparse; beta: Pdouble; kstart: Tsize_t; kend: Tsize_t;
  mask: Pint32_t; RLinkUp: Pint32_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowfac_mask(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pdouble; para4: Tsize_t; para5: Tsize_t;
  para6: Pint64_t; para7: Pint64_t; para8: Pcholmod_factor; para9: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowfac_mask2(A: Pcholmod_sparse; F: Pcholmod_sparse; beta: Pdouble; kstart: Tsize_t; kend: Tsize_t;
  mask: Pint32_t; maskmark: Tint32_t; RLinkUp: Pint32_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowfac_mask2(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pdouble; para4: Tsize_t; para5: Tsize_t;
  para6: Pint64_t; para7: Tint64_t; para8: Pint64_t; para9: Pcholmod_factor; para10: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_row_subtree(A: Pcholmod_sparse; F: Pcholmod_sparse; krow: Tsize_t; Parent: Pint32_t; R: Pcholmod_sparse;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_row_subtree(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Tsize_t; para4: Pint64_t; para5: Pcholmod_sparse;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_lsolve_pattern(B: Pcholmod_sparse; L: Pcholmod_factor; Yset: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_lsolve_pattern(para1: Pcholmod_sparse; para2: Pcholmod_factor; para3: Pcholmod_sparse; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_row_lsubtree(A: Pcholmod_sparse; Fi: Pint32_t; fnz: Tsize_t; krow: Tsize_t; L: Pcholmod_factor;
  R: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_row_lsubtree(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Tsize_t; para5: Pcholmod_factor;
  para6: Pcholmod_sparse; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_resymbol(A: Pcholmod_sparse; fset: Plongint; fsize: Tsize_t; pack: longint; L: Pcholmod_factor;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_resymbol(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pcholmod_factor;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_resymbol_noperm(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; pack: longint; L: Pcholmod_factor;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_resymbol_noperm(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pcholmod_factor;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rcond(L: Pcholmod_factor; Common: Pcholmod_common): double; cdecl; external libcholmod;
function cholmod_l_rcond(para1: Pcholmod_factor; para2: Pcholmod_common): double; cdecl; external libcholmod;

function cholmod_postorder(Parent: Pint32_t; n: Tsize_t; Weight: Pint32_t; Post: Pint32_t; Common: Pcholmod_common): Tint32_t; cdecl; external libcholmod;
function cholmod_l_postorder(para1: Pint64_t; para2: Tsize_t; para3: Pint64_t; para4: Pint64_t; para5: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_drop(tol: double; A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_drop(para1: double; para2: Pcholmod_sparse; para3: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_norm_dense(X: Pcholmod_dense; norm: longint; Common: Pcholmod_common): double; cdecl; external libcholmod;
function cholmod_l_norm_dense(para1: Pcholmod_dense; para2: longint; para3: Pcholmod_common): double; cdecl; external libcholmod;

function cholmod_norm_sparse(A: Pcholmod_sparse; norm: longint; Common: Pcholmod_common): double; cdecl; external libcholmod;
function cholmod_l_norm_sparse(para1: Pcholmod_sparse; para2: longint; para3: Pcholmod_common): double; cdecl; external libcholmod;

function cholmod_horzcat(A: Pcholmod_sparse; B: Pcholmod_sparse; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_horzcat(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: longint; para4: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

const
  CHOLMOD_SCALAR = 0;
  CHOLMOD_ROW = 1;
  CHOLMOD_COL = 2;
  CHOLMOD_SYM = 3;

function cholmod_scale(S: Pcholmod_dense; scale: longint; A: Pcholmod_sparse; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_scale(para1: Pcholmod_dense; para2: longint; para3: Pcholmod_sparse; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_sdmult(A: Pcholmod_sparse; transpose: longint; alpha: Pdouble; beta: Pdouble; X: Pcholmod_dense;
  Y: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_sdmult(para1: Pcholmod_sparse; para2: longint; para3: Pdouble; para4: Pdouble; para5: Pcholmod_dense;
  Y: Pcholmod_dense; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_ssmult(A: Pcholmod_sparse; B: Pcholmod_sparse; stype: longint; mode: longint; sorted: longint;
  Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_ssmult(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: longint; para4: longint; para5: longint;
  para6: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_submatrix(A: Pcholmod_sparse; rset: Pint32_t; rsize: Tint64_t; cset: Pint32_t; csize: Tint64_t;
  mode: longint; sorted: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_submatrix(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tint64_t; para4: Pint64_t; para5: Tint64_t;
  para6: longint; para7: longint; para8: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_vertcat(A: Pcholmod_sparse; B: Pcholmod_sparse; mode: longint; Common: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;
function cholmod_l_vertcat(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: longint; para4: Pcholmod_common): Pcholmod_sparse; cdecl; external libcholmod;

function cholmod_symmetry(A: Pcholmod_sparse; option: longint; xmatched: Pint32_t; pmatched: Pint32_t; nzoffdiag: Pint32_t;
  nzdiag: Pint32_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_symmetry(para1: Pcholmod_sparse; para2: longint; para3: Pint64_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pint64_t; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_updown(update: longint; C: Pcholmod_sparse; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_updown(para1: longint; para2: Pcholmod_sparse; para3: Pcholmod_factor; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_updown_solve(update: longint; C: Pcholmod_sparse; L: Pcholmod_factor; X: Pcholmod_dense; DeltaB: Pcholmod_dense;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_updown_solve(para1: longint; para2: Pcholmod_sparse; para3: Pcholmod_factor; para4: Pcholmod_dense; para5: Pcholmod_dense;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_updown_mark(update: longint; C: Pcholmod_sparse; colmark: Pint32_t; L: Pcholmod_factor; X: Pcholmod_dense;
  DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_updown_mark(para1: longint; para2: Pcholmod_sparse; para3: Pint64_t; para4: Pcholmod_factor; para5: Pcholmod_dense;
  para6: Pcholmod_dense; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_updown_mask(update: longint; C: Pcholmod_sparse; colmark: Pint32_t; mask: Pint32_t; L: Pcholmod_factor;
  X: Pcholmod_dense; DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_updown_mask(para1: longint; para2: Pcholmod_sparse; para3: Pint64_t; para4: Pint64_t; para5: Pcholmod_factor;
  para6: Pcholmod_dense; para7: Pcholmod_dense; para8: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_updown_mask2(update: longint; C: Pcholmod_sparse; colmark: Pint32_t; mask: Pint32_t; maskmark: Tint32_t;
  L: Pcholmod_factor; X: Pcholmod_dense; DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_updown_mask2(para1: longint; para2: Pcholmod_sparse; para3: Pint64_t; para4: Pint64_t; para5: Tint64_t;
  para6: Pcholmod_factor; para7: Pcholmod_dense; para8: Pcholmod_dense; para9: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowadd(k: Tsize_t; R: Pcholmod_sparse; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowadd(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pcholmod_factor; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowadd_solve(k: Tsize_t; R: Pcholmod_sparse; bk: Pdouble; L: Pcholmod_factor; X: Pcholmod_dense;
  DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowadd_solve(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pdouble; para4: Pcholmod_factor; para5: Pcholmod_dense;
  para6: Pcholmod_dense; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowadd_mark(k: Tsize_t; R: Pcholmod_sparse; bk: Pdouble; colmark: Pint32_t; L: Pcholmod_factor;
  X: Pcholmod_dense; DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowadd_mark(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pdouble; para4: Pint64_t; para5: Pcholmod_factor;
  para6: Pcholmod_dense; para7: Pcholmod_dense; para8: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowdel(k: Tsize_t; R: Pcholmod_sparse; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowdel(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pcholmod_factor; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowdel_solve(k: Tsize_t; R: Pcholmod_sparse; yk: Pdouble; L: Pcholmod_factor; X: Pcholmod_dense;
  DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowdel_solve(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pdouble; para4: Pcholmod_factor; para5: Pcholmod_dense;
  para6: Pcholmod_dense; para7: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_rowdel_mark(k: Tsize_t; R: Pcholmod_sparse; yk: Pdouble; colmark: Pint32_t; L: Pcholmod_factor;
  X: Pcholmod_dense; DeltaB: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_rowdel_mark(para1: Tsize_t; para2: Pcholmod_sparse; para3: Pdouble; para4: Pint64_t; para5: Pcholmod_factor;
  para6: Pcholmod_dense; para7: Pcholmod_dense; para8: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_ccolamd(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; Cmember: Pint32_t; Perm: Pint32_t;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_ccolamd(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_csymamd(A: Pcholmod_sparse; Cmember: Pint32_t; Perm: Pint32_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_csymamd(para1: Pcholmod_sparse; para2: Pint64_t; para3: Pint64_t; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_camd(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; Cmember: Pint32_t; Perm: Pint32_t;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_camd(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_nested_dissection(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; Perm: Pint32_t; CParent: Pint32_t;
  Cmember: Pint32_t; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_nested_dissection(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pint64_t; para7: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_metis(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; postorder: longint; Perm: Pint32_t;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_metis(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pint64_t;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_bisect(A: Pcholmod_sparse; fset: Pint32_t; fsize: Tsize_t; compress: longint; Partition: Pint32_t;
  Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_bisect(para1: Pcholmod_sparse; para2: Pint64_t; para3: Tsize_t; para4: longint; para5: Pint64_t;
  para6: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_metis_bisector(A: Pcholmod_sparse; Anw: Pint32_t; Aew: Pint32_t; Partition: Pint32_t; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_metis_bisector(para1: Pcholmod_sparse; para2: Pint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_collapse_septree(n: Tsize_t; ncomponents: Tsize_t; nd_oksep: double; nd_small: Tsize_t; CParent: Pint32_t;
  Cmember: Pint32_t; Common: Pcholmod_common): Tint64_t; cdecl; external libcholmod;
function cholmod_l_collapse_septree(para1: Tsize_t; para2: Tsize_t; para3: double; para4: Tsize_t; para5: Pint64_t;
  para6: Pint64_t; para7: Pcholmod_common): Tint64_t; cdecl; external libcholmod;

function cholmod_super_symbolic(A: Pcholmod_sparse; F: Pcholmod_sparse; Parent: Pint32_t; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_super_symbolic(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pint64_t; para4: Pcholmod_factor; para5: Pcholmod_common): longint; cdecl; external libcholmod;

const
  CHOLMOD_ANALYZE_FOR_SPQR = 0;
  CHOLMOD_ANALYZE_FOR_CHOLESKY = 1;
  CHOLMOD_ANALYZE_FOR_SPQRGPU = 2;

function cholmod_super_symbolic2(for_whom: longint; A: Pcholmod_sparse; F: Pcholmod_sparse; Parent: Pint32_t; L: Pcholmod_factor;
  Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_super_symbolic2(para1: longint; para2: Pcholmod_sparse; para3: Pcholmod_sparse; para4: Pint64_t; para5: Pcholmod_factor;
  para6: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_super_numeric(A: Pcholmod_sparse; F: Pcholmod_sparse; beta: Pdouble; L: Pcholmod_factor; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_super_numeric(para1: Pcholmod_sparse; para2: Pcholmod_sparse; para3: Pdouble; para4: Pcholmod_factor; para5: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_super_lsolve(L: Pcholmod_factor; X: Pcholmod_dense; E: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_super_lsolve(para1: Pcholmod_factor; para2: Pcholmod_dense; para3: Pcholmod_dense; para4: Pcholmod_common): longint; cdecl; external libcholmod;

function cholmod_super_ltsolve(L: Pcholmod_factor; X: Pcholmod_dense; E: Pcholmod_dense; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_super_ltsolve(para1: Pcholmod_factor; para2: Pcholmod_dense; para3: Pcholmod_dense; para4: Pcholmod_common): longint; cdecl; external libcholmod;

type
  Tcholmod_descendant_score_t = record
    score: double;
    d: Tint64_t;
  end;
  Pcholmod_descendant_score_t = ^Tcholmod_descendant_score_t;

  TdescendantScore = Tcholmod_descendant_score_t;
  PdescendantScore = ^TdescendantScore;

function cholmod_score_comp(i: Pcholmod_descendant_score_t; j: Pcholmod_descendant_score_t): longint; cdecl; external libcholmod;
function cholmod_l_score_comp(i: Pcholmod_descendant_score_t; j: Pcholmod_descendant_score_t): longint; cdecl; external libcholmod;

const
  CHOLMOD_ND_ROW_LIMIT = 256;
  CHOLMOD_ND_COL_LIMIT = 32;
  CHOLMOD_POTRF_LIMIT = 512;
  CHOLMOD_GPU_SKIP = 3;

type
  Tcholmod_gpu_pointers = record
    h_Lx: array[0..(CHOLMOD_HOST_SUPERNODE_BUFFERS) - 1] of Pdouble;
    d_Lx: array[0..(CHOLMOD_DEVICE_STREAMS) - 1] of Pdouble;
    d_C: Pdouble;
    d_A: array[0..(CHOLMOD_DEVICE_STREAMS) - 1] of Pdouble;
    d_Ls: pointer;
    d_Map: pointer;
    d_RelativeMap: pointer;
  end;
  Pcholmod_gpu_pointers = ^Tcholmod_gpu_pointers;

function cholmod_gpu_memorysize(total_mem: Psize_t; available_mem: Psize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_memorysize(total_mem: Psize_t; available_mem: Psize_t; Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_gpu_probe(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_probe(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_gpu_deallocate(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_deallocate(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_gpu_start(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_start(Common: Pcholmod_common): longint; cdecl; external libcholmod;
procedure cholmod_gpu_end(Common: Pcholmod_common); cdecl; external libcholmod;
procedure cholmod_l_gpu_end(Common: Pcholmod_common); cdecl; external libcholmod;
function cholmod_gpu_allocate(Common: Pcholmod_common): longint; cdecl; external libcholmod;
function cholmod_l_gpu_allocate(Common: Pcholmod_common): longint; cdecl; external libcholmod;

// === Konventiert am: 4-11-25 19:28:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function CHOLMOD_VER_CODE(main, sub: longint): longint;
begin
  CHOLMOD_VER_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function CHOLMOD_VERSION: longint;
begin
  CHOLMOD_VERSION := CHOLMOD_VER_CODE(5, 2);
end;

function CHOLMOD_IS_ZERO(x: longint): boolean;
begin
  CHOLMOD_IS_ZERO := x = 0.0;
end;

function CHOLMOD_IS_NONZERO(x: longint): boolean;
begin
  CHOLMOD_IS_NONZERO := x <> 0.0;
end;

function CHOLMOD_IS_LT_ZERO(x: longint): boolean;
begin
  CHOLMOD_IS_LT_ZERO := x < 0.0;
end;

function CHOLMOD_IS_GT_ZERO(x: longint): boolean;
begin
  CHOLMOD_IS_GT_ZERO := x > 0.0;
end;

function CHOLMOD_IS_LE_ZERO(x: longint): boolean;
begin
  CHOLMOD_IS_LE_ZERO := x <= 0.0;
end;


{$ENDIF read_implementation}
