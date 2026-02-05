{$IFDEF read_interface}


type
  PBrotliDecoderState = type Pointer;

type
  PBrotliDecoderResult = ^TBrotliDecoderResult;
  TBrotliDecoderResult = longint;

const
  BROTLI_DECODER_RESULT_ERROR = 0;
  BROTLI_DECODER_RESULT_SUCCESS = 1;
  BROTLI_DECODER_RESULT_NEEDS_MORE_INPUT = 2;
  BROTLI_DECODER_RESULT_NEEDS_MORE_OUTPUT = 3;

type
  PBrotliDecoderErrorCode = ^TBrotliDecoderErrorCode;
  TBrotliDecoderErrorCode = longint;

const
  BROTLI_DECODER_NO_ERROR = 0;
  BROTLI_DECODER_SUCCESS = 1;
  BROTLI_DECODER_NEEDS_MORE_INPUT = 2;
  BROTLI_DECODER_NEEDS_MORE_OUTPUT = 3;

  BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_NIBBLE = -1;
  BROTLI_DECODER_ERROR_FORMAT_RESERVED = -2;
  BROTLI_DECODER_ERROR_FORMAT_EXUBERANT_META_NIBBLE = -3;
  BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_ALPHABET = -4;
  BROTLI_DECODER_ERROR_FORMAT_SIMPLE_HUFFMAN_SAME = -5;
  BROTLI_DECODER_ERROR_FORMAT_CL_SPACE = -6;
  BROTLI_DECODER_ERROR_FORMAT_HUFFMAN_SPACE = -7;
  BROTLI_DECODER_ERROR_FORMAT_CONTEXT_MAP_REPEAT = -8;
  BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_1 = -9;
  BROTLI_DECODER_ERROR_FORMAT_BLOCK_LENGTH_2 = -10;
  BROTLI_DECODER_ERROR_FORMAT_TRANSFORM = -11;
  BROTLI_DECODER_ERROR_FORMAT_DICTIONARY = -12;
  BROTLI_DECODER_ERROR_FORMAT_WINDOW_BITS = -13;
  BROTLI_DECODER_ERROR_FORMAT_PADDING_1 = -14;
  BROTLI_DECODER_ERROR_FORMAT_PADDING_2 = -15;
  BROTLI_DECODER_ERROR_FORMAT_DISTANCE = -16;

  BROTLI_DECODER_ERROR_COMPOUND_DICTIONARY = -18;
  BROTLI_DECODER_ERROR_DICTIONARY_NOT_SET = -19;
  BROTLI_DECODER_ERROR_INVALID_ARGUMENTS = -20;

  BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MODES = -21;
  BROTLI_DECODER_ERROR_ALLOC_TREE_GROUPS = -22;
  BROTLI_DECODER_ERROR_ALLOC_CONTEXT_MAP = -25;
  BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_1 = -26;
  BROTLI_DECODER_ERROR_ALLOC_RING_BUFFER_2 = -27;
  BROTLI_DECODER_ERROR_ALLOC_BLOCK_TYPE_TREES = -30;
  BROTLI_DECODER_ERROR_UNREACHABLE = -31;

  BROTLI_LAST_ERROR_CODE = BROTLI_DECODER_ERROR_UNREACHABLE;

type
  PBrotliDecoderParameter = ^TBrotliDecoderParameter;
  TBrotliDecoderParameter = longint;

const
  BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION = 0;
  BROTLI_DECODER_PARAM_LARGE_WINDOW = 1;

function BrotliDecoderSetParameter(state: PBrotliDecoderState; param: TBrotliDecoderParameter; value: Tuint32_t): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliDecoderAttachDictionary(state: PBrotliDecoderState; _type: TBrotliSharedDictionaryType; data_size: Tsize_t; data: Puint8_t): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliDecoderCreateInstance(alloc_func: Tbrotli_alloc_func; free_func: Tbrotli_free_func; opaque: pointer): PBrotliDecoderState; cdecl; external libbrotlidec;
procedure BrotliDecoderDestroyInstance(state: PBrotliDecoderState); cdecl; external libbrotlidec;
function BrotliDecoderDecompress(encoded_size: Tsize_t; encoded_buffer: Puint8_t; decoded_size: Psize_t; decoded_buffer: Puint8_t): TBrotliDecoderResult; cdecl; external libbrotlidec;
function BrotliDecoderDecompressStream(state: PBrotliDecoderState; available_in: Psize_t; next_in: PPuint8_t; available_out: Psize_t; next_out: PPuint8_t;
  total_out: Psize_t): TBrotliDecoderResult; cdecl; external libbrotlidec;
function BrotliDecoderHasMoreOutput(state: PBrotliDecoderState): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliDecoderTakeOutput(state: PBrotliDecoderState; size: Psize_t): Puint8_t; cdecl; external libbrotlidec;
function BrotliDecoderIsUsed(state: PBrotliDecoderState): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliDecoderIsFinished(state: PBrotliDecoderState): TBROTLI_BOOL; cdecl; external libbrotlidec;
function BrotliDecoderGetErrorCode(state: PBrotliDecoderState): TBrotliDecoderErrorCode; cdecl; external libbrotlidec;
function BrotliDecoderErrorString(c: TBrotliDecoderErrorCode): pchar; cdecl; external libbrotlidec;
function BrotliDecoderVersion: Tuint32_t; cdecl; external libbrotlidec;

type
  Tbrotli_decoder_metadata_start_func = procedure(opaque: pointer; size: Tsize_t); cdecl;
  Tbrotli_decoder_metadata_chunk_func = procedure(opaque: pointer; data: Puint8_t; size: Tsize_t); cdecl;

procedure BrotliDecoderSetMetadataCallbacks(state: PBrotliDecoderState; start_func: Tbrotli_decoder_metadata_start_func; chunk_func: Tbrotli_decoder_metadata_chunk_func; opaque: pointer); cdecl; external libbrotlidec;

// === Konventiert am: 4-2-26 19:45:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
