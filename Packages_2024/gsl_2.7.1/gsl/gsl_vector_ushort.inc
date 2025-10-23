{$IFDEF read_interface}


type
  Tgsl_vector_ushort = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Pword;
    block: Pgsl_block_ushort;
    owner: longint;
  end;
  Pgsl_vector_ushort = ^Tgsl_vector_ushort;

  Tgsl_vector_ushort_view = record
    vector: Tgsl_vector_ushort;
  end;
  Pgsl_vector_ushort_view = ^Tgsl_vector_ushort_view;

  Tgsl_vector_ushort_const_view = record
    vector: Tgsl_vector_ushort;
  end;
  Pgsl_vector_ushort_const_view = ^Tgsl_vector_ushort_const_view;


function gsl_vector_ushort_alloc(n: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
function gsl_vector_ushort_calloc(n: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
function gsl_vector_ushort_alloc_from_block(b: Pgsl_block_ushort; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
function gsl_vector_ushort_alloc_from_vector(v: Pgsl_vector_ushort; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_ushort; cdecl; external libgsl;
procedure gsl_vector_ushort_free(v: Pgsl_vector_ushort); cdecl; external libgsl;

function gsl_vector_ushort_view_array(v: Pword; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_vector_ushort_view_array_with_stride(base: Pword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_vector_ushort_const_view_array(v: Pword; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_vector_ushort_const_view_array_with_stride(base: Pword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_vector_ushort_subvector(v: Pgsl_vector_ushort; i: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_vector_ushort_subvector_with_stride(v: Pgsl_vector_ushort; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_view; cdecl; external libgsl;
function gsl_vector_ushort_const_subvector(v: Pgsl_vector_ushort; i: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;
function gsl_vector_ushort_const_subvector_with_stride(v: Pgsl_vector_ushort; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ushort_const_view; cdecl; external libgsl;

procedure gsl_vector_ushort_set_zero(v: Pgsl_vector_ushort); cdecl; external libgsl;
procedure gsl_vector_ushort_set_all(v: Pgsl_vector_ushort; x: word); cdecl; external libgsl;
function gsl_vector_ushort_set_basis(v: Pgsl_vector_ushort; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_ushort_fread(stream: PFILE; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_fwrite(stream: PFILE; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_fscanf(stream: PFILE; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_fprintf(stream: PFILE; v: Pgsl_vector_ushort; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_ushort_memcpy(dest: Pgsl_vector_ushort; src: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_reverse(v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_swap(v: Pgsl_vector_ushort; w: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_swap_elements(v: Pgsl_vector_ushort; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_ushort_max(v: Pgsl_vector_ushort): word; cdecl; external libgsl;
function gsl_vector_ushort_min(v: Pgsl_vector_ushort): word; cdecl; external libgsl;
procedure gsl_vector_ushort_minmax(v: Pgsl_vector_ushort; min_out: Pword; max_out: Pword); cdecl; external libgsl;
function gsl_vector_ushort_max_index(v: Pgsl_vector_ushort): Tsize_t; cdecl; external libgsl;
function gsl_vector_ushort_min_index(v: Pgsl_vector_ushort): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_ushort_minmax_index(v: Pgsl_vector_ushort; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_ushort_add(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_sub(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_mul(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_div(a: Pgsl_vector_ushort; b: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_scale(a: Pgsl_vector_ushort; x: word): longint; cdecl; external libgsl;
function gsl_vector_ushort_add_constant(a: Pgsl_vector_ushort; x: word): longint; cdecl; external libgsl;
function gsl_vector_ushort_axpby(alpha: word; x: Pgsl_vector_ushort; beta: word; y: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_sum(a: Pgsl_vector_ushort): word; cdecl; external libgsl;
function gsl_vector_ushort_equal(u: Pgsl_vector_ushort; v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_isnull(v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_ispos(v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_isneg(v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_isnonneg(v: Pgsl_vector_ushort): longint; cdecl; external libgsl;
function gsl_vector_ushort_get(v: Pgsl_vector_ushort; i: Tsize_t): word; cdecl; external libgsl;
procedure gsl_vector_ushort_set(v: Pgsl_vector_ushort; i: Tsize_t; x: word); cdecl; external libgsl;
function gsl_vector_ushort_ptr(v: Pgsl_vector_ushort; i: Tsize_t): Pword; cdecl; external libgsl;
function gsl_vector_ushort_const_ptr(v: Pgsl_vector_ushort; i: Tsize_t): Pword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
