unit gsl_permutation;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_permutation_struct = record
    size: Tsize_t;
    data: Psize_t;
  end;
  Pgsl_permutation_struct = ^Tgsl_permutation_struct;

  Tgsl_permutation = Tgsl_permutation_struct;
  Pgsl_permutation = ^Tgsl_permutation;

function gsl_permutation_alloc(n: Tsize_t): Pgsl_permutation; cdecl; external libgsl;
function gsl_permutation_calloc(n: Tsize_t): Pgsl_permutation; cdecl; external libgsl;
procedure gsl_permutation_init(p: Pgsl_permutation); cdecl; external libgsl;
procedure gsl_permutation_free(p: Pgsl_permutation); cdecl; external libgsl;
function gsl_permutation_memcpy(dest: Pgsl_permutation; src: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_fread(stream: PFILE; p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_fwrite(stream: PFILE; p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_fscanf(stream: PFILE; p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_fprintf(stream: PFILE; p: Pgsl_permutation; format: pchar): longint; cdecl; external libgsl;
function gsl_permutation_size(p: Pgsl_permutation): Tsize_t; cdecl; external libgsl;
function gsl_permutation_data(p: Pgsl_permutation): Psize_t; cdecl; external libgsl;
function gsl_permutation_swap(p: Pgsl_permutation; i: Tsize_t; j: Tsize_t): longint; cdecl; external libgsl;
function gsl_permutation_valid(p: Pgsl_permutation): longint; cdecl; external libgsl;
procedure gsl_permutation_reverse(p: Pgsl_permutation); cdecl; external libgsl;
function gsl_permutation_inverse(inv: Pgsl_permutation; p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_next(p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_prev(p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_mul(p: Pgsl_permutation; pa: Pgsl_permutation; pb: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_linear_to_canonical(q: Pgsl_permutation; p: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_canonical_to_linear(p: Pgsl_permutation; q: Pgsl_permutation): longint; cdecl; external libgsl;
function gsl_permutation_inversions(p: Pgsl_permutation): Tsize_t; cdecl; external libgsl;
function gsl_permutation_linear_cycles(p: Pgsl_permutation): Tsize_t; cdecl; external libgsl;
function gsl_permutation_canonical_cycles(q: Pgsl_permutation): Tsize_t; cdecl; external libgsl;
function gsl_permutation_get(p: Pgsl_permutation; i: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 21-8-25 14:54:39 ===


implementation



end.
