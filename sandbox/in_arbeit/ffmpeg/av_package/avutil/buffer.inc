{$IFDEF read_interface}


type
  PAVBuffer = type Pointer;

  TAVBufferRef = record
    buffer: PAVBuffer;
    data: Puint8_t;
    size: Tsize_t;
  end;
  PAVBufferRef = ^TAVBufferRef;
  PPAVBufferRef = ^PAVBufferRef;

function av_buffer_alloc(size: Tsize_t): PAVBufferRef; cdecl; external libavutil;
function av_buffer_allocz(size: Tsize_t): PAVBufferRef; cdecl; external libavutil;

const
  AV_BUFFER_FLAG_READONLY = 1 shl 0;

type
  Tbuffer_create_func = procedure(opaque: pointer; data: Puint8_t); cdecl;

function av_buffer_create(data: Puint8_t; size: Tsize_t; free: Tbuffer_create_func; opaque: pointer; flags: longint): PAVBufferRef; cdecl; external libavutil;
procedure av_buffer_default_free(opaque: pointer; data: Puint8_t); cdecl; external libavutil;
function av_buffer_ref(buf: PAVBufferRef): PAVBufferRef; cdecl; external libavutil;
procedure av_buffer_unref(buf: PPAVBufferRef); cdecl; external libavutil;
function av_buffer_is_writable(buf: PAVBufferRef): longint; cdecl; external libavutil;
function av_buffer_get_opaque(buf: PAVBufferRef): pointer; cdecl; external libavutil;
function av_buffer_get_ref_count(buf: PAVBufferRef): longint; cdecl; external libavutil;
function av_buffer_make_writable(buf: PPAVBufferRef): longint; cdecl; external libavutil;
function av_buffer_realloc(buf: PPAVBufferRef; size: Tsize_t): longint; cdecl; external libavutil;
function av_buffer_replace(dst: PPAVBufferRef; src: PAVBufferRef): longint; cdecl; external libavutil;

type
  PAVBufferPool = type Pointer;
  PPAVBufferPool = ^PAVBufferPool;

  Tbuffer_pool_init_func = function(size: Tsize_t): PAVBufferRef; cdecl;
  Tbuffer_pool_init2_1_func = function(opaque: pointer; size: Tsize_t): PAVBufferRef; cdecl;
  Tbuffer_pool_init2_2_func = procedure(opaque: pointer); cdecl;

function av_buffer_pool_init(size: Tsize_t; alloc: Tbuffer_pool_init_func): PAVBufferPool; cdecl; external libavutil;
function av_buffer_pool_init2(size: Tsize_t; opaque: pointer; alloc: Tbuffer_pool_init2_1_func; pool_free: Tbuffer_pool_init2_2_func): PAVBufferPool; cdecl; external libavutil;
procedure av_buffer_pool_uninit(pool: PPAVBufferPool); cdecl; external libavutil;
function av_buffer_pool_get(pool: PAVBufferPool): PAVBufferRef; cdecl; external libavutil;
function av_buffer_pool_buffer_get_opaque(ref: PAVBufferRef): pointer; cdecl; external libavutil;

// === Konventiert am: 14-12-25 15:59:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
