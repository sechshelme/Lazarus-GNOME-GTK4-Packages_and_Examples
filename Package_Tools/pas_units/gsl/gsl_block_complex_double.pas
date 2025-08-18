unit gsl_block_complex_double;

interface

uses
  fp_gsl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tgsl_block_complex_struct = record
    size: Tsize_t;
    data: Pdouble;
  end;
  Pgsl_block_complex_struct = ^Tgsl_block_complex_struct;

  Tgsl_block_complex = Tgsl_block_complex_struct;
  Pgsl_block_complex = ^Tgsl_block_complex;

function gsl_block_complex_alloc(n: Tsize_t): Pgsl_block_complex; cdecl; external libgsl;
function gsl_block_complex_calloc(n: Tsize_t): Pgsl_block_complex; cdecl; external libgsl;
procedure gsl_block_complex_free(b: Pgsl_block_complex); cdecl; external libgsl;
function gsl_block_complex_fread(stream: PFILE; b: Pgsl_block_complex): longint; cdecl; external libgsl;
function gsl_block_complex_fwrite(stream: PFILE; b: Pgsl_block_complex): longint; cdecl; external libgsl;
function gsl_block_complex_fscanf(stream: PFILE; b: Pgsl_block_complex): longint; cdecl; external libgsl;
function gsl_block_complex_fprintf(stream: PFILE; b: Pgsl_block_complex; format: pchar): longint; cdecl; external libgsl;
function gsl_block_complex_raw_fread(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_complex_raw_fwrite(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_complex_raw_fscanf(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_complex_raw_fprintf(stream: PFILE; b: Pdouble; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_complex_size(b: Pgsl_block_complex): Tsize_t; cdecl; external libgsl;
function gsl_block_complex_data(b: Pgsl_block_complex): Pdouble; cdecl; external libgsl;



// === Konventiert am: 18-8-25 17:08:35 ===


implementation



end.
