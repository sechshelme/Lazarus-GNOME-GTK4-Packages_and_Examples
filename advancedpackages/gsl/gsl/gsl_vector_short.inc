{$IFDEF read_interface}


type
  Tgsl_vector_short = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Psmallint;
    block: Pgsl_block_short;
    owner: longint;
  end;
  Pgsl_vector_short = ^Tgsl_vector_short;

  Tgsl_vector_short_view = record
    vector: Tgsl_vector_short;
  end;
  Pgsl_vector_short_view = ^Tgsl_vector_short_view;

  Tgsl_vector_short_const_view = record
    vector: Tgsl_vector_short;
  end;
  Pgsl_vector_short_const_view = ^Tgsl_vector_short_const_view;


function gsl_vector_short_alloc(n: Tsize_t): Pgsl_vector_short; cdecl; external libgsl;
function gsl_vector_short_calloc(n: Tsize_t): Pgsl_vector_short; cdecl; external libgsl;
function gsl_vector_short_alloc_from_block(b: Pgsl_block_short; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_short; cdecl; external libgsl;
function gsl_vector_short_alloc_from_vector(v: Pgsl_vector_short; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_short; cdecl; external libgsl;
procedure gsl_vector_short_free(v: Pgsl_vector_short); cdecl; external libgsl;

function gsl_vector_short_view_array(v: Psmallint; n: Tsize_t): Tgsl_vector_short_view; cdecl; external libgsl;
function gsl_vector_short_view_array_with_stride(base: Psmallint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_short_view; cdecl; external libgsl;
function gsl_vector_short_const_view_array(v: Psmallint; n: Tsize_t): Tgsl_vector_short_const_view; cdecl; external libgsl;
function gsl_vector_short_const_view_array_with_stride(base: Psmallint; stride: Tsize_t; n: Tsize_t): Tgsl_vector_short_const_view; cdecl; external libgsl;
function gsl_vector_short_subvector(v: Pgsl_vector_short; i: Tsize_t; n: Tsize_t): Tgsl_vector_short_view; cdecl; external libgsl;
function gsl_vector_short_subvector_with_stride(v: Pgsl_vector_short; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_short_view; cdecl; external libgsl;
function gsl_vector_short_const_subvector(v: Pgsl_vector_short; i: Tsize_t; n: Tsize_t): Tgsl_vector_short_const_view; cdecl; external libgsl;
function gsl_vector_short_const_subvector_with_stride(v: Pgsl_vector_short; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_short_const_view; cdecl; external libgsl;

procedure gsl_vector_short_set_zero(v: Pgsl_vector_short); cdecl; external libgsl;
procedure gsl_vector_short_set_all(v: Pgsl_vector_short; x: smallint); cdecl; external libgsl;
function gsl_vector_short_set_basis(v: Pgsl_vector_short; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_short_fread(stream: PFILE; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_fwrite(stream: PFILE; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_fscanf(stream: PFILE; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_fprintf(stream: PFILE; v: Pgsl_vector_short; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_short_memcpy(dest: Pgsl_vector_short; src: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_reverse(v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_swap(v: Pgsl_vector_short; w: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_swap_elements(v: Pgsl_vector_short; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_short_max(v: Pgsl_vector_short): smallint; cdecl; external libgsl;
function gsl_vector_short_min(v: Pgsl_vector_short): smallint; cdecl; external libgsl;
procedure gsl_vector_short_minmax(v: Pgsl_vector_short; min_out: Psmallint; max_out: Psmallint); cdecl; external libgsl;
function gsl_vector_short_max_index(v: Pgsl_vector_short): Tsize_t; cdecl; external libgsl;
function gsl_vector_short_min_index(v: Pgsl_vector_short): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_short_minmax_index(v: Pgsl_vector_short; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_short_add(a: Pgsl_vector_short; b: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_sub(a: Pgsl_vector_short; b: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_mul(a: Pgsl_vector_short; b: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_div(a: Pgsl_vector_short; b: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_scale(a: Pgsl_vector_short; x: smallint): longint; cdecl; external libgsl;
function gsl_vector_short_add_constant(a: Pgsl_vector_short; x: smallint): longint; cdecl; external libgsl;
function gsl_vector_short_axpby(alpha: smallint; x: Pgsl_vector_short; beta: smallint; y: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_sum(a: Pgsl_vector_short): smallint; cdecl; external libgsl;
function gsl_vector_short_equal(u: Pgsl_vector_short; v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_isnull(v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_ispos(v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_isneg(v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_isnonneg(v: Pgsl_vector_short): longint; cdecl; external libgsl;
function gsl_vector_short_get(v: Pgsl_vector_short; i: Tsize_t): smallint; cdecl; external libgsl;
procedure gsl_vector_short_set(v: Pgsl_vector_short; i: Tsize_t; x: smallint); cdecl; external libgsl;
function gsl_vector_short_ptr(v: Pgsl_vector_short; i: Tsize_t): Psmallint; cdecl; external libgsl;
function gsl_vector_short_const_ptr(v: Pgsl_vector_short; i: Tsize_t): Psmallint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
