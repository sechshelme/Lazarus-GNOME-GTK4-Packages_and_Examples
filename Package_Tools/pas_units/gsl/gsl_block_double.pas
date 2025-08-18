unit gsl_block_double;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_struct = record
    size: Tsize_t;
    data: Pdouble;
  end;
  Pgsl_block_struct = ^Tgsl_block_struct;

  Tgsl_block = Tgsl_block_struct;
  Pgsl_block = ^Tgsl_block;

function gsl_block_alloc(n: Tsize_t): Pgsl_block; cdecl; external libgsl;
function gsl_block_calloc(n: Tsize_t): Pgsl_block; cdecl; external libgsl;
procedure gsl_block_free(b: Pgsl_block); cdecl; external libgsl;
function gsl_block_fread(stream: PFILE; b: Pgsl_block): longint; cdecl; external libgsl;
function gsl_block_fwrite(stream: PFILE; b: Pgsl_block): longint; cdecl; external libgsl;
function gsl_block_fscanf(stream: PFILE; b: Pgsl_block): longint; cdecl; external libgsl;
function gsl_block_fprintf(stream: PFILE; b: Pgsl_block; format: pchar): longint; cdecl; external libgsl;
function gsl_block_raw_fread(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_raw_fwrite(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_raw_fscanf(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_raw_fprintf(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_size(b: Pgsl_block): Tsize_t; cdecl; external libgsl;
function gsl_block_data(b: Pgsl_block): Pdouble; cdecl; external libgsl;

// === Konventiert am: 18-8-25 16:00:25 ===


implementation



end.
