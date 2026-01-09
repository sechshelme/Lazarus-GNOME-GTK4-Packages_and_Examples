{$IFDEF read_interface}


const
  AVIO_SEEKABLE_NORMAL = 1 shl 0;
  AVIO_SEEKABLE_TIME = 1 shl 1;

type
  TAVIOInterruptCB = record
    callback: function(para1: pointer): longint; cdecl;
    opaque: pointer;
  end;
  PAVIOInterruptCB = ^TAVIOInterruptCB;

type
  TAVIODirEntryType = longint;

const
  AVIO_ENTRY_UNKNOWN = 0;
  AVIO_ENTRY_BLOCK_DEVICE = 1;
  AVIO_ENTRY_CHARACTER_DEVICE = 2;
  AVIO_ENTRY_DIRECTORY = 3;
  AVIO_ENTRY_NAMED_PIPE = 4;
  AVIO_ENTRY_SYMBOLIC_LINK = 5;
  AVIO_ENTRY_SOCKET = 6;
  AVIO_ENTRY_FILE = 7;
  AVIO_ENTRY_SERVER = 8;
  AVIO_ENTRY_SHARE = 9;
  AVIO_ENTRY_WORKGROUP = 10;

type
  TAVIODirEntry = record
    name: pchar;
    _type: longint;
    utf8: longint;
    size: Tint64_t;
    modification_timestamp: Tint64_t;
    access_timestamp: Tint64_t;
    status_change_timestamp: Tint64_t;
    user_id: Tint64_t;
    group_id: Tint64_t;
    filemode: Tint64_t;
  end;
  PAVIODirEntry = ^TAVIODirEntry;
  PPAVIODirEntry = ^PAVIODirEntry;

type
  PAVIODirContext = type Pointer;
  PPAVIODirContext = ^PAVIODirContext;

type
  TAVIODataMarkerType = longint;

const
  AVIO_DATA_MARKER_HEADER = 0;
  AVIO_DATA_MARKER_SYNC_POINT = 1;
  AVIO_DATA_MARKER_BOUNDARY_POINT = 2;
  AVIO_DATA_MARKER_UNKNOWN = 3;
  AVIO_DATA_MARKER_TRAILER = 4;
  AVIO_DATA_MARKER_FLUSH_POINT = 5;

type
  PAVIOContext = ^TAVIOContext;
  PPAVIOContext = ^PAVIOContext;

  TAVIOContext = record
    av_class: PAVClass;
    buffer: pbyte;
    buffer_size: longint;
    buf_ptr: pbyte;
    buf_end: pbyte;
    opaque: pointer;
    read_packet: function(opaque: pointer; buf: Puint8_t; buf_size: longint): longint; cdecl;
    write_packet: function(opaque: pointer; buf: Puint8_t; buf_size: longint): longint; cdecl;
    seek: function(opaque: pointer; offset: Tint64_t; whence: longint): Tint64_t; cdecl;
    pos: Tint64_t;
    eof_reached: longint;
    error: longint;
    write_flag: longint;
    max_packet_size: longint;
    min_packet_size: longint;
    checksum: dword;
    checksum_ptr: pbyte;
    update_checksum: function(checksum: dword; buf: Puint8_t; size: dword): dword; cdecl;
    read_pause: function(opaque: pointer; pause: longint): longint; cdecl;
    read_seek: function(opaque: pointer; stream_index: longint; timestamp: Tint64_t; flags: longint): Tint64_t; cdecl;
    seekable: longint;
    direct: longint;
    protocol_whitelist: pchar;
    protocol_blacklist: pchar;
    write_data_type: function(opaque: pointer; buf: Puint8_t; buf_size: longint; _type: TAVIODataMarkerType; time: Tint64_t): longint; cdecl;
    ignore_boundary_point: longint;
    buf_ptr_max: pbyte;
    bytes_read: Tint64_t;
    bytes_written: Tint64_t;
  end;

function avio_find_protocol_name(url: pchar): pchar; cdecl; external libavformat;
function avio_check(url: pchar; flags: longint): longint; cdecl; external libavformat;
function avio_open_dir(s: PPAVIODirContext; url: pchar; options: PPAVDictionary): longint; cdecl; external libavformat;
function avio_read_dir(s: PAVIODirContext; next: PPAVIODirEntry): longint; cdecl; external libavformat;
function avio_close_dir(s: PPAVIODirContext): longint; cdecl; external libavformat;
procedure avio_free_directory_entry(entry: PPAVIODirEntry); cdecl; external libavformat;

type
  TAVIOReadPacket = function(opaque: Pointer; buf: PUInt8; buf_size: longint): longint; cdecl;
  TAVIOWritePacket = function(opaque: Pointer; buf: PUInt8; buf_size: longint): longint; cdecl;
  TAVIOSeek = function(opaque: Pointer; offset: Tint64_t; whence: longint): Tint64_t; cdecl;

function avio_alloc_context(buffer: pbyte; buffer_size: longint; write_flag: longint;
  opaque: Pointer; read_packet: TAVIOReadPacket; write_packet: TAVIOWritePacket; seek: TAVIOSeek): PAVIOContext; cdecl; external 'libavformat';

procedure avio_context_free(s: PPAVIOContext); cdecl; external libavformat;
procedure avio_w8(s: PAVIOContext; b: longint); cdecl; external libavformat;
procedure avio_write(s: PAVIOContext; buf: pbyte; size: longint); cdecl; external libavformat;
procedure avio_wl64(s: PAVIOContext; val: Tuint64_t); cdecl; external libavformat;
procedure avio_wb64(s: PAVIOContext; val: Tuint64_t); cdecl; external libavformat;
procedure avio_wl32(s: PAVIOContext; val: dword); cdecl; external libavformat;
procedure avio_wb32(s: PAVIOContext; val: dword); cdecl; external libavformat;
procedure avio_wl24(s: PAVIOContext; val: dword); cdecl; external libavformat;
procedure avio_wb24(s: PAVIOContext; val: dword); cdecl; external libavformat;
procedure avio_wl16(s: PAVIOContext; val: dword); cdecl; external libavformat;
procedure avio_wb16(s: PAVIOContext; val: dword); cdecl; external libavformat;
function avio_put_str(s: PAVIOContext; str: pchar): longint; cdecl; external libavformat;
function avio_put_str16le(s: PAVIOContext; str: pchar): longint; cdecl; external libavformat;
function avio_put_str16be(s: PAVIOContext; str: pchar): longint; cdecl; external libavformat;
procedure avio_write_marker(s: PAVIOContext; time: Tint64_t; _type: TAVIODataMarkerType); cdecl; external libavformat;

const
  AVSEEK_SIZE = $10000;
  AVSEEK_FORCE = $20000;

function avio_seek(s: PAVIOContext; offset: Tint64_t; whence: longint): Tint64_t; cdecl; external libavformat;
function avio_skip(s: PAVIOContext; offset: Tint64_t): Tint64_t; cdecl; external libavformat;
function avio_size(s: PAVIOContext): Tint64_t; cdecl; external libavformat;
function avio_feof(s: PAVIOContext): longint; cdecl; external libavformat;
function avio_vprintf(s: PAVIOContext; fmt: pchar; ap: Tva_list): longint; cdecl; external libavformat;
function avio_printf(s: PAVIOContext; fmt: pchar): longint; cdecl; varargs; external libavformat;
procedure avio_print_string_array(s: PAVIOContext; strings: PPchar); cdecl; external libavformat;
procedure avio_flush(s: PAVIOContext); cdecl; external libavformat;
function avio_read(s: PAVIOContext; buf: pbyte; size: longint): longint; cdecl; external libavformat;
function avio_read_partial(s: PAVIOContext; buf: pbyte; size: longint): longint; cdecl; external libavformat;

function avio_r8(s: PAVIOContext): longint; cdecl; external libavformat;
function avio_rl16(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rl24(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rl32(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rl64(s: PAVIOContext): Tuint64_t; cdecl; external libavformat;
function avio_rb16(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rb24(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rb32(s: PAVIOContext): dword; cdecl; external libavformat;
function avio_rb64(s: PAVIOContext): Tuint64_t; cdecl; external libavformat;

function avio_get_str(pb: PAVIOContext; maxlen: longint; buf: pchar; buflen: longint): longint; cdecl; external libavformat;
function avio_get_str16le(pb: PAVIOContext; maxlen: longint; buf: pchar; buflen: longint): longint; cdecl; external libavformat;
function avio_get_str16be(pb: PAVIOContext; maxlen: longint; buf: pchar; buflen: longint): longint; cdecl; external libavformat;

const
  AVIO_FLAG_READ = 1;
  AVIO_FLAG_WRITE = 2;
  AVIO_FLAG_READ_WRITE = AVIO_FLAG_READ or AVIO_FLAG_WRITE;
  AVIO_FLAG_NONBLOCK = 8;
  AVIO_FLAG_DIRECT = $8000;

function avio_open(s: PPAVIOContext; url: pchar; flags: longint): longint; cdecl; external libavformat;
function avio_open2(s: PPAVIOContext; url: pchar; flags: longint; int_cb: PAVIOInterruptCB; options: PPAVDictionary): longint; cdecl; external libavformat;
function avio_close(s: PAVIOContext): longint; cdecl; external libavformat;
function avio_closep(s: PPAVIOContext): longint; cdecl; external libavformat;
function avio_open_dyn_buf(s: PPAVIOContext): longint; cdecl; external libavformat;
function avio_get_dyn_buf(s: PAVIOContext; pbuffer: PPuint8_t): longint; cdecl; external libavformat;
function avio_close_dyn_buf(s: PAVIOContext; pbuffer: PPuint8_t): longint; cdecl; external libavformat;
function avio_enum_protocols(opaque: Ppointer; output: longint): pchar; cdecl; external libavformat;
function avio_protocol_get_class(name: pchar): PAVClass; cdecl; external libavformat;
function avio_pause(h: PAVIOContext; pause: longint): longint; cdecl; external libavformat;
function avio_seek_time(h: PAVIOContext; stream_index: longint; timestamp: Tint64_t; flags: longint): Tint64_t; cdecl; external libavformat;

function avio_read_to_bprint(h: PAVIOContext; pb: PAVBPrint; max_size: Tsize_t): longint; cdecl; external libavformat;
function avio_accept(s: PAVIOContext; c: PPAVIOContext): longint; cdecl; external libavformat;
function avio_handshake(c: PAVIOContext): longint; cdecl; external libavformat;

// === Konventiert am: 14-12-25 15:21:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
