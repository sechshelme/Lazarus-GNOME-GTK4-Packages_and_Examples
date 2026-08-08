unit fp_bs_size;

interface

const
  {$IFDEF Linux}
  libbytesize = 'bytesize';
  {$ENDIF}

  {$IFDEF Windows}
  libbytesize = 'bytesize.dll';
  {$ENDIF}

type
  Tuint64_t = uint64;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TBSSize = type Pointer;

type
  PBSErrorCode = ^TBSErrorCode;
  TBSErrorCode = longint;

const
  BS_ERROR_INVALID_SPEC = 0;
  BS_ERROR_OVER = 1;
  BS_ERROR_ZERO_DIV = 2;
  BS_ERROR_FAIL = 3;

type
  PPBSError = ^PBSError;
  PBSError = ^TBSError;

  TBSError = record
    code: TBSErrorCode;
    msg: pchar;
  end;

type
  PBSBunit = ^TBSBunit;
  TBSBunit = longint;

const
  BS_BUNIT_B = 0;
  BS_BUNIT_KiB = 1;
  BS_BUNIT_MiB = 2;
  BS_BUNIT_GiB = 3;
  BS_BUNIT_TiB = 4;
  BS_BUNIT_PiB = 5;
  BS_BUNIT_EiB = 6;
  BS_BUNIT_ZiB = 7;
  BS_BUNIT_YiB = 8;
  BS_BUNIT_UNDEF = 9;

type
  PBSDunit = ^TBSDunit;
  TBSDunit = longint;

const
  BS_DUNIT_B = 20;
  BS_DUNIT_KB = 21;
  BS_DUNIT_MB = 22;
  BS_DUNIT_GB = 23;
  BS_DUNIT_TB = 24;
  BS_DUNIT_PB = 25;
  BS_DUNIT_EB = 26;
  BS_DUNIT_ZB = 27;
  BS_DUNIT_YB = 28;
  BS_DUNIT_UNDEF = 29;

type
  PBSRoundDir = ^TBSRoundDir;
  TBSRoundDir = longint;

const
  BS_ROUND_DIR_UP = 0;
  BS_ROUND_DIR_DOWN = 1;
  BS_ROUND_DIR_HALF_UP = 2;

type
  PBSUnit = ^TBSUnit;
  TBSUnit = record
    case longint of
      0: (bunit: TBSBunit);
      1: (dunit: TBSDunit);
  end;

const
  BS_FLOAT_PREC_BITS = 256;

function bs_size_new: TBSSize; cdecl; external libbytesize;
function bs_size_new_from_bytes(bytes: Tuint64_t; sgn: longint): TBSSize; cdecl; external libbytesize;
function bs_size_new_from_str(size_str: pchar; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_new_from_size(size: TBSSize): TBSSize; cdecl; external libbytesize;

procedure bs_size_free(size: TBSSize); cdecl; external libbytesize;
procedure bs_clear_error(error: PPBSError); cdecl; external libbytesize;

function bs_size_get_bytes(size: TBSSize; sgn: Plongint; error: PPBSError): Tuint64_t; cdecl; external libbytesize;
function bs_size_sgn(size: TBSSize): longint; cdecl; external libbytesize;
function bs_size_get_bytes_str(size: TBSSize): pchar; cdecl; external libbytesize;
function bs_size_convert_to(size: TBSSize; unit_: TBSUnit; error: PPBSError): pchar; cdecl; external libbytesize;
function bs_size_human_readable(size: TBSSize; min_unit: TBSBunit; max_places: longint; xlate: boolean): pchar; cdecl; external libbytesize;

function bs_size_add(size1: TBSSize; size2: TBSSize): TBSSize; cdecl; external libbytesize;
function bs_size_grow(size1: TBSSize; size2: TBSSize): TBSSize; cdecl; external libbytesize;
function bs_size_add_bytes(size: TBSSize; bytes: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_grow_bytes(size: TBSSize; bytes: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_sub(size1: TBSSize; size2: TBSSize): TBSSize; cdecl; external libbytesize;
function bs_size_shrink(size1: TBSSize; size2: TBSSize): TBSSize; cdecl; external libbytesize;
function bs_size_sub_bytes(size: TBSSize; bytes: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_shrink_bytes(size: TBSSize; bytes: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_mul_int(size: TBSSize; times: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_grow_mul_int(size: TBSSize; times: Tuint64_t): TBSSize; cdecl; external libbytesize;
function bs_size_mul_float_str(size: TBSSize; float_str: pchar; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_grow_mul_float_str(size: TBSSize; float_str: pchar; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_div(size1: TBSSize; size2: TBSSize; sgn: Plongint; error: PPBSError): Tuint64_t; cdecl; external libbytesize;
function bs_size_div_int(size: TBSSize; divisor: Tuint64_t; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_shrink_div_int(size: TBSSize; shrink_divisor: Tuint64_t; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_true_div(size1: TBSSize; size2: TBSSize; error: PPBSError): pchar; cdecl; external libbytesize;
function bs_size_true_div_int(size: TBSSize; divisor: Tuint64_t; error: PPBSError): pchar; cdecl; external libbytesize;
function bs_size_mod(size1: TBSSize; size2: TBSSize; error: PPBSError): TBSSize; cdecl; external libbytesize;
function bs_size_round_to_nearest(size: TBSSize; round_to: TBSSize; dir: TBSRoundDir; error: PPBSError): TBSSize; cdecl; external libbytesize;

function bs_size_cmp(size1: TBSSize; size2: TBSSize; abs: boolean): longint; cdecl; external libbytesize;
function bs_size_cmp_bytes(size1: TBSSize; bytes: Tuint64_t; abs: boolean): longint; cdecl; external libbytesize;

// === Konventiert am: 8-8-26 19:30:31 ===


implementation



end.
