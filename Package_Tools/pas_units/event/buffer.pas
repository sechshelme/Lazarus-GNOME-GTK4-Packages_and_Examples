unit buffer;

interface

uses
  clib, fp_event, util;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Pevbuffer = type Pointer;

  Tevbuffer_ptr = record
    pos: Tev_ssize_t;
    internal_: record
      chain: pointer;
      pos_in_chain: Tsize_t;
      end;
  end;
  Pevbuffer_ptr = ^Tevbuffer_ptr;

type
  Tevbuffer_iovec = record
    iov_base: pointer;
    iov_len: Tsize_t;
  end;
  Pevbuffer_iovec = ^Tevbuffer_iovec;

function evbuffer_new: Pevbuffer; cdecl; external libevent;
procedure evbuffer_free(buf: Pevbuffer); cdecl; external libevent;
function evbuffer_enable_locking(buf: Pevbuffer; lock: pointer): longint; cdecl; external libevent;
procedure evbuffer_lock(buf: Pevbuffer); cdecl; external libevent;
procedure evbuffer_unlock(buf: Pevbuffer); cdecl; external libevent;

const
  EVBUFFER_FLAG_DRAINS_TO_FD = 1;

function evbuffer_set_flags(buf: Pevbuffer; flags: Tev_uint64_t): longint; cdecl; external libevent;
function evbuffer_clear_flags(buf: Pevbuffer; flags: Tev_uint64_t): longint; cdecl; external libevent;
function evbuffer_get_length(buf: Pevbuffer): Tsize_t; cdecl; external libevent;
function evbuffer_get_contiguous_space(buf: Pevbuffer): Tsize_t; cdecl; external libevent;
function evbuffer_expand(buf: Pevbuffer; datlen: Tsize_t): longint; cdecl; external libevent;
function evbuffer_reserve_space(buf: Pevbuffer; size: Tev_ssize_t; vec: Pevbuffer_iovec; n_vec: longint): longint; cdecl; external libevent;
function evbuffer_commit_space(buf: Pevbuffer; vec: Pevbuffer_iovec; n_vecs: longint): longint; cdecl; external libevent;
function evbuffer_add(buf: Pevbuffer; data: pointer; datlen: Tsize_t): longint; cdecl; external libevent;
function evbuffer_remove(buf: Pevbuffer; data: pointer; datlen: Tsize_t): longint; cdecl; external libevent;
function evbuffer_copyout(buf: Pevbuffer; data_out: pointer; datlen: Tsize_t): Tev_ssize_t; cdecl; external libevent;
function evbuffer_copyout_from(buf: Pevbuffer; pos: Pevbuffer_ptr; data_out: pointer; datlen: Tsize_t): Tev_ssize_t; cdecl; external libevent;
function evbuffer_remove_buffer(src: Pevbuffer; dst: Pevbuffer; datlen: Tsize_t): longint; cdecl; external libevent;

type
  Tevbuffer_eol_style = longint;

const
  EVBUFFER_EOL_ANY = 0;
  EVBUFFER_EOL_CRLF = 1;
  EVBUFFER_EOL_CRLF_STRICT = 2;
  EVBUFFER_EOL_LF = 3;
  EVBUFFER_EOL_NUL = 4;

function evbuffer_readln(buffer: Pevbuffer; n_read_out: Psize_t; eol_style: Tevbuffer_eol_style): pchar; cdecl; external libevent;
function evbuffer_add_buffer(outbuf: Pevbuffer; inbuf: Pevbuffer): longint; cdecl; external libevent;
function evbuffer_add_buffer_reference(outbuf: Pevbuffer; inbuf: Pevbuffer): longint; cdecl; external libevent;

type
  Tevbuffer_ref_cleanup_cb = procedure(data: pointer; datalen: Tsize_t; extra: pointer); cdecl;

function evbuffer_add_reference(outbuf: Pevbuffer; data: pointer; datlen: Tsize_t; cleanupfn: Tevbuffer_ref_cleanup_cb; cleanupfn_arg: pointer): longint; cdecl; external libevent;
function evbuffer_add_file(outbuf: Pevbuffer; fd: longint; offset: Tev_off_t; length: Tev_off_t): longint; cdecl; external libevent;

type
  Pevbuffer_file_segment = type Pointer;

const
  EVBUF_FS_CLOSE_ON_FREE = $01;
  EVBUF_FS_DISABLE_MMAP = $02;
  EVBUF_FS_DISABLE_SENDFILE = $04;
  EVBUF_FS_DISABLE_LOCKING = $08;

type
  Tevbuffer_file_segment_cleanup_cb = procedure(seg: Pevbuffer_file_segment; flags: longint; arg: pointer); cdecl;

function evbuffer_file_segment_new(fd: longint; offset: Tev_off_t; length: Tev_off_t; flags: dword): Pevbuffer_file_segment; cdecl; external libevent;
procedure evbuffer_file_segment_free(seg: Pevbuffer_file_segment); cdecl; external libevent;
procedure evbuffer_file_segment_add_cleanup_cb(seg: Pevbuffer_file_segment; cb: Tevbuffer_file_segment_cleanup_cb; arg: pointer); cdecl; external libevent;
function evbuffer_add_file_segment(buf: Pevbuffer; seg: Pevbuffer_file_segment; offset: Tev_off_t; length: Tev_off_t): longint; cdecl; external libevent;
function evbuffer_add_printf(buf: Pevbuffer; fmt: pchar): longint; cdecl; varargs; external libevent;
function evbuffer_add_vprintf(buf: Pevbuffer; fmt: pchar; ap: Tva_list): longint; cdecl; external libevent;
function evbuffer_drain(buf: Pevbuffer; len: Tsize_t): longint; cdecl; external libevent;
function evbuffer_write(buffer: Pevbuffer; fd: Tevutil_socket_t): longint; cdecl; external libevent;
function evbuffer_write_atmost(buffer: Pevbuffer; fd: Tevutil_socket_t; howmuch: Tev_ssize_t): longint; cdecl; external libevent;
function evbuffer_read(buffer: Pevbuffer; fd: Tevutil_socket_t; howmuch: longint): longint; cdecl; external libevent;
function evbuffer_search(buffer: Pevbuffer; what: pchar; len: Tsize_t; start: Pevbuffer_ptr): Tevbuffer_ptr; cdecl; external libevent;
function evbuffer_search_range(buffer: Pevbuffer; what: pchar; len: Tsize_t; start: Pevbuffer_ptr; end_: Pevbuffer_ptr): Tevbuffer_ptr; cdecl; external libevent;

type
  Tevbuffer_ptr_how = longint;

const
  EVBUFFER_PTR_SET_ = 0;
  EVBUFFER_PTR_ADD = 1;

function evbuffer_ptr_set(buffer: Pevbuffer; ptr: Pevbuffer_ptr; position: Tsize_t; how: Tevbuffer_ptr_how): longint; cdecl; external libevent;
function evbuffer_search_eol(buffer: Pevbuffer; start: Pevbuffer_ptr; eol_len_out: Psize_t; eol_style: Tevbuffer_eol_style): Tevbuffer_ptr; cdecl; external libevent;
function evbuffer_peek(buffer: Pevbuffer; len: Tev_ssize_t; start_at: Pevbuffer_ptr; vec_out: Pevbuffer_iovec; n_vec: longint): longint; cdecl; external libevent;

type
  Tevbuffer_cb_info = record
    orig_size: Tsize_t;
    n_added: Tsize_t;
    n_deleted: Tsize_t;
  end;
  Pevbuffer_cb_info = ^Tevbuffer_cb_info;

  Tevbuffer_cb_func = procedure(buffer: Pevbuffer; info: Pevbuffer_cb_info; arg: pointer); cdecl;
  Pevbuffer_cb_entry = type Pointer;

function evbuffer_add_cb(buffer: Pevbuffer; cb: Tevbuffer_cb_func; cbarg: pointer): Pevbuffer_cb_entry; cdecl; external libevent;
function evbuffer_remove_cb_entry(buffer: Pevbuffer; ent: Pevbuffer_cb_entry): longint; cdecl; external libevent;
function evbuffer_remove_cb(buffer: Pevbuffer; cb: Tevbuffer_cb_func; cbarg: pointer): longint; cdecl; external libevent;

const
  EVBUFFER_CB_ENABLED = 1;

function evbuffer_cb_set_flags(buffer: Pevbuffer; cb: Pevbuffer_cb_entry; flags: Tev_uint32_t): longint; cdecl; external libevent;
function evbuffer_cb_clear_flags(buffer: Pevbuffer; cb: Pevbuffer_cb_entry; flags: Tev_uint32_t): longint; cdecl; external libevent;
function evbuffer_pullup(buf: Pevbuffer; size: Tev_ssize_t): pbyte; cdecl; external libevent;
function evbuffer_prepend(buf: Pevbuffer; data: pointer; size: Tsize_t): longint; cdecl; external libevent;
function evbuffer_prepend_buffer(dst: Pevbuffer; src: Pevbuffer): longint; cdecl; external libevent;
function evbuffer_freeze(buf: Pevbuffer; at_front: longint): longint; cdecl; external libevent;
function evbuffer_unfreeze(buf: Pevbuffer; at_front: longint): longint; cdecl; external libevent;

type
  Pevent_base = type Pointer;

function evbuffer_defer_callbacks(buffer: Pevbuffer; base: Pevent_base): longint; cdecl; external libevent;
function evbuffer_add_iovec(buffer: Pevbuffer; vec: Pevbuffer_iovec; n_vec: longint): Tsize_t; cdecl; external libevent;

// === Konventiert am: 25-8-25 19:48:18 ===


implementation



end.
