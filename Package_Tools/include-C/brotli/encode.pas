unit encode;

interface

uses
  fp_brotli, types, shared_dictionary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  BROTLI_MIN_WINDOW_BITS = 10;
  BROTLI_MAX_WINDOW_BITS = 24;
  BROTLI_LARGE_MAX_WINDOW_BITS = 30;
  BROTLI_MIN_INPUT_BLOCK_BITS = 16;
  BROTLI_MAX_INPUT_BLOCK_BITS = 24;
  BROTLI_MIN_QUALITY = 0;
  BROTLI_MAX_QUALITY = 11;

type
  PBrotliEncoderMode = ^TBrotliEncoderMode;
  TBrotliEncoderMode = longint;

const
  BROTLI_MODE_GENERIC = 0;
  BROTLI_MODE_TEXT = 1;
  BROTLI_MODE_FONT = 2;

const
  BROTLI_DEFAULT_QUALITY = 11;
  BROTLI_DEFAULT_WINDOW = 22;
  BROTLI_DEFAULT_MODE = BROTLI_MODE_GENERIC;

type
  PBrotliEncoderOperation = ^TBrotliEncoderOperation;
  TBrotliEncoderOperation = longint;

const
  BROTLI_OPERATION_PROCESS = 0;
  BROTLI_OPERATION_FLUSH = 1;
  BROTLI_OPERATION_FINISH = 2;
  BROTLI_OPERATION_EMIT_METADATA = 3;

type
  PBrotliEncoderParameter = ^TBrotliEncoderParameter;
  TBrotliEncoderParameter = longint;

const
  BROTLI_PARAM_MODE = 0;
  BROTLI_PARAM_QUALITY = 1;
  BROTLI_PARAM_LGWIN = 2;
  BROTLI_PARAM_LGBLOCK = 3;
  BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING = 4;
  BROTLI_PARAM_SIZE_HINT = 5;
  BROTLI_PARAM_LARGE_WINDOW = 6;
  BROTLI_PARAM_NPOSTFIX = 7;
  BROTLI_PARAM_NDIRECT = 8;
  BROTLI_PARAM_STREAM_OFFSET = 9;

type
  PBrotliEncoderState = type Pointer;

function BrotliEncoderSetParameter(state: PBrotliEncoderState; param: TBrotliEncoderParameter; value: Tuint32_t): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderCreateInstance(alloc_func: Tbrotli_alloc_func; free_func: Tbrotli_free_func; opaque: pointer): PBrotliEncoderState; cdecl; external libbrotlidec;
procedure BrotliEncoderDestroyInstance(state: PBrotliEncoderState); cdecl; external libbrotlidec;

type
  PBrotliEncoderPreparedDictionary = type Pointer;

function BrotliEncoderPrepareDictionary(_type: TBrotliSharedDictionaryType; data_size: Tsize_t; data: Puint8_t; quality: longint; alloc_func: Tbrotli_alloc_func;
  free_func: Tbrotli_free_func; opaque: pointer): PBrotliEncoderPreparedDictionary; cdecl; external libbrotlidec;
procedure BrotliEncoderDestroyPreparedDictionary(dictionary: PBrotliEncoderPreparedDictionary); cdecl; external libbrotlidec;
function BrotliEncoderAttachPreparedDictionary(state: PBrotliEncoderState; dictionary: PBrotliEncoderPreparedDictionary): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderMaxCompressedSize(input_size: Tsize_t): Tsize_t; cdecl; external libbrotlidec;
function BrotliEncoderCompress(quality: longint; lgwin: longint; mode: TBrotliEncoderMode; input_size: Tsize_t; input_buffer: Puint8_t;
  encoded_size: Psize_t; encoded_buffer: Puint8_t): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderCompressStream(state: PBrotliEncoderState; op: TBrotliEncoderOperation; available_in: Psize_t; next_in: PPuint8_t; available_out: Psize_t;
  next_out: PPuint8_t; total_out: Psize_t): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderIsFinished(state: PBrotliEncoderState): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderHasMoreOutput(state: PBrotliEncoderState): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliEncoderTakeOutput(state: PBrotliEncoderState; size: Psize_t): Puint8_t; cdecl; external libbrotlidec;
function BrotliEncoderEstimatePeakMemoryUsage(quality: longint; lgwin: longint; input_size: Tsize_t): Tsize_t; cdecl; external libbrotlidec;
function BrotliEncoderGetPreparedDictionarySize(dictionary: PBrotliEncoderPreparedDictionary): Tsize_t; cdecl; external libbrotlidec;
function BrotliEncoderVersion: Tuint32_t; cdecl; external libbrotlidec;

// === Konventiert am: 4-2-26 19:45:32 ===


implementation



end.
