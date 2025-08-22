{$IFDEF read_interface}


type
  Tgsl_block_int_struct = record
    size: Tsize_t;
    data: Plongint;
  end;
  Pgsl_block_int_struct = ^Tgsl_block_int_struct;

  Tgsl_block_int = Tgsl_block_int_struct;
  Pgsl_block_int = ^Tgsl_block_int;

function gsl_block_int_alloc(n: Tsize_t): Pgsl_block_int; cdecl; external libgsl;
function gsl_block_int_calloc(n: Tsize_t): Pgsl_block_int; cdecl; external libgsl;
procedure gsl_block_int_free(b: Pgsl_block_int); cdecl; external libgsl;
function gsl_block_int_fread(stream: PFILE; b: Pgsl_block_int): longint; cdecl; external libgsl;
function gsl_block_int_fwrite(stream: PFILE; b: Pgsl_block_int): longint; cdecl; external libgsl;
function gsl_block_int_fscanf(stream: PFILE; b: Pgsl_block_int): longint; cdecl; external libgsl;
function gsl_block_int_fprintf(stream: PFILE; b: Pgsl_block_int; format: pchar): longint; cdecl; external libgsl;
function gsl_block_int_raw_fread(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_int_raw_fwrite(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_int_raw_fscanf(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_int_raw_fprintf(stream: PFILE; b: Plongint; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_int_size(b: Pgsl_block_int): Tsize_t; cdecl; external libgsl;
function gsl_block_int_data(b: Pgsl_block_int): Plongint; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:56:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
