{$IFDEF read_interface}


type
  Tgsl_vector_uchar = record
    size: Tsize_t;
    stride: Tsize_t;
    data: pbyte;
    block: Pgsl_block_uchar;
    owner: longint;
  end;
  Pgsl_vector_uchar = ^Tgsl_vector_uchar;

  Tgsl_vector_uchar_view = record
    vector: Tgsl_vector_uchar;
  end;
  Pgsl_vector_uchar_view = ^Tgsl_vector_uchar_view;

  Tgsl_vector_uchar_const_view = record
    vector: Tgsl_vector_uchar;
  end;
  Pgsl_vector_uchar_const_view = ^Tgsl_vector_uchar_const_view;


function gsl_vector_uchar_alloc(n: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
function gsl_vector_uchar_calloc(n: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
function gsl_vector_uchar_alloc_from_block(b: Pgsl_block_uchar; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
function gsl_vector_uchar_alloc_from_vector(v: Pgsl_vector_uchar; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_uchar; cdecl; external libgsl;
procedure gsl_vector_uchar_free(v: Pgsl_vector_uchar); cdecl; external libgsl;

function gsl_vector_uchar_view_array(v: pbyte; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_vector_uchar_view_array_with_stride(base: pbyte; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_vector_uchar_const_view_array(v: pbyte; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_vector_uchar_const_view_array_with_stride(base: pbyte; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_vector_uchar_subvector(v: Pgsl_vector_uchar; i: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_vector_uchar_subvector_with_stride(v: Pgsl_vector_uchar; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_view; cdecl; external libgsl;
function gsl_vector_uchar_const_subvector(v: Pgsl_vector_uchar; i: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;
function gsl_vector_uchar_const_subvector_with_stride(v: Pgsl_vector_uchar; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_uchar_const_view; cdecl; external libgsl;

procedure gsl_vector_uchar_set_zero(v: Pgsl_vector_uchar); cdecl; external libgsl;
procedure gsl_vector_uchar_set_all(v: Pgsl_vector_uchar; x: byte); cdecl; external libgsl;
function gsl_vector_uchar_set_basis(v: Pgsl_vector_uchar; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_uchar_fread(stream: PFILE; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_fwrite(stream: PFILE; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_fscanf(stream: PFILE; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_fprintf(stream: PFILE; v: Pgsl_vector_uchar; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_memcpy(dest: Pgsl_vector_uchar; src: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_reverse(v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_swap(v: Pgsl_vector_uchar; w: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_swap_elements(v: Pgsl_vector_uchar; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_uchar_max(v: Pgsl_vector_uchar): byte; cdecl; external libgsl;
function gsl_vector_uchar_min(v: Pgsl_vector_uchar): byte; cdecl; external libgsl;
procedure gsl_vector_uchar_minmax(v: Pgsl_vector_uchar; min_out: pbyte; max_out: pbyte); cdecl; external libgsl;
function gsl_vector_uchar_max_index(v: Pgsl_vector_uchar): Tsize_t; cdecl; external libgsl;
function gsl_vector_uchar_min_index(v: Pgsl_vector_uchar): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_uchar_minmax_index(v: Pgsl_vector_uchar; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_uchar_add(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_sub(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_mul(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_div(a: Pgsl_vector_uchar; b: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_scale(a: Pgsl_vector_uchar; x: byte): longint; cdecl; external libgsl;
function gsl_vector_uchar_add_constant(a: Pgsl_vector_uchar; x: byte): longint; cdecl; external libgsl;
function gsl_vector_uchar_axpby(alpha: byte; x: Pgsl_vector_uchar; beta: byte; y: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_sum(a: Pgsl_vector_uchar): byte; cdecl; external libgsl;
function gsl_vector_uchar_equal(u: Pgsl_vector_uchar; v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_isnull(v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_ispos(v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_isneg(v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_isnonneg(v: Pgsl_vector_uchar): longint; cdecl; external libgsl;
function gsl_vector_uchar_get(v: Pgsl_vector_uchar; i: Tsize_t): byte; cdecl; external libgsl;
procedure gsl_vector_uchar_set(v: Pgsl_vector_uchar; i: Tsize_t; x: byte); cdecl; external libgsl;
function gsl_vector_uchar_ptr(v: Pgsl_vector_uchar; i: Tsize_t): pbyte; cdecl; external libgsl;
function gsl_vector_uchar_const_ptr(v: Pgsl_vector_uchar; i: Tsize_t): pbyte; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
