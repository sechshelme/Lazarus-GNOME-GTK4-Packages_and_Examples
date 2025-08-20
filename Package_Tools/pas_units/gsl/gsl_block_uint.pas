unit gsl_block_uint;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_uint_struct = record
    size: Tsize_t;
    data: Pdword;
  end;
  Pgsl_block_uint_struct = ^Tgsl_block_uint_struct;

  Tgsl_block_uint = Tgsl_block_uint_struct;
  Pgsl_block_uint = ^Tgsl_block_uint;

function gsl_block_uint_alloc(n: Tsize_t): Pgsl_block_uint; cdecl; external libgsl;
function gsl_block_uint_calloc(n: Tsize_t): Pgsl_block_uint; cdecl; external libgsl;
procedure gsl_block_uint_free(b: Pgsl_block_uint); cdecl; external libgsl;
function gsl_block_uint_fread(stream: PFILE; b: Pgsl_block_uint): longint; cdecl; external libgsl;
function gsl_block_uint_fwrite(stream: PFILE; b: Pgsl_block_uint): longint; cdecl; external libgsl;
function gsl_block_uint_fscanf(stream: PFILE; b: Pgsl_block_uint): longint; cdecl; external libgsl;
function gsl_block_uint_fprintf(stream: PFILE; b: Pgsl_block_uint; format: pchar): longint; cdecl; external libgsl;
function gsl_block_uint_raw_fread(stream: PFILE; b: Pdword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uint_raw_fwrite(stream: PFILE; b: Pdword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uint_raw_fscanf(stream: PFILE; b: Pdword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uint_raw_fprintf(stream: PFILE; b: Pdword; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_uint_size(b: Pgsl_block_uint): Tsize_t; cdecl; external libgsl;
function gsl_block_uint_data(b: Pgsl_block_uint): Pdword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:10 ===


implementation



end.
