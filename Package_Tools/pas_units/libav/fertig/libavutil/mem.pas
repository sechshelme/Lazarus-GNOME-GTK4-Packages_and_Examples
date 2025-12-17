unit mem;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function av_malloc(size: Tsize_t): pointer; cdecl; external libavutil;
function av_mallocz(size: Tsize_t): pointer; cdecl; external libavutil;
function av_malloc_array(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libavutil;
function av_calloc(nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libavutil;
function av_realloc(ptr: pointer; size: Tsize_t): pointer; cdecl; external libavutil;
function av_reallocp(ptr: pointer; size: Tsize_t): longint; cdecl; external libavutil;
function av_realloc_f(ptr: pointer; nelem: Tsize_t; elsize: Tsize_t): pointer; cdecl; external libavutil;
function av_realloc_array(ptr: pointer; nmemb: Tsize_t; size: Tsize_t): pointer; cdecl; external libavutil;
function av_reallocp_array(ptr: pointer; nmemb: Tsize_t; size: Tsize_t): longint; cdecl; external libavutil;
function av_fast_realloc(ptr: pointer; size: Pdword; min_size: Tsize_t): pointer; cdecl; external libavutil;
procedure av_fast_malloc(ptr: pointer; size: Pdword; min_size: Tsize_t); cdecl; external libavutil;
procedure av_fast_mallocz(ptr: pointer; size: Pdword; min_size: Tsize_t); cdecl; external libavutil;
procedure av_free(ptr: pointer); cdecl; external libavutil;
procedure av_freep(ptr: pointer); cdecl; external libavutil;
function av_strdup(s: pchar): pchar; cdecl; external libavutil;
function av_strndup(s: pchar; len: Tsize_t): pchar; cdecl; external libavutil;
function av_memdup(p: pointer; size: Tsize_t): pointer; cdecl; external libavutil;
procedure av_memcpy_backptr(dst: Puint8_t; back: longint; cnt: longint); cdecl; external libavutil;
procedure av_dynarray_add(tab_ptr: pointer; nb_ptr: Plongint; elem: pointer); cdecl; external libavutil;
function av_dynarray_add_nofree(tab_ptr: pointer; nb_ptr: Plongint; elem: pointer): longint; cdecl; external libavutil;
function av_dynarray2_add(tab_ptr: Ppointer; nb_ptr: Plongint; elem_size: Tsize_t; elem_data: Puint8_t): pointer; cdecl; external libavutil;
function av_size_mult(a: Tsize_t; b: Tsize_t; r: Psize_t): longint; cdecl; external libavutil;
procedure av_max_alloc(max: Tsize_t); cdecl; external libavutil;

// === Konventiert am: 14-12-25 17:31:08 ===


implementation


end.
