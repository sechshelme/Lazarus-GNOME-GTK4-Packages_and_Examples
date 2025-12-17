unit fifo;

interface

uses
  fp_ffmpeg;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PAVFifo = type Pointer;
  PPAVFifo = ^PAVFifo;
  TAVFifoCB = function(opaque: Pointer; buf: Pointer; nb_elems: Psize_t): integer; cdecl;

const
  AV_FIFO_FLAG_AUTO_GROW = 1 shl 0;

function av_fifo_alloc2(elems: Tsize_t; elem_size: Tsize_t; flags: dword): PAVFifo; cdecl; external libavutil;
function av_fifo_elem_size(f: PAVFifo): Tsize_t; cdecl; external libavutil;
procedure av_fifo_auto_grow_limit(f: PAVFifo; max_elems: Tsize_t); cdecl; external libavutil;
function av_fifo_can_read(f: PAVFifo): Tsize_t; cdecl; external libavutil;
function av_fifo_can_write(f: PAVFifo): Tsize_t; cdecl; external libavutil;
function av_fifo_grow2(f: PAVFifo; inc: Tsize_t): longint; cdecl; external libavutil;
function av_fifo_write(f: PAVFifo; buf: pointer; nb_elems: Tsize_t): longint; cdecl; external libavutil;
function av_fifo_write_from_cb(f: PAVFifo; read_cb: TAVFifoCB; opaque: pointer; nb_elems: Psize_t): longint; cdecl; external libavutil;
function av_fifo_read(f: PAVFifo; buf: pointer; nb_elems: Tsize_t): longint; cdecl; external libavutil;
function av_fifo_read_to_cb(f: PAVFifo; write_cb: TAVFifoCB; opaque: pointer; nb_elems: Psize_t): longint; cdecl; external libavutil;
function av_fifo_peek(f: PAVFifo; buf: pointer; nb_elems: Tsize_t; offset: Tsize_t): longint; cdecl; external libavutil;
function av_fifo_peek_to_cb(f: PAVFifo; write_cb: TAVFifoCB; opaque: pointer; nb_elems: Psize_t; offset: Tsize_t): longint; cdecl; external libavutil;
procedure av_fifo_drain2(f: PAVFifo; size: Tsize_t); cdecl; external libavutil;
procedure av_fifo_reset2(f: PAVFifo); cdecl; external libavutil;
procedure av_fifo_freep2(f: PPAVFifo); cdecl; external libavutil;

type
  TAVFifoBuffer = record
    buffer: Puint8_t;
    rptr: Puint8_t;
    wptr: Puint8_t;
    end_: Puint8_t;
    rndx: Tuint32_t;
    wndx: Tuint32_t;
  end;
  PAVFifoBuffer = ^TAVFifoBuffer;
  PPAVFifoBuffer = ^PAVFifoBuffer;

function av_fifo_alloc(size: dword): PAVFifoBuffer; cdecl; external libavutil; deprecated;
function av_fifo_alloc_array(nmemb: Tsize_t; size: Tsize_t): PAVFifoBuffer; cdecl; external libavutil; deprecated;
procedure av_fifo_free(f: PAVFifoBuffer); cdecl; external libavutil; deprecated;
procedure av_fifo_freep(f: PPAVFifoBuffer); cdecl; external libavutil; deprecated;
procedure av_fifo_reset(f: PAVFifoBuffer); cdecl; external libavutil; deprecated;
function av_fifo_size(f: PAVFifoBuffer): longint; cdecl; external libavutil; deprecated;
function av_fifo_space(f: PAVFifoBuffer): longint; cdecl; external libavutil; deprecated;

type
  Tfifo_generic_func = procedure(para1: pointer; para2: pointer; para3: longint); cdecl;
  Tfifo_generic_write_func = function(para1: pointer; para2: pointer; para3: longint): longint; cdecl;

function av_fifo_generic_peek_at(f: PAVFifoBuffer; dest: pointer; offset: longint; buf_size: longint; func: Tfifo_generic_func): longint; cdecl; external libavutil; deprecated;
function av_fifo_generic_peek(f: PAVFifoBuffer; dest: pointer; buf_size: longint; func: Tfifo_generic_func): longint; cdecl; external libavutil; deprecated;
function av_fifo_generic_read(f: PAVFifoBuffer; dest: pointer; buf_size: longint; func: Tfifo_generic_func): longint; cdecl; external libavutil; deprecated;
function av_fifo_generic_write(f: PAVFifoBuffer; src: pointer; size: longint; func: Tfifo_generic_write_func): longint; cdecl; external libavutil; deprecated;
function av_fifo_realloc2(f: PAVFifoBuffer; size: dword): longint; cdecl; external libavutil; deprecated;
function av_fifo_grow(f: PAVFifoBuffer; additional_space: dword): longint; cdecl; external libavutil; deprecated;
procedure av_fifo_drain(f: PAVFifoBuffer; size: longint); cdecl; external libavutil; deprecated;

// === Konventiert am: 14-12-25 17:00:53 ===


implementation



end.
