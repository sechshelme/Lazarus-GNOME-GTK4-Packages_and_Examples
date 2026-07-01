

  {$IFDEF read_struct}
type
  PGFileIOStreamPrivate = type Pointer;

  PPGFileIOStream = ^PGFileIOStream;
  PGFileIOStream = ^TGFileIOStream;
  TGFileIOStream = record
    parent_instance: TGIOStream;
    priv: PGFileIOStreamPrivate;
  end;

  PGFileIOStreamClass = ^TGFileIOStreamClass;
  TGFileIOStreamClass = record
    parent_class: TGIOStreamClass;
    tell: function(stream: PGFileIOStream): Tgoffset; cdecl;
    can_seek: function(stream: PGFileIOStream): Tgboolean; cdecl;
    seek: function(stream: PGFileIOStream; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    can_truncate: function(stream: PGFileIOStream): Tgboolean; cdecl;
    truncate_fn: function(stream: PGFileIOStream; size: Tgoffset; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    query_info: function(stream: PGFileIOStream; attributes: pchar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl;
    query_info_async: procedure(stream: PGFileIOStream; attributes: pchar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
      user_data: Tgpointer); cdecl;
    query_info_finish: function(stream: PGFileIOStream; result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl;
    get_etag: function(stream: PGFileIOStream): pchar; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_file_io_stream_get_type: TGType; cdecl; external libgio2;
function g_file_io_stream_query_info(stream: PGFileIOStream; attributes: pchar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl; external libgio2;
procedure g_file_io_stream_query_info_async(stream: PGFileIOStream; attributes: pchar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_file_io_stream_query_info_finish(stream: PGFileIOStream; result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl; external libgio2;
function g_file_io_stream_get_etag(stream: PGFileIOStream): pchar; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:21:39 ===

function G_TYPE_FILE_IO_STREAM: TGType;
function G_FILE_IO_STREAM(obj: Pointer): PGFileIOStream;
function G_FILE_IO_STREAM_CLASS(klass: Pointer): PGFileIOStreamClass;
function G_IS_FILE_IO_STREAM(obj: Pointer): Tgboolean;
function G_IS_FILE_IO_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_FILE_IO_STREAM_GET_CLASS(obj: Pointer): PGFileIOStreamClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_FILE_IO_STREAM: TGType;
begin
  G_TYPE_FILE_IO_STREAM := g_file_io_stream_get_type;
end;

function G_FILE_IO_STREAM(obj: Pointer): PGFileIOStream;
begin
  Result := PGFileIOStream(g_type_check_instance_cast(obj, G_TYPE_FILE_IO_STREAM));
end;

function G_FILE_IO_STREAM_CLASS(klass: Pointer): PGFileIOStreamClass;
begin
  Result := PGFileIOStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_IO_STREAM));
end;

function G_IS_FILE_IO_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_IO_STREAM);
end;

function G_IS_FILE_IO_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_IO_STREAM);
end;

function G_FILE_IO_STREAM_GET_CLASS(obj: Pointer): PGFileIOStreamClass;
begin
  Result := PGFileIOStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
