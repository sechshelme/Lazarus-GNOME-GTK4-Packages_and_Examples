{$IFDEF read_interface}


type
  Tgsl_block_ushort_struct = record
    size: Tsize_t;
    data: Pword;
  end;
  Pgsl_block_ushort_struct = ^Tgsl_block_ushort_struct;

  Tgsl_block_ushort = Tgsl_block_ushort_struct;
  Pgsl_block_ushort = ^Tgsl_block_ushort;

function gsl_block_ushort_alloc(n: Tsize_t): Pgsl_block_ushort; cdecl; external libgsl;
function gsl_block_ushort_calloc(n: Tsize_t): Pgsl_block_ushort; cdecl; external libgsl;
procedure gsl_block_ushort_free(b: Pgsl_block_ushort); cdecl; external libgsl;
function gsl_block_ushort_fread(stream: PFILE; b: Pgsl_block_ushort): longint; cdecl; external libgsl;
function gsl_block_ushort_fwrite(stream: PFILE; b: Pgsl_block_ushort): longint; cdecl; external libgsl;
function gsl_block_ushort_fscanf(stream: PFILE; b: Pgsl_block_ushort): longint; cdecl; external libgsl;
function gsl_block_ushort_fprintf(stream: PFILE; b: Pgsl_block_ushort; format: pchar): longint; cdecl; external libgsl;
function gsl_block_ushort_raw_fread(stream: PFILE; b: Pword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ushort_raw_fwrite(stream: PFILE; b: Pword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ushort_raw_fscanf(stream: PFILE; b: Pword; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_ushort_raw_fprintf(stream: PFILE; b: Pword; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_ushort_size(b: Pgsl_block_ushort): Tsize_t; cdecl; external libgsl;
function gsl_block_ushort_data(b: Pgsl_block_ushort): Pword; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
