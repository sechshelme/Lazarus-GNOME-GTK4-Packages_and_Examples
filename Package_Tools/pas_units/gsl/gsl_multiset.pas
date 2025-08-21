unit gsl_multiset;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_multiset_struct = record
    n: Tsize_t;
    k: Tsize_t;
    data: Psize_t;
  end;
  Pgsl_multiset_struct = ^Tgsl_multiset_struct;

  Tgsl_multiset = Tgsl_multiset_struct;
  Pgsl_multiset = ^Tgsl_multiset;

function gsl_multiset_alloc(n: Tsize_t; k: Tsize_t): Pgsl_multiset; cdecl; external libgsl;
function gsl_multiset_calloc(n: Tsize_t; k: Tsize_t): Pgsl_multiset; cdecl; external libgsl;
procedure gsl_multiset_init_first(c: Pgsl_multiset); cdecl; external libgsl;
procedure gsl_multiset_init_last(c: Pgsl_multiset); cdecl; external libgsl;
procedure gsl_multiset_free(c: Pgsl_multiset); cdecl; external libgsl;
function gsl_multiset_memcpy(dest: Pgsl_multiset; src: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_fread(stream: PFILE; c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_fwrite(stream: PFILE; c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_fscanf(stream: PFILE; c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_fprintf(stream: PFILE; c: Pgsl_multiset; format: pchar): longint; cdecl; external libgsl;
function gsl_multiset_n(c: Pgsl_multiset): Tsize_t; cdecl; external libgsl;
function gsl_multiset_k(c: Pgsl_multiset): Tsize_t; cdecl; external libgsl;
function gsl_multiset_data(c: Pgsl_multiset): Psize_t; cdecl; external libgsl;
function gsl_multiset_valid(c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_next(c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_prev(c: Pgsl_multiset): longint; cdecl; external libgsl;
function gsl_multiset_get(c: Pgsl_multiset; i: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 21-8-25 19:43:47 ===


implementation



end.
