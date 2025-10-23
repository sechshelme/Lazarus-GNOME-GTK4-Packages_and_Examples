{$IFDEF read_interface}


type
  Tgsl_block_float_struct = record
    size: Tsize_t;
    data: Psingle;
  end;
  Pgsl_block_float_struct = ^Tgsl_block_float_struct;

  Tgsl_block_float = Tgsl_block_float_struct;
  Pgsl_block_float = ^Tgsl_block_float;

function gsl_block_float_alloc(n: Tsize_t): Pgsl_block_float; cdecl; external libgsl;
function gsl_block_float_calloc(n: Tsize_t): Pgsl_block_float; cdecl; external libgsl;
procedure gsl_block_float_free(b: Pgsl_block_float); cdecl; external libgsl;
function gsl_block_float_fread(stream: PFILE; b: Pgsl_block_float): longint; cdecl; external libgsl;
function gsl_block_float_fwrite(stream: PFILE; b: Pgsl_block_float): longint; cdecl; external libgsl;
function gsl_block_float_fscanf(stream: PFILE; b: Pgsl_block_float): longint; cdecl; external libgsl;
function gsl_block_float_fprintf(stream: PFILE; b: Pgsl_block_float; format: pchar): longint; cdecl; external libgsl;
function gsl_block_float_raw_fread(stream: PFILE; b: Psingle; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_float_raw_fwrite(stream: PFILE; b: Psingle; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_float_raw_fscanf(stream: PFILE; b: Psingle; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_float_raw_fprintf(stream: PFILE; b: Psingle; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_float_size(b: Pgsl_block_float): Tsize_t; cdecl; external libgsl;
function gsl_block_float_data(b: Pgsl_block_float): Psingle; cdecl; external libgsl;

// === Konventiert am: 18-8-25 16:32:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
