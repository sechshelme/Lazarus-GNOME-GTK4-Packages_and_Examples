{$IFDEF read_interface}


type
  PGMimeSeekWhence = ^TGMimeSeekWhence;
  TGMimeSeekWhence = longint;

const
  GMIME_STREAM_SEEK_SET = SEEK_SET;
  GMIME_STREAM_SEEK_CUR = SEEK_CUR;
  GMIME_STREAM_SEEK_END = SEEK_END;

type
  TGMimeStreamIOVector = record
    data: pointer;
    len: Tsize_t;
  end;
  PGMimeStreamIOVector = ^TGMimeStreamIOVector;

  PGMimeStream = ^TGMimeStream;

  TGMimeStream = record
    parent_object: TGObject;
    super_stream: PGMimeStream;
    position: Tgint64;
    bound_start: Tgint64;
    bound_end: Tgint64;
  end;

  TGMimeStreamClass = record
    parent_class: TGObjectClass;
    read: function(stream: PGMimeStream; buf: pchar; len: Tsize_t): Tssize_t; cdecl;
    write: function(stream: PGMimeStream; buf: pchar; len: Tsize_t): Tssize_t; cdecl;
    flush: function(stream: PGMimeStream): longint; cdecl;
    close: function(stream: PGMimeStream): longint; cdecl;
    eos: function(stream: PGMimeStream): Tgboolean; cdecl;
    reset: function(stream: PGMimeStream): longint; cdecl;
    seek: function(stream: PGMimeStream; offset: Tgint64; whence: TGMimeSeekWhence): Tgint64; cdecl;
    tell: function(stream: PGMimeStream): Tgint64; cdecl;
    length: function(stream: PGMimeStream): Tgint64; cdecl;
    substream: function(stream: PGMimeStream; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl;
  end;
  PGMimeStreamClass = ^TGMimeStreamClass;

function g_mime_stream_get_type: TGType; cdecl; external libgmime3;
procedure g_mime_stream_construct(stream: PGMimeStream; start: Tgint64; end_: Tgint64); cdecl; external libgmime3;
function g_mime_stream_read(stream: PGMimeStream; buf: pchar; len: Tsize_t): Tssize_t; cdecl; external libgmime3;
function g_mime_stream_write(stream: PGMimeStream; buf: pchar; len: Tsize_t): Tssize_t; cdecl; external libgmime3;
function g_mime_stream_flush(stream: PGMimeStream): longint; cdecl; external libgmime3;
function g_mime_stream_close(stream: PGMimeStream): longint; cdecl; external libgmime3;
function g_mime_stream_eos(stream: PGMimeStream): Tgboolean; cdecl; external libgmime3;
function g_mime_stream_reset(stream: PGMimeStream): longint; cdecl; external libgmime3;
function g_mime_stream_seek(stream: PGMimeStream; offset: Tgint64; whence: TGMimeSeekWhence): Tgint64; cdecl; external libgmime3;
function g_mime_stream_tell(stream: PGMimeStream): Tgint64; cdecl; external libgmime3;
function g_mime_stream_length(stream: PGMimeStream): Tgint64; cdecl; external libgmime3;
function g_mime_stream_substream(stream: PGMimeStream; start: Tgint64; end_: Tgint64): PGMimeStream; cdecl; external libgmime3;
procedure g_mime_stream_set_bounds(stream: PGMimeStream; start: Tgint64; end_: Tgint64); cdecl; external libgmime3;
function g_mime_stream_write_string(stream: PGMimeStream; str: pchar): Tssize_t; cdecl; external libgmime3;
function g_mime_stream_printf(stream: PGMimeStream; fmt: pchar): Tssize_t; cdecl; varargs; external libgmime3;
function g_mime_stream_write_to_stream(src: PGMimeStream; dest: PGMimeStream): Tgint64; cdecl; external libgmime3;
function g_mime_stream_writev(stream: PGMimeStream; vector: PGMimeStreamIOVector; count: Tsize_t): Tgint64; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:36 ===

function GMIME_TYPE_STREAM: TGType;
function GMIME_STREAM(obj: Pointer): PGMimeStream;
function GMIME_STREAM_CLASS(klass: Pointer): PGMimeStreamClass;
function GMIME_IS_STREAM(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_GET_CLASS(obj: Pointer): PGMimeStreamClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM: TGType;
begin
  GMIME_TYPE_STREAM := g_mime_stream_get_type;
end;

function GMIME_STREAM(obj: Pointer): PGMimeStream;
begin
  Result := PGMimeStream(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM));
end;

function GMIME_STREAM_CLASS(klass: Pointer): PGMimeStreamClass;
begin
  Result := PGMimeStreamClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM));
end;

function GMIME_IS_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM);
end;

function GMIME_IS_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM);
end;

function GMIME_STREAM_GET_CLASS(obj: Pointer): PGMimeStreamClass;
begin
  Result := PGMimeStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
