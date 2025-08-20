unit gsl_block_short;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_short_struct = record
    size: Tsize_t;
    data: Psmallint;
  end;
  Pgsl_block_short_struct = ^Tgsl_block_short_struct;

  Tgsl_block_short = Tgsl_block_short_struct;
  Pgsl_block_short = ^Tgsl_block_short;

function gsl_block_short_alloc(n: Tsize_t): Pgsl_block_short; cdecl; external libgsl;
function gsl_block_short_calloc(n: Tsize_t): Pgsl_block_short; cdecl; external libgsl;
procedure gsl_block_short_free(b: Pgsl_block_short); cdecl; external libgsl;
function gsl_block_short_fread(stream: PFILE; b: Pgsl_block_short): longint; cdecl; external libgsl;
function gsl_block_short_fwrite(stream: PFILE; b: Pgsl_block_short): longint; cdecl; external libgsl;
function gsl_block_short_fscanf(stream: PFILE; b: Pgsl_block_short): longint; cdecl; external libgsl;
function gsl_block_short_fprintf(stream: PFILE; b: Pgsl_block_short; format: pchar): longint; cdecl; external libgsl;
function gsl_block_short_raw_fread(stream: PFILE; b: Psmallint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_short_raw_fwrite(stream: PFILE; b: Psmallint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_short_raw_fscanf(stream: PFILE; b: Psmallint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_short_raw_fprintf(stream: PFILE; b: Psmallint; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_short_size(b: Pgsl_block_short): Tsize_t; cdecl; external libgsl;
function gsl_block_short_data(b: Pgsl_block_short): Psmallint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:04 ===


implementation



end.
