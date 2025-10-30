{$IFDEF read_interface}


type
  Tgsl_block_ulong_struct = record
    size: Tsize_t;
    data: Pculong;
  end;
  Pgsl_block_ulong_struct = ^Tgsl_block_ulong_struct;

  Tgsl_block_ulong = Tgsl_block_ulong_struct;
  Pgsl_block_ulong = ^Tgsl_block_ulong;

function gsl_block_ulong_alloc(n: Tsize_t): Pgsl_block_ulong; cdecl; external libgsl;
function gsl_block_ulong_calloc(n: Tsize_t): Pgsl_block_ulong; cdecl; external libgsl;
procedure gsl_block_ulong_free(b: Pgsl_block_ulong); cdecl; external libgsl;
function gsl_block_ulong_fread(stream: PFILE; b: Pgsl_block_ulong): longint; cdecl; external libgsl;
function gsl_block_ulong_fwrite(stream: PFILE; b: Pgsl_block_ulong): longint; cdecl; external libgsl;
function gsl_block_ulong_fscanf(stream: PFILE; b: Pgsl_block_ulong): longint; cdecl; external libgsl;
function gsl_block_ulong_fprintf(stream: PFILE; b: Pgsl_block_ulong; format: pchar): longint; cdecl; external libgsl;
function gsl_block_ulong_raw_fread(stream: PFILE; b: Pculong; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ulong_raw_fwrite(stream: PFILE; b: Pculong; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ulong_raw_fscanf(stream: PFILE; b: Pculong; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ulong_raw_fprintf(stream: PFILE; b: Pculong; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_ulong_size(b: Pgsl_block_ulong): Tsize_t; cdecl; external libgsl;
function gsl_block_ulong_data(b: Pgsl_block_ulong): Pculong; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
