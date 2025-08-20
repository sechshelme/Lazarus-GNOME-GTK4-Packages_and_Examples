unit gsl_vector_char;

interface

uses
  fp_gsl, gsl_block_char;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_vector_char = record
    size: Tsize_t;
    stride: Tsize_t;
    data: pchar;
    block: Pgsl_block_char;
    owner: longint;
  end;
  Pgsl_vector_char = ^Tgsl_vector_char;

  Tgsl_vector_char_view = record
    vector: Tgsl_vector_char;
  end;
  Pgsl_vector_char_view = ^Tgsl_vector_char_view;

  Tgsl_vector_char_const_view = record
    vector: Tgsl_vector_char;
  end;
  Pgsl_vector_char_const_view = ^Tgsl_vector_char_const_view;


function gsl_vector_char_alloc(n: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
function gsl_vector_char_calloc(n: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
function gsl_vector_char_alloc_from_block(b: Pgsl_block_char; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
function gsl_vector_char_alloc_from_vector(v: Pgsl_vector_char; offset: Tsize_t; n: Tsize_t; stride: Tsize_t): Pgsl_vector_char; cdecl; external libgsl;
procedure gsl_vector_char_free(v: Pgsl_vector_char); cdecl; external libgsl;

function gsl_vector_char_view_array(v: pchar; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_vector_char_view_array_with_stride(base: pchar; stride: Tsize_t; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_vector_char_const_view_array(v: pchar; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_vector_char_const_view_array_with_stride(base: pchar; stride: Tsize_t; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_vector_char_subvector(v: Pgsl_vector_char; i: Tsize_t; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_vector_char_subvector_with_stride(v: Pgsl_vector_char; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_char_view; cdecl; external libgsl;
function gsl_vector_char_const_subvector(v: Pgsl_vector_char; i: Tsize_t; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;
function gsl_vector_char_const_subvector_with_stride(v: Pgsl_vector_char; i: Tsize_t; stride: Tsize_t; n: Tsize_t): Tgsl_vector_char_const_view; cdecl; external libgsl;

procedure gsl_vector_char_set_zero(v: Pgsl_vector_char); cdecl; external libgsl;
procedure gsl_vector_char_set_all(v: Pgsl_vector_char; x: char); cdecl; external libgsl;
function gsl_vector_char_set_basis(v: Pgsl_vector_char; i: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_char_fread(stream: PFILE; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_fwrite(stream: PFILE; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_fscanf(stream: PFILE; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_fprintf(stream: PFILE; v: Pgsl_vector_char; format: pchar): longint; cdecl; external libgsl;
function gsl_vector_char_memcpy(dest: Pgsl_vector_char; src: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_reverse(v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_swap(v: Pgsl_vector_char; w: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_swap_elements(v: Pgsl_vector_char; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_vector_char_max(v: Pgsl_vector_char): char; cdecl; external libgsl;
function gsl_vector_char_min(v: Pgsl_vector_char): char; cdecl; external libgsl;
procedure gsl_vector_char_minmax(v: Pgsl_vector_char; min_out: pchar; max_out: pchar); cdecl; external libgsl;
function gsl_vector_char_max_index(v: Pgsl_vector_char): Tsize_t; cdecl; external libgsl;
function gsl_vector_char_min_index(v: Pgsl_vector_char): Tsize_t; cdecl; external libgsl;
procedure gsl_vector_char_minmax_index(v: Pgsl_vector_char; imin: Psize_t; imax: Psize_t); cdecl; external libgsl;
function gsl_vector_char_add(a: Pgsl_vector_char; b: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_sub(a: Pgsl_vector_char; b: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_mul(a: Pgsl_vector_char; b: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_div(a: Pgsl_vector_char; b: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_scale(a: Pgsl_vector_char; x: char): longint; cdecl; external libgsl;
function gsl_vector_char_add_constant(a: Pgsl_vector_char; x: char): longint; cdecl; external libgsl;
function gsl_vector_char_axpby(alpha: char; x: Pgsl_vector_char; beta: char; y: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_sum(a: Pgsl_vector_char): char; cdecl; external libgsl;
function gsl_vector_char_equal(u: Pgsl_vector_char; v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_isnull(v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_ispos(v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_isneg(v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_isnonneg(v: Pgsl_vector_char): longint; cdecl; external libgsl;
function gsl_vector_char_get(v: Pgsl_vector_char; i: Tsize_t): char; cdecl; external libgsl;
procedure gsl_vector_char_set(v: Pgsl_vector_char; i: Tsize_t; x: char); cdecl; external libgsl;
function gsl_vector_char_ptr(v: Pgsl_vector_char; i: Tsize_t): pchar; cdecl; external libgsl;
function gsl_vector_char_const_ptr(v: Pgsl_vector_char; i: Tsize_t): pchar; cdecl; external libgsl;

// === Konventiert am: 20-8-25 16:48:01 ===


implementation



end.
