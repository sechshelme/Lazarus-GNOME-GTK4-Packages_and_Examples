{$IFDEF read_interface}


type
  Tgsl_block_long_struct = record
    size: Tsize_t;
    data: Plongint;
  end;
  Pgsl_block_long_struct = ^Tgsl_block_long_struct;

  Tgsl_block_long = Tgsl_block_long_struct;
  Pgsl_block_long = ^Tgsl_block_long;

function gsl_block_long_alloc(n: Tsize_t): Pgsl_block_long; cdecl; external libgsl;
function gsl_block_long_calloc(n: Tsize_t): Pgsl_block_long; cdecl; external libgsl;
procedure gsl_block_long_free(b: Pgsl_block_long); cdecl; external libgsl;
function gsl_block_long_fread(stream: PFILE; b: Pgsl_block_long): longint; cdecl; external libgsl;
function gsl_block_long_fwrite(stream: PFILE; b: Pgsl_block_long): longint; cdecl; external libgsl;
function gsl_block_long_fscanf(stream: PFILE; b: Pgsl_block_long): longint; cdecl; external libgsl;
function gsl_block_long_fprintf(stream: PFILE; b: Pgsl_block_long; format: pchar): longint; cdecl; external libgsl;
function gsl_block_long_raw_fread(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_raw_fwrite(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_raw_fscanf(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_long_raw_fprintf(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_long_size(b: Pgsl_block_long): Tsize_t; cdecl; external libgsl;
function gsl_block_long_data(b: Pgsl_block_long): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
