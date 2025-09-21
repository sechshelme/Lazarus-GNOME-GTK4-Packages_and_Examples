{$IFDEF read_interface}


type
  PGMimeStreamBufferMode = ^TGMimeStreamBufferMode;
  TGMimeStreamBufferMode = longint;

const
  GMIME_STREAM_BUFFER_BLOCK_READ = 0;
  GMIME_STREAM_BUFFER_BLOCK_WRITE = 1;

type
  TGMimeStreamBuffer = record
    parent_object: TGMimeStream;
    mode: TGMimeStreamBufferMode;
    source: PGMimeStream;
    buffer: pchar;
    bufptr: pchar;
    bufend: pchar;
    buflen: Tsize_t;
  end;
  PGMimeStreamBuffer = ^TGMimeStreamBuffer;

  TGMimeStreamBufferClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamBufferClass = ^TGMimeStreamBufferClass;

function g_mime_stream_buffer_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_buffer_new(source: PGMimeStream; mode: TGMimeStreamBufferMode): PGMimeStream; cdecl; external libgmime3;
function g_mime_stream_buffer_gets(stream: PGMimeStream; buf: pchar; max: Tsize_t): Tssize_t; cdecl; external libgmime3;
procedure g_mime_stream_buffer_readln(stream: PGMimeStream; buffer: PGByteArray); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:33:44 ===

function GMIME_TYPE_STREAM_BUFFER: TGType;
function GMIME_STREAM_BUFFER(obj: Pointer): PGMimeStreamBuffer;
function GMIME_STREAM_BUFFER_CLASS(klass: Pointer): PGMimeStreamBufferClass;
function GMIME_IS_STREAM_BUFFER(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_BUFFER_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_BUFFER_GET_CLASS(obj: Pointer): PGMimeStreamBufferClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_BUFFER: TGType;
begin
  GMIME_TYPE_STREAM_BUFFER := g_mime_stream_buffer_get_type;
end;

function GMIME_STREAM_BUFFER(obj: Pointer): PGMimeStreamBuffer;
begin
  Result := PGMimeStreamBuffer(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_BUFFER));
end;

function GMIME_STREAM_BUFFER_CLASS(klass: Pointer): PGMimeStreamBufferClass;
begin
  Result := PGMimeStreamBufferClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_BUFFER));
end;

function GMIME_IS_STREAM_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_BUFFER);
end;

function GMIME_IS_STREAM_BUFFER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_BUFFER);
end;

function GMIME_STREAM_BUFFER_GET_CLASS(obj: Pointer): PGMimeStreamBufferClass;
begin
  Result := PGMimeStreamBufferClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
