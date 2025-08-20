unit gsl_block_long_double;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_long_double_struct = record
    size: Tsize_t;
    data: Plong_double;
  end;
  Pgsl_block_long_double_struct = ^Tgsl_block_long_double_struct;

  Tgsl_block_long_double = Tgsl_block_long_double_struct;
  Pgsl_block_long_double = ^Tgsl_block_long_double;

function gsl_block_long_double_alloc(n: Tsize_t): Pgsl_block_long_double; cdecl; external libgsl;
function gsl_block_long_double_calloc(n: Tsize_t): Pgsl_block_long_double; cdecl; external libgsl;
procedure gsl_block_long_double_free(b: Pgsl_block_long_double); cdecl; external libgsl;
function gsl_block_long_double_fread(stream: PFILE; b: Pgsl_block_long_double): longint; cdecl; external libgsl;
function gsl_block_long_double_fwrite(stream: PFILE; b: Pgsl_block_long_double): longint; cdecl; external libgsl;
function gsl_block_long_double_fscanf(stream: PFILE; b: Pgsl_block_long_double): longint; cdecl; external libgsl;
function gsl_block_long_double_fprintf(stream: PFILE; b: Pgsl_block_long_double; format: pchar): longint; cdecl; external libgsl;
function gsl_block_long_double_raw_fread(stream: PFILE; b: Plong_double; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_double_raw_fwrite(stream: PFILE; b: Plong_double; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_double_raw_fscanf(stream: PFILE; b: Plong_double; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_double_raw_fprintf(stream: PFILE; b: Plong_double; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_long_double_size(b: Pgsl_block_long_double): Tsize_t; cdecl; external libgsl;
function gsl_block_long_double_data(b: Pgsl_block_long_double): Plong_double; cdecl; external libgsl;

// === Konventiert am: 20-8-25 14:16:55 ===


implementation



end.
