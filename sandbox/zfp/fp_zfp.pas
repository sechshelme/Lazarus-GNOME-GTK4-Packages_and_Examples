unit fp_zfp;

interface

const
  {$IFDEF Linux}
  libzfp = 'zfp';
  {$ENDIF}

  {$IFDEF windows}
  libzfp = 'libzfp.dll';
  {$ENDIF}


type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Tptrdiff_t = PtrInt;
  Pptrdiff_t = ^Tptrdiff_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  // ==== /usr/include/zfp/version.h

const
  ZFP_VERSION_MAJOR = 1;
  ZFP_VERSION_MINOR = 0;
  ZFP_VERSION_PATCH = 1;
  ZFP_VERSION_TWEAK = 0;


  // ==== /usr/include/zfp/bitstream.h

type
  Pbitstream_offset = ^Tbitstream_offset;
  Tbitstream_offset = uint64;

  Pbitstream_size = ^Tbitstream_size;
  Tbitstream_size = Tbitstream_offset;

  Pbitstream_count = ^Tbitstream_count;
  Tbitstream_count = Tsize_t;

  Pbitstream = type Pointer;

var
  stream_word_bits: Tsize_t; cvar;external libzfp;

function stream_open(buffer: pointer; bytes: Tsize_t): Pbitstream; cdecl; external libzfp;
procedure stream_close(stream: Pbitstream); cdecl; external libzfp;
function stream_clone(stream: Pbitstream): Pbitstream; cdecl; external libzfp;
function stream_alignment: Tbitstream_count; cdecl; external libzfp;
function stream_data(stream: Pbitstream): pointer; cdecl; external libzfp;
function stream_size(stream: Pbitstream): Tsize_t; cdecl; external libzfp;
function stream_capacity(stream: Pbitstream): Tsize_t; cdecl; external libzfp;
function stream_stride_block(stream: Pbitstream): Tsize_t; cdecl; external libzfp;
function stream_stride_delta(stream: Pbitstream): Tptrdiff_t; cdecl; external libzfp;
function stream_read_bit(stream: Pbitstream): uint32; cdecl; external libzfp;
function stream_write_bit(stream: Pbitstream; bit: uint32): uint32; cdecl; external libzfp;
function stream_read_bits(stream: Pbitstream; n: Tbitstream_count): uint64; cdecl; external libzfp;
function stream_write_bits(stream: Pbitstream; value: uint64; n: Tbitstream_count): uint64; cdecl; external libzfp;
function stream_rtell(stream: Pbitstream): Tbitstream_offset; cdecl; external libzfp;
function stream_wtell(stream: Pbitstream): Tbitstream_offset; cdecl; external libzfp;
procedure stream_rewind(stream: Pbitstream); cdecl; external libzfp;
procedure stream_rseek(stream: Pbitstream; offset: Tbitstream_offset); cdecl; external libzfp;
procedure stream_wseek(stream: Pbitstream; offset: Tbitstream_offset); cdecl; external libzfp;
procedure stream_skip(stream: Pbitstream; n: Tbitstream_size); cdecl; external libzfp;
procedure stream_pad(stream: Pbitstream; n: Tbitstream_size); cdecl; external libzfp;
function stream_align(stream: Pbitstream): Tbitstream_count; cdecl; external libzfp;
function stream_flush(stream: Pbitstream): Tbitstream_count; cdecl; external libzfp;
procedure stream_copy(dst: Pbitstream; src: Pbitstream; n: Tbitstream_size); cdecl; external libzfp;
function stream_set_stride(stream: Pbitstream; block: Tsize_t; delta: Tptrdiff_t): longint; cdecl; external libzfp;


// ==== /usr/include/zfp.h

const
  ZFP_MIN_BITS = 1;
  ZFP_MAX_BITS = 16658;
  ZFP_MAX_PREC = 64;
  ZFP_MIN_EXP = -(1074);
  ZFP_HEADER_NONE = $0;
  ZFP_HEADER_MAGIC = $1;
  ZFP_HEADER_META = $2;
  ZFP_HEADER_MODE = $4;
  ZFP_HEADER_FULL = $7;
  ZFP_DATA_UNUSED = $01;
  ZFP_DATA_PADDING = $02;
  ZFP_DATA_META = $04;
  ZFP_DATA_MISC = $08;
  ZFP_DATA_PAYLOAD = $10;
  ZFP_DATA_INDEX = $20;
  ZFP_DATA_CACHE = $40;
  ZFP_DATA_HEADER = $80;
  ZFP_DATA_ALL = $ff;

const
  ZFP_META_NULL = uint64(-1);

const
  ZFP_MAGIC_BITS = 32;
  ZFP_META_BITS = 52;
  ZFP_MODE_SHORT_BITS = 12;
  ZFP_MODE_LONG_BITS = 64;
  ZFP_HEADER_MAX_BITS = 148;
  ZFP_MODE_SHORT_MAX = (1 shl ZFP_MODE_SHORT_BITS) - 2;
  ZFP_ROUND_FIRST = -(1);
  ZFP_ROUND_NEVER = 0;
  ZFP_ROUND_LAST = 1;

const
  zfp_false = False;
  zfp_true = not (zfp_false);

type
  Pzfp_bool = ^Tzfp_bool;
  Tzfp_bool = Boolean32;

  Pzfp_exec_policy = ^Tzfp_exec_policy;
  Tzfp_exec_policy = longint;
const
  zfp_exec_serial = 0;
  zfp_exec_omp = 1;
  zfp_exec_cuda = 2;

type
  Pzfp_exec_params_omp = ^Tzfp_exec_params_omp;
  Tzfp_exec_params_omp = record
    threads: uint32;
    chunk_size: uint32;
  end;

  Pzfp_execution = ^Tzfp_execution;
  Tzfp_execution = record
    policy: Tzfp_exec_policy;
    params: pointer;
  end;

  Pzfp_stream = ^Tzfp_stream;
  Tzfp_stream = record
    minbits: uint32;
    maxbits: uint32;
    maxprec: uint32;
    minexp: longint;
    stream: Pbitstream;
    exec: Tzfp_execution;
  end;

type
  Pzfp_mode = ^Tzfp_mode;
  Tzfp_mode = longint;
const
  zfp_mode_null = 0;
  zfp_mode_expert = 1;
  zfp_mode_fixed_rate = 2;
  zfp_mode_fixed_precision = 3;
  zfp_mode_fixed_accuracy = 4;
  zfp_mode_reversible = 5;

type
  Pzfp_config = ^Tzfp_config;
  Tzfp_config = record
    mode: Tzfp_mode;
    arg: record
      case longint of
        0: (rate: double);
        1: (precision: uint32);
        2: (tolerance: double);
        3: (expert: record
            minbits: uint32;
            maxbits: uint32;
            maxprec: uint32;
            minexp: longint;
            end);
      end;
  end;

type
  Pzfp_type = ^Tzfp_type;
  Tzfp_type = longint;
const
  zfp_type_none = 0;
  zfp_type_int32 = 1;
  zfp_type_int64 = 2;
  zfp_type_float = 3;
  zfp_type_double = 4;

type
  Pzfp_field = ^Tzfp_field;
  Tzfp_field = record
    _type: Tzfp_type;
    nx: Tsize_t;
    ny: Tsize_t;
    nz: Tsize_t;
    nw: Tsize_t;
    sx: Tptrdiff_t;
    sy: Tptrdiff_t;
    sz: Tptrdiff_t;
    sw: Tptrdiff_t;
    data: pointer;
  end;

var
  zfp_codec_version: uint32; cvar;external libzfp;
  zfp_library_version: uint32; cvar;external libzfp;
  zfp_version_string: pchar; cvar;external libzfp;

function zfp_type_size(_type: Tzfp_type): Tsize_t; cdecl; external libzfp;

function zfp_stream_open(stream: Pbitstream): Pzfp_stream; cdecl; external libzfp;
procedure zfp_stream_close(stream: Pzfp_stream); cdecl; external libzfp;

function zfp_stream_bit_stream(stream: Pzfp_stream): Pbitstream; cdecl; external libzfp;
function zfp_stream_compression_mode(stream: Pzfp_stream): Tzfp_mode; cdecl; external libzfp;
function zfp_stream_rate(stream: Pzfp_stream; dims: uint32): double; cdecl; external libzfp;
function zfp_stream_precision(stream: Pzfp_stream): uint32; cdecl; external libzfp;
function zfp_stream_accuracy(stream: Pzfp_stream): double; cdecl; external libzfp;
function zfp_stream_mode(stream: Pzfp_stream): uint64; cdecl; external libzfp;
procedure zfp_stream_params(stream: Pzfp_stream; minbits: Puint32; maxbits: Puint32; maxprec: Puint32; minexp: Plongint); cdecl; external libzfp;
function zfp_stream_compressed_size(stream: Pzfp_stream): Tsize_t; cdecl; external libzfp;
function zfp_stream_maximum_size(stream: Pzfp_stream; field: Pzfp_field): Tsize_t; cdecl; external libzfp;

procedure zfp_stream_rewind(stream: Pzfp_stream); cdecl; external libzfp;
procedure zfp_stream_set_bit_stream(stream: Pzfp_stream; bs: Pbitstream); cdecl; external libzfp;
procedure zfp_stream_set_reversible(stream: Pzfp_stream); cdecl; external libzfp;
function zfp_stream_set_rate(stream: Pzfp_stream; rate: double; _type: Tzfp_type; dims: uint32; align: Tzfp_bool): double; cdecl; external libzfp;
function zfp_stream_set_precision(stream: Pzfp_stream; precision: uint32): uint32; cdecl; external libzfp;
function zfp_stream_set_accuracy(stream: Pzfp_stream; tolerance: double): double; cdecl; external libzfp;
function zfp_stream_set_mode(stream: Pzfp_stream; mode: uint64): Tzfp_mode; cdecl; external libzfp;
function zfp_stream_set_params(stream: Pzfp_stream; minbits: uint32; maxbits: uint32; maxprec: uint32; minexp: longint): Tzfp_bool; cdecl; external libzfp;

function zfp_stream_execution(stream: Pzfp_stream): Tzfp_exec_policy; cdecl; external libzfp;
function zfp_stream_omp_threads(stream: Pzfp_stream): uint32; cdecl; external libzfp;
function zfp_stream_omp_chunk_size(stream: Pzfp_stream): uint32; cdecl; external libzfp;
function zfp_stream_set_execution(stream: Pzfp_stream; policy: Tzfp_exec_policy): Tzfp_bool; cdecl; external libzfp;
function zfp_stream_set_omp_threads(stream: Pzfp_stream; threads: uint32): Tzfp_bool; cdecl; external libzfp;
function zfp_stream_set_omp_chunk_size(stream: Pzfp_stream; chunk_size: uint32): Tzfp_bool; cdecl; external libzfp;

function zfp_config_none: Tzfp_config; cdecl; external libzfp;
function zfp_config_rate(rate: double; align: Tzfp_bool): Tzfp_config; cdecl; external libzfp;
function zfp_config_precision(precision: uint32): Tzfp_config; cdecl; external libzfp;
function zfp_config_accuracy(tolerance: double): Tzfp_config; cdecl; external libzfp;
function zfp_config_reversible: Tzfp_config; cdecl; external libzfp;
function zfp_config_expert(minbits: uint32; maxbits: uint32; maxprec: uint32; minexp: longint): Tzfp_config; cdecl; external libzfp;

function zfp_field_alloc: Pzfp_field; cdecl; external libzfp;
function zfp_field_1d(p: pointer; _type: Tzfp_type; nx: Tsize_t): Pzfp_field; cdecl; external libzfp;
function zfp_field_2d(p: pointer; _type: Tzfp_type; nx: Tsize_t; ny: Tsize_t): Pzfp_field; cdecl; external libzfp;
function zfp_field_3d(p: pointer; _type: Tzfp_type; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t): Pzfp_field; cdecl; external libzfp;
function zfp_field_4d(p: pointer; _type: Tzfp_type; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t): Pzfp_field; cdecl; external libzfp;
procedure zfp_field_free(field: Pzfp_field); cdecl; external libzfp;

function zfp_field_pointer(field: Pzfp_field): pointer; cdecl; external libzfp;
function zfp_field_begin(field: Pzfp_field): pointer; cdecl; external libzfp;
function zfp_field_type(field: Pzfp_field): Tzfp_type; cdecl; external libzfp;
function zfp_field_precision(field: Pzfp_field): uint32; cdecl; external libzfp;
function zfp_field_dimensionality(field: Pzfp_field): uint32; cdecl; external libzfp;
function zfp_field_size(field: Pzfp_field; size: Psize_t): Tsize_t; cdecl; external libzfp;
function zfp_field_size_bytes(field: Pzfp_field): Tsize_t; cdecl; external libzfp;
function zfp_field_blocks(field: Pzfp_field): Tsize_t; cdecl; external libzfp;
function zfp_field_stride(field: Pzfp_field; stride: Pptrdiff_t): Tzfp_bool; cdecl; external libzfp;
function zfp_field_is_contiguous(field: Pzfp_field): Tzfp_bool; cdecl; external libzfp;
function zfp_field_metadata(field: Pzfp_field): uint64; cdecl; external libzfp;

procedure zfp_field_set_pointer(field: Pzfp_field; pointer: pointer); cdecl; external libzfp;
function zfp_field_set_type(field: Pzfp_field; _type: Tzfp_type): Tzfp_type; cdecl; external libzfp;
procedure zfp_field_set_size_1d(field: Pzfp_field; nx: Tsize_t); cdecl; external libzfp;
procedure zfp_field_set_size_2d(field: Pzfp_field; nx: Tsize_t; ny: Tsize_t); cdecl; external libzfp;
procedure zfp_field_set_size_3d(field: Pzfp_field; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t); cdecl; external libzfp;
procedure zfp_field_set_size_4d(field: Pzfp_field; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t; nw: Tsize_t); cdecl; external libzfp;
procedure zfp_field_set_stride_1d(field: Pzfp_field; sx: Tptrdiff_t); cdecl; external libzfp;
procedure zfp_field_set_stride_2d(field: Pzfp_field; sx: Tptrdiff_t; sy: Tptrdiff_t); cdecl; external libzfp;
procedure zfp_field_set_stride_3d(field: Pzfp_field; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t); cdecl; external libzfp;
procedure zfp_field_set_stride_4d(field: Pzfp_field; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t); cdecl; external libzfp;
function zfp_field_set_metadata(field: Pzfp_field; meta: uint64): Tzfp_bool; cdecl; external libzfp;

function zfp_compress(stream: Pzfp_stream; field: Pzfp_field): Tsize_t; cdecl; external libzfp;
function zfp_decompress(stream: Pzfp_stream; field: Pzfp_field): Tsize_t; cdecl; external libzfp;
function zfp_write_header(stream: Pzfp_stream; field: Pzfp_field; mask: uint32): Tsize_t; cdecl; external libzfp;
function zfp_read_header(stream: Pzfp_stream; field: Pzfp_field; mask: uint32): Tsize_t; cdecl; external libzfp;

function zfp_stream_flush(stream: Pzfp_stream): Tsize_t; cdecl; external libzfp;
function zfp_stream_align(stream: Pzfp_stream): Tsize_t; cdecl; external libzfp;

function zfp_encode_block_int32_1(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int64_1(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_float_1(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_double_1(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int32_1(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int64_1(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_float_1(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_double_1(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int32_1(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int64_1(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_float_1(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_double_1(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int32_2(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int64_2(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_float_2(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_double_2(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int32_2(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int64_2(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_float_2(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_double_2(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int32_2(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int64_2(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_float_2(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_double_2(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int32_3(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int64_3(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_float_3(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_double_3(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int32_3(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int64_3(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_float_3(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_double_3(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int32_3(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int64_3(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_float_3(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_double_3(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int32_4(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_int64_4(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_float_4(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_double_4(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int32_4(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_int64_4(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_float_4(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_block_strided_double_4(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int32_4(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_int64_4(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_float_4(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_encode_partial_block_strided_double_4(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;

function zfp_decode_block_int32_1(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int64_1(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_float_1(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_double_1(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int32_1(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int64_1(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_float_1(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_double_1(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int32_1(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int64_1(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_float_1(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_double_1(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; sx: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int32_2(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int64_2(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_float_2(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_double_2(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int32_2(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int64_2(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_float_2(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_double_2(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int32_2(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int64_2(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_float_2(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_double_2(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; sx: Tptrdiff_t;
  sy: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int32_3(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int64_3(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_float_3(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_double_3(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int32_3(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int64_3(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_float_3(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_double_3(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int32_3(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int64_3(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_float_3(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_double_3(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int32_4(stream: Pzfp_stream; block: Plongint): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_int64_4(stream: Pzfp_stream; block: Pint64): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_float_4(stream: Pzfp_stream; block: Psingle): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_double_4(stream: Pzfp_stream; block: Pdouble): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int32_4(stream: Pzfp_stream; p: Plongint; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_int64_4(stream: Pzfp_stream; p: Pint64; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_float_4(stream: Pzfp_stream; p: Psingle; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_block_strided_double_4(stream: Pzfp_stream; p: Pdouble; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t;
  sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int32_4(stream: Pzfp_stream; p: Plongint; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_int64_4(stream: Pzfp_stream; p: Pint64; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_float_4(stream: Pzfp_stream; p: Psingle; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;
function zfp_decode_partial_block_strided_double_4(stream: Pzfp_stream; p: Pdouble; nx: Tsize_t; ny: Tsize_t; nz: Tsize_t;
  nw: Tsize_t; sx: Tptrdiff_t; sy: Tptrdiff_t; sz: Tptrdiff_t; sw: Tptrdiff_t): Tsize_t; cdecl; external libzfp;

procedure zfp_promote_int8_to_int32(oblock: Plongint; iblock: Pshortint; dims: uint32); cdecl; external libzfp;
procedure zfp_promote_uint8_to_int32(oblock: Plongint; iblock: Puint8; dims: uint32); cdecl; external libzfp;
procedure zfp_promote_int16_to_int32(oblock: Plongint; iblock: Psmallint; dims: uint32); cdecl; external libzfp;
procedure zfp_promote_uint16_to_int32(oblock: Plongint; iblock: Puint16; dims: uint32); cdecl; external libzfp;
procedure zfp_demote_int32_to_int8(oblock: Pshortint; iblock: Plongint; dims: uint32); cdecl; external libzfp;
procedure zfp_demote_int32_to_uint8(oblock: Puint8; iblock: Plongint; dims: uint32); cdecl; external libzfp;
procedure zfp_demote_int32_to_int16(oblock: Psmallint; iblock: Plongint; dims: uint32); cdecl; external libzfp;
procedure zfp_demote_int32_to_uint16(oblock: Puint16; iblock: Plongint; dims: uint32); cdecl; external libzfp;

// === Konventiert am: 4-9-26 15:15:49 ===


implementation


end.
