{$IFDEF read_interface}


type
  Tgsl_block_uchar_struct = record
    size: Tsize_t;
    data: pbyte;
  end;
  Pgsl_block_uchar_struct = ^Tgsl_block_uchar_struct;

  Tgsl_block_uchar = Tgsl_block_uchar_struct;
  Pgsl_block_uchar = ^Tgsl_block_uchar;

function gsl_block_uchar_alloc(n: Tsize_t): Pgsl_block_uchar; cdecl; external libgsl;
function gsl_block_uchar_calloc(n: Tsize_t): Pgsl_block_uchar; cdecl; external libgsl;
procedure gsl_block_uchar_free(b: Pgsl_block_uchar); cdecl; external libgsl;
function gsl_block_uchar_fread(stream: PFILE; b: Pgsl_block_uchar): longint; cdecl; external libgsl;
function gsl_block_uchar_fwrite(stream: PFILE; b: Pgsl_block_uchar): longint; cdecl; external libgsl;
function gsl_block_uchar_fscanf(stream: PFILE; b: Pgsl_block_uchar): longint; cdecl; external libgsl;
function gsl_block_uchar_fprintf(stream: PFILE; b: Pgsl_block_uchar; format: pchar): longint; cdecl; external libgsl;
function gsl_block_uchar_raw_fread(stream: PFILE; b: pbyte; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uchar_raw_fwrite(stream: PFILE; b: pbyte; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uchar_raw_fscanf(stream: PFILE; b: pbyte; n: Tsize_t; stride: Tsize_t): longint; cdecl; external libgsl;
function gsl_block_uchar_raw_fprintf(stream: PFILE; b: pbyte; n: Tsize_t; stride: Tsize_t; format: pchar): longint; cdecl; external libgsl;
function gsl_block_uchar_size(b: Pgsl_block_uchar): Tsize_t; cdecl; external libgsl;
function gsl_block_uchar_data(b: Pgsl_block_uchar): pbyte; cdecl; external libgsl;

// === Konventiert am: 20-8-25 15:57:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
