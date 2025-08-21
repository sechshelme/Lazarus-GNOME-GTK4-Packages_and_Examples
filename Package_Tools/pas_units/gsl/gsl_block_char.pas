unit gsl_block_char;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_char_struct = record
    size: Tsize_t;
    data: pint8;
  end;
  Pgsl_block_char_struct = ^Tgsl_block_char_struct;

  Tgsl_block_char = Tgsl_block_char_struct;
  Pgsl_block_char = ^Tgsl_block_char;

function gsl_block_char_alloc(n: Tsize_t): Pgsl_block_char; cdecl; external libgsl;
function gsl_block_char_calloc(n: Tsize_t): Pgsl_block_char; cdecl; external libgsl;
procedure gsl_block_char_free(b: Pgsl_block_char); cdecl; external libgsl;
function gsl_block_char_fread(stream: PFILE; b: Pgsl_block_char): longint; cdecl; external libgsl;
function gsl_block_char_fwrite(stream: PFILE; b: Pgsl_block_char): longint; cdecl; external libgsl;
function gsl_block_char_fscanf(stream: PFILE; b: Pgsl_block_char): longint; cdecl; external libgsl;
function gsl_block_char_fprintf(stream: PFILE; b: Pgsl_block_char; format: pchar): longint; cdecl; external libgsl;
function gsl_block_char_raw_fread(stream: PFILE; b: pint8; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_char_raw_fwrite(stream: PFILE; b: pint8; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_char_raw_fscanf(stream: PFILE; b: pint8; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_char_raw_fprintf(stream: PFILE; b: pint8; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_char_size(b: Pgsl_block_char): Tsize_t; cdecl; external libgsl;
function gsl_block_char_data(b: Pgsl_block_char): pint8; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:56:55 ===


implementation



end.
