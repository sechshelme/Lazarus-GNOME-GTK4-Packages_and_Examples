unit fp_lber;

interface

const
  {$IFDEF Linux}
  liblber = 'lber';
  {$ENDIF}

  {$IFDEF Windows}
  liblber = 'liblber.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  Tlong_double = extended;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  Tlong_double = double;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== /usr/include/lber_types.h

type
  TLBER_INT_T = longint;
  TLBER_TAG_T = Tclong;
  TLBER_SOCKET_T = longint;
  TLBER_LEN_T = Tclong;

type
  Pber_int_t = ^Tber_int_t;
  Tber_int_t = int32;

  Pber_sint_t = ^Tber_sint_t;
  Tber_sint_t = int32;

  Pber_uint_t = ^Tber_uint_t;
  Tber_uint_t = uint32;

  Pber_tag_t = ^Tber_tag_t;
  Tber_tag_t = Tculong;

  Pber_socket_t = ^Tber_socket_t;
  Tber_socket_t = longint;

  Pber_len_t = ^Tber_len_t;
  Tber_len_t = Tclong;

  Pber_slen_t = ^Tber_slen_t;
  Tber_slen_t = Tclong;


  // ==== /usr/include/lber.h

const
  LBER_CLASS_UNIVERSAL = Tber_tag_t($00);
  LBER_CLASS_APPLICATION = Tber_tag_t($40);
  LBER_CLASS_CONTEXT = Tber_tag_t($80);
  LBER_CLASS_PRIVATE = Tber_tag_t($C0);
  LBER_CLASS_MASK = Tber_tag_t($C0);

  LBER_PRIMITIVE = Tber_tag_t($00);
  LBER_CONSTRUCTED = Tber_tag_t($20);
  LBER_ENCODING_MASK = Tber_tag_t($20);

  LBER_BIG_TAG_MASK = Tber_tag_t($1F);
  LBER_MORE_TAG_MASK = Tber_tag_t($80);

  LBER_ERROR = Tber_int_t(-1);
  LBER_DEFAULT = Tber_int_t(-1);

  LBER_BOOLEAN = Tber_tag_t($01);
  LBER_INTEGER = Tber_tag_t($02);
  LBER_BITSTRING = Tber_tag_t($03);
  LBER_OCTETSTRING = Tber_tag_t($04);
  LBER_NULL = Tber_tag_t($05);
  LBER_ENUMERATED = Tber_tag_t($0A);

  LBER_SEQUENCE = Tber_tag_t($30);
  LBER_SET = Tber_tag_t($31);

const
  LBER_USE_DER = $01;

  LBER_OPT_BER_OPTIONS = $01;
  LBER_OPT_BER_DEBUG = $02;
  LBER_OPT_BER_REMAINING_BYTES = $03;
  LBER_OPT_BER_TOTAL_BYTES = $04;
  LBER_OPT_BER_BYTES_TO_WRITE = $05;
  LBER_OPT_BER_MEMCTX = $06;
  LBER_OPT_DEBUG_LEVEL = LBER_OPT_BER_DEBUG;
  LBER_OPT_REMAINING_BYTES = LBER_OPT_BER_REMAINING_BYTES;
  LBER_OPT_TOTAL_BYTES = LBER_OPT_BER_TOTAL_BYTES;
  LBER_OPT_BYTES_TO_WRITE = LBER_OPT_BER_BYTES_TO_WRITE;
  LBER_OPT_LOG_PRINT_FN = $8001;
  LBER_OPT_MEMORY_FNS = $8002;
  LBER_OPT_ERROR_FN = $8003;
  LBER_OPT_LOG_PRINT_FILE = $8004;
  LBER_OPT_MEMORY_INUSE = $8005;
  LBER_OPT_LOG_PROC = $8006;

type
  TBER_ERRNO_FN = function: Plongint; cdecl;

  TBER_LOG_PRINT_FN = procedure(buf: pchar); cdecl;
  TBER_MEMALLOC_FN = function(size: Tber_len_t; ctx: pointer): pointer; cdecl;
  TBER_MEMCALLOC_FN = function(n: Tber_len_t; size: Tber_len_t; ctx: pointer): pointer; cdecl;
  TBER_MEMREALLOC_FN = function(p: pointer; size: Tber_len_t; ctx: pointer): pointer; cdecl;
  TBER_MEMFREE_FN = procedure(p: pointer; ctx: pointer); cdecl;

  Tlber_memory_fns = record
    bmf_malloc: TBER_MEMALLOC_FN;
    bmf_calloc: TBER_MEMCALLOC_FN;
    bmf_realloc: TBER_MEMREALLOC_FN;
    bmf_free: TBER_MEMFREE_FN;
  end;
  Plber_memory_fns = ^Tlber_memory_fns;
  TBerMemoryFunctions = Tlber_memory_fns;
  PBerMemoryFunctions = ^TBerMemoryFunctions;

const
  LBER_SB_OPT_GET_FD = 1;
  LBER_SB_OPT_SET_FD = 2;
  LBER_SB_OPT_HAS_IO = 3;
  LBER_SB_OPT_SET_NONBLOCK = 4;
  LBER_SB_OPT_GET_SSL = 7;
  LBER_SB_OPT_DATA_READY = 8;
  LBER_SB_OPT_SET_READAHEAD = 9;
  LBER_SB_OPT_DRAIN = 10;
  LBER_SB_OPT_NEEDS_READ = 11;
  LBER_SB_OPT_NEEDS_WRITE = 12;
  LBER_SB_OPT_GET_MAX_INCOMING = 13;
  LBER_SB_OPT_SET_MAX_INCOMING = 14;
  LBER_SB_OPT_UNGET_BUF = 15;
  LBER_SB_OPT_OPT_MAX = 15;
  LBER_SBIOD_LEVEL_PROVIDER = 10;
  LBER_SBIOD_LEVEL_TRANSPORT = 20;
  LBER_SBIOD_LEVEL_APPLICATION = 30;
  LBER_OPT_SOCKBUF_DESC = $1000;
  LBER_OPT_SOCKBUF_OPTIONS = $1001;
  LBER_OPT_SOCKBUF_DEBUG = $1002;

var
  ber_pvt_opt_on: char; cvar;external liblber;

const
  LBER_OPT_ON = pointer(123); // ????
  LBER_OPT_OFF = pointer(0);

  LBER_OPT_SUCCESS = 0;
  LBER_OPT_ERROR = -(1);

type
  PSockbuf = type Pointer;
  PBerElement = type Pointer;
  PPBerElement = ^PBerElement;

  Psockbuf_io = ^Tsockbuf_io;
  Psockbuf_io_desc = ^Tsockbuf_io_desc;

  Tsockbuf_io = record
    sbi_setup: function(sbiod: PSockbuf_IO_Desc; arg: pointer): longint; cdecl;
    sbi_remove: function(sbiod: PSockbuf_IO_Desc): longint; cdecl;
    sbi_ctrl: function(sbiod: PSockbuf_IO_Desc; opt: longint; arg: pointer): longint; cdecl;
    sbi_read: function(sbiod: PSockbuf_IO_Desc; buf: pointer; len: Tber_len_t): Tber_slen_t; cdecl;
    sbi_write: function(sbiod: PSockbuf_IO_Desc; buf: pointer; len: Tber_len_t): Tber_slen_t; cdecl;
    sbi_close: function(sbiod: PSockbuf_IO_Desc): longint; cdecl;
  end;

  Tsockbuf_io_desc = record
    sbiod_level: longint;
    sbiod_sb: PSockbuf;
    sbiod_io: PSockbuf_IO;
    sbiod_pvt: pointer;
    sbiod_next: Psockbuf_io_desc;
  end;

type
  Tberval = record
    bv_len: Tber_len_t;
    bv_val: pchar;
  end;
  Pberval = ^Tberval;
  PPberval = ^Pberval;
  PPPberval = ^PPberval;
  TBerValue = Tberval;
  PBerValue = ^TBerValue;

  PBerVarray = ^TBerVarray;
  TBerVarray = PBerValue;

procedure ber_error_print(data: pchar); cdecl; external liblber;
procedure ber_bprint(data: pchar; len: Tber_len_t); cdecl; external liblber;
procedure ber_dump(ber: PBerElement; inout: longint); cdecl; external liblber;

type
  TBERDecodeCallback = function(ber: PBerElement; data: pointer; mode: longint): longint; cdecl;

function ber_get_tag(ber: PBerElement): Tber_tag_t; cdecl; external liblber;
function ber_skip_tag(ber: PBerElement; len: Pber_len_t): Tber_tag_t; cdecl; external liblber;
function ber_peek_tag(ber: PBerElement; len: Pber_len_t): Tber_tag_t; cdecl; external liblber;
function ber_skip_raw(ber: PBerElement; bv: Pberval): Tber_tag_t; cdecl; external liblber;
function ber_skip_element(ber: PBerElement; bv: Pberval): Tber_tag_t; cdecl; external liblber;
function ber_peek_element(ber: PBerElement; bv: Pberval): Tber_tag_t; cdecl; external liblber;
function ber_get_int(ber: PBerElement; num: Pber_int_t): Tber_tag_t; cdecl; external liblber;
function ber_get_enum(ber: PBerElement; num: Pber_int_t): Tber_tag_t; cdecl; external liblber;
function ber_decode_int(bv: Pberval; num: Pber_int_t): longint; cdecl; external liblber;
function ber_get_stringb(ber: PBerElement; buf: pchar; len: Pber_len_t): Tber_tag_t; cdecl; external liblber;

const
  LBER_BV_ALLOC = $01;
  LBER_BV_NOTERM = $02;
  LBER_BV_STRING = $04;

function ber_get_stringbv(ber: PBerElement; bv: Pberval; options: longint): Tber_tag_t; cdecl; external liblber;
function ber_get_stringa(ber: PBerElement; buf: PPchar): Tber_tag_t; cdecl; external liblber;
function ber_get_stringal(ber: PBerElement; bv: PPberval): Tber_tag_t; cdecl; external liblber;
function ber_get_bitstringa(ber: PBerElement; buf: PPchar; len: Pber_len_t): Tber_tag_t; cdecl; external liblber;
function ber_get_null(ber: PBerElement): Tber_tag_t; cdecl; external liblber;
function ber_get_boolean(ber: PBerElement; boolval: Pber_int_t): Tber_tag_t; cdecl; external liblber;
function ber_first_element(ber: PBerElement; len: Pber_len_t; last: PPchar): Tber_tag_t; cdecl; external liblber;
function ber_next_element(ber: PBerElement; len: Pber_len_t; last: pchar): Tber_tag_t; cdecl; external liblber;
function ber_scanf(ber: PBerElement; fmt: pchar): Tber_tag_t; cdecl; varargs; external liblber;
function ber_decode_oid(in_: Pberval; out_: Pberval): longint; cdecl; external liblber;

function ber_encode_oid(in_: Pberval; out_: Pberval): longint; cdecl; external liblber;

type
  TBEREncodeCallback = function(ber: PBerElement; data: pointer): longint; cdecl;

function ber_put_enum(ber: PBerElement; num: Tber_int_t; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_int(ber: PBerElement; num: Tber_int_t; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_ostring(ber: PBerElement; str: pchar; len: Tber_len_t; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_berval(ber: PBerElement; bv: Pberval; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_string(ber: PBerElement; str: pchar; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_bitstring(ber: PBerElement; str: pchar; bitlen: Tber_len_t; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_null(ber: PBerElement; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_boolean(ber: PBerElement; boolval: Tber_int_t; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_start_seq(ber: PBerElement; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_start_set(ber: PBerElement; tag: Tber_tag_t): longint; cdecl; external liblber;
function ber_put_seq(ber: PBerElement): longint; cdecl; external liblber;
function ber_put_set(ber: PBerElement): longint; cdecl; external liblber;
function ber_printf(ber: PBerElement; fmt: pchar): longint; cdecl; varargs; external liblber;

function ber_skip_data(ber: PBerElement; len: Tber_len_t): Tber_slen_t; cdecl; external liblber;
function ber_read(ber: PBerElement; buf: pchar; len: Tber_len_t): Tber_slen_t; cdecl; external liblber;
function ber_write(ber: PBerElement; buf: pchar; len: Tber_len_t; zero: longint): Tber_slen_t; cdecl; external liblber;
procedure ber_free(ber: PBerElement; freebuf: longint); cdecl; external liblber;
procedure ber_free_buf(ber: PBerElement); cdecl; external liblber;
function ber_flush2(sb: PSockbuf; ber: PBerElement; freeit: longint): longint; cdecl; external liblber;

const
  LBER_FLUSH_FREE_NEVER = $0;
  LBER_FLUSH_FREE_ON_SUCCESS = $1;
  LBER_FLUSH_FREE_ON_ERROR = $2;
  LBER_FLUSH_FREE_ALWAYS = LBER_FLUSH_FREE_ON_SUCCESS or LBER_FLUSH_FREE_ON_ERROR;

function ber_flush(sb: PSockbuf; ber: PBerElement; freeit: longint): longint; cdecl; external liblber;
function ber_alloc: PBerElement; cdecl; external liblber;
function der_alloc: PBerElement; cdecl; external liblber;
function ber_alloc_t(beroptions: longint): PBerElement; cdecl; external liblber;
function ber_dup(ber: PBerElement): PBerElement; cdecl; external liblber;
function ber_get_next(sb: PSockbuf; len: Pber_len_t; ber: PBerElement): Tber_tag_t; cdecl; external liblber;
procedure ber_init2(ber: PBerElement; bv: Pberval; options: longint); cdecl; external liblber;
procedure ber_init_w_nullc(ber: PBerElement; options: longint); cdecl; external liblber;
procedure ber_reset(ber: PBerElement; was_writing: longint); cdecl; external liblber;
function ber_init(bv: Pberval): PBerElement; cdecl; external liblber;
function ber_flatten(ber: PBerElement; bvPtr: PPberval): longint; cdecl; external liblber;
function ber_flatten2(ber: PBerElement; bv: Pberval; alloc: longint): longint; cdecl; external liblber;
function ber_remaining(ber: PBerElement): longint; cdecl; external liblber;
function ber_get_option(item: pointer; option: longint; outvalue: pointer): longint; cdecl; external liblber;
function ber_set_option(item: pointer; option: longint; invalue: pointer): longint; cdecl; external liblber;

function ber_sockbuf_alloc: PSockbuf; cdecl; external liblber;
procedure ber_sockbuf_free(sb: PSockbuf); cdecl; external liblber;
function ber_sockbuf_add_io(sb: PSockbuf; sbio: PSockbuf_IO; layer: longint; arg: pointer): longint; cdecl; external liblber;
function ber_sockbuf_remove_io(sb: PSockbuf; sbio: PSockbuf_IO; layer: longint): longint; cdecl; external liblber;
function ber_sockbuf_ctrl(sb: PSockbuf; opt: longint; arg: pointer): longint; cdecl; external liblber;

var
  ber_sockbuf_io_tcp: TSockbuf_IO; cvar;external liblber;
  ber_sockbuf_io_readahead: TSockbuf_IO; cvar;external liblber;
  ber_sockbuf_io_fd: TSockbuf_IO; cvar;external liblber;
  ber_sockbuf_io_debug: TSockbuf_IO; cvar;external liblber;
  ber_sockbuf_io_udp: TSockbuf_IO; cvar;external liblber;

function ber_memalloc(s: Tber_len_t): pointer; cdecl; external liblber;
function ber_memrealloc(p: pointer; s: Tber_len_t): pointer; cdecl; external liblber;
function ber_memcalloc(n: Tber_len_t; s: Tber_len_t): pointer; cdecl; external liblber;
procedure ber_memfree(p: pointer); cdecl; external liblber;
procedure ber_memvfree(vector: Ppointer); cdecl; external liblber;
procedure ber_bvfree(bv: Pberval); cdecl; external liblber;
procedure ber_bvecfree(bv: PPberval); cdecl; external liblber;
function ber_bvecadd(bvec: PPPberval; bv: Pberval): longint; cdecl; external liblber;
function ber_dupbv(dst: Pberval; src: Pberval): Pberval; cdecl; external liblber;
function ber_bvdup(src: Pberval): Pberval; cdecl; external liblber;
function ber_mem2bv(para1: pchar; len: Tber_len_t; duplicate: longint; bv: Pberval): Pberval; cdecl; external liblber;
function ber_str2bv(para1: pchar; len: Tber_len_t; duplicate: longint; bv: Pberval): Pberval; cdecl; external liblber;

function ber_bvstr(s: pansichar): PBerVal; inline;
function ber_bvstrdup(s: pansichar): PBerVal; inline;

function ber_strdup(para1: pchar): pchar; cdecl; external liblber;
function ber_strnlen(s: pchar; len: Tber_len_t): Tber_len_t; cdecl; external liblber;
function ber_strndup(s: pchar; l: Tber_len_t): pchar; cdecl; external liblber;
function ber_bvreplace(dst: Pberval; src: Pberval): Pberval; cdecl; external liblber;
procedure ber_bvarray_free(p: TBerVarray); cdecl; external liblber;
function ber_bvarray_add(p: PBerVarray; bv: PBerValue): longint; cdecl; external liblber;

function ber_bvcmp(v1, v2: PBerVal): integer; inline;

function ber_errno_addr: Plongint; cdecl; external liblber;

const
  LBER_ERROR_NONE = 0;
  LBER_ERROR_PARAM = $1;
  LBER_ERROR_MEMORY = $2;

  // === Konventiert am: 12-12-25 17:23:43 ===


implementation


function ber_bvstr(s: pansichar): PBerVal; inline;
begin
  Result := ber_str2bv(s, 0, 0, nil);
end;

function ber_bvstrdup(s: pansichar): PBerVal; inline;
begin
  Result := ber_str2bv(s, 0, 1, nil);
end;


function ber_bvcmp(v1, v2: PBerVal): integer; inline;
begin
  if v1^.bv_len < v2^.bv_len then begin
    Result := -1;
  end else if v1^.bv_len > v2^.bv_len then begin
    Result := 1;
  end else begin
    Result := CompareByte(v1^.bv_val, v2^.bv_val, v1^.bv_len);
  end;
end;

end.
