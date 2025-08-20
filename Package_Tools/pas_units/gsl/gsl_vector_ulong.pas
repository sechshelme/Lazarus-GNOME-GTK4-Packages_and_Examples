unit gsl_vector_ulong;

interface

uses
  fp_gsl, gsl_block_ulong;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_ulong = record
    size: Tsize_t;
    stride: Tsize_t;
    data: Pdword;
    block: Pgsl_block_ulong;
    owner: longint;
  end;
  Pgsl_vector_ulong = ^Tgsl_vector_ulong;

  Tgsl_vector_ulong_view = record
    vector: Tgsl_vector_ulong;
  end;
  Pgsl_vector_ulong_view = ^Tgsl_vector_ulong_view;

  Tgsl_vector_ulong_const_view = record
    vector: Tgsl_vector_ulong;
  end;
  Pgsl_vector_ulong_const_view = ^Tgsl_vector_ulong_const_view;


function gsl_vector_ulong_alloc(n: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
function gsl_vector_ulong_calloc(n: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
function gsl_vector_ulong_alloc_from_block(b: Pgsl_block_ulong; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
function gsl_vector_ulong_alloc_from_vector(v: Pgsl_vector_ulong; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_ulong; cdecl; external libgsl;
procedure gsl_vector_ulong_free(v: Pgsl_vector_ulong); cdecl; external libgsl;

function gsl_vector_ulong_view_array(v: Pdword; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_vector_ulong_view_array_with_stride(base: Pdword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_vector_ulong_const_view_array(v: Pdword; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_vector_ulong_const_view_array_with_stride(base: Pdword; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_vector_ulong_subvector(v: Pgsl_vector_ulong; i: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_vector_ulong_subvector_with_stride(v: Pgsl_vector_ulong; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_view; cdecl; external libgsl;
function gsl_vector_ulong_const_subvector(v: Pgsl_vector_ulong; i: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;
function gsl_vector_ulong_const_subvector_with_stride(v: Pgsl_vector_ulong; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_ulong_const_view; cdecl; external libgsl;

procedure gsl_vector_ulong_set_zero(v: Pgsl_vector_ulong); cdecl; external libgsl;
procedure gsl_vector_ulong_set_all(v: Pgsl_vector_ulong; x: dword); cdecl; external libgsl;
function gsl_vector_ulong_set_basis(v: Pgsl_vector_ulong; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_ulong_fread(stream: PFILE; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_fwrite(stream: PFILE; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_fscanf(stream: PFILE; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_fprintf(stream: PFILE; v: Pgsl_vector_ulong; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_ulong_memcpy(dest: Pgsl_vector_ulong; src: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_reverse(v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_swap(v: Pgsl_vector_ulong; w: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_swap_elements(v: Pgsl_vector_ulong; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_ulong_max(v: Pgsl_vector_ulong): dword; cdecl; external libgsl;
function gsl_vector_ulong_min(v: Pgsl_vector_ulong): dword; cdecl; external libgsl;
procedure gsl_vector_ulong_minmax(v: Pgsl_vector_ulong; min_out: Pdword; max_out: Pdword); cdecl; external libgsl;
function gsl_vector_ulong_max_index(v: Pgsl_vector_ulong): Tsize_t; cdecl; external libgsl;
function gsl_vector_ulong_min_index(v: Pgsl_vector_ulong): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_ulong_minmax_index(v: Pgsl_vector_ulong; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_ulong_add(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_sub(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_mul(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_div(a: Pgsl_vector_ulong; b: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_scale(a: Pgsl_vector_ulong; x: dword): longint; cdecl; external libgsl;
function gsl_vector_ulong_add_constant(a: Pgsl_vector_ulong; x: dword): longint; cdecl; external libgsl;
function gsl_vector_ulong_axpby(alpha: dword; x: Pgsl_vector_ulong; beta: dword; y: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_sum(a: Pgsl_vector_ulong): dword; cdecl; external libgsl;
function gsl_vector_ulong_equal(u: Pgsl_vector_ulong; v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_isnull(v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_ispos(v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_isneg(v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_isnonneg(v: Pgsl_vector_ulong): longint; cdecl; external libgsl;
function gsl_vector_ulong_get(v: Pgsl_vector_ulong; i: Tsize_t): dword; cdecl; external libgsl;
procedure gsl_vector_ulong_set(v: Pgsl_vector_ulong; i: Tsize_t; x: dword); cdecl; external libgsl;
function gsl_vector_ulong_ptr(v: Pgsl_vector_ulong; i: Tsize_t): Pdword; cdecl; external libgsl;
function gsl_vector_ulong_const_ptr(v: Pgsl_vector_ulong; i: Tsize_t): Pdword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:19 ===


implementation



end.
