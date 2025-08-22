{$IFDEF read_interface}


type
  Tgsl_combination_struct = record
    n: Tsize_t;
    k: Tsize_t;
    data: Psize_t;
  end;
  Pgsl_combination_struct = ^Tgsl_combination_struct;

  Tgsl_combination = Tgsl_combination_struct;
  Pgsl_combination = ^Tgsl_combination;

function gsl_combination_alloc(n: Tsize_t; k: Tsize_t): Pgsl_combination; cdecl; external libgsl;
function gsl_combination_calloc(n: Tsize_t; k: Tsize_t): Pgsl_combination; cdecl; external libgsl;
procedure gsl_combination_init_first(c: Pgsl_combination); cdecl; external libgsl;
procedure gsl_combination_init_last(c: Pgsl_combination); cdecl; external libgsl;
procedure gsl_combination_free(c: Pgsl_combination); cdecl; external libgsl;
function gsl_combination_memcpy(dest: Pgsl_combination; src: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_fread(stream: PFILE; c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_fwrite(stream: PFILE; c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_fscanf(stream: PFILE; c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_fprintf(stream: PFILE; c: Pgsl_combination; format: pchar): longint; cdecl; external libgsl;
function gsl_combination_n(c: Pgsl_combination): Tsize_t; cdecl; external libgsl;
function gsl_combination_k(c: Pgsl_combination): Tsize_t; cdecl; external libgsl;
function gsl_combination_data(c: Pgsl_combination): Psize_t; cdecl; external libgsl;
function gsl_combination_valid(c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_next(c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_prev(c: Pgsl_combination): longint; cdecl; external libgsl;
function gsl_combination_get(c: Pgsl_combination; i: Tsize_t): Tsize_t; cdecl; external libgsl;

// === Konventiert am: 21-8-25 16:51:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
