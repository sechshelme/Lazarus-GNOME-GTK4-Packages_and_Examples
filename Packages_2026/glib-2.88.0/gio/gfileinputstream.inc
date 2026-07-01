

  {$IFDEF read_struct}
type
  PGFileInputStreamPrivate = type Pointer;

  PGFileInputStream = ^TGFileInputStream;
  TGFileInputStream = record
    parent_instance: TGInputStream;
    priv: PGFileInputStreamPrivate;
  end;

  PGFileInputStreamClass = ^TGFileInputStreamClass;
  TGFileInputStreamClass = record
    parent_class: TGInputStreamClass;
    tell: function(stream: PGFileInputStream): Tgoffset; cdecl;
    can_seek: function(stream: PGFileInputStream): Tgboolean; cdecl;
    seek: function(stream: PGFileInputStream; offset: Tgoffset; _type: TGSeekType; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl;
    query_info: function(stream: PGFileInputStream; attributes: pchar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl;
    query_info_async: procedure(stream: PGFileInputStream; attributes: pchar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl;
    query_info_finish: function(stream: PGFileInputStream; result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl;
    _g_reserved1: procedure; cdecl;
    _g_reserved2: procedure; cdecl;
    _g_reserved3: procedure; cdecl;
    _g_reserved4: procedure; cdecl;
    _g_reserved5: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function g_file_input_stream_get_type: TGType; cdecl; external libgio2;
function g_file_input_stream_query_info(stream: PGFileInputStream; attributes: pchar; cancellable: PGCancellable; error: PPGError): PGFileInfo; cdecl; external libgio2;
procedure g_file_input_stream_query_info_async(stream: PGFileInputStream; attributes: pchar; io_priority: longint; cancellable: PGCancellable; callback: TGAsyncReadyCallback;
  user_data: Tgpointer); cdecl; external libgio2;
function g_file_input_stream_query_info_finish(stream: PGFileInputStream; result: PGAsyncResult; error: PPGError): PGFileInfo; cdecl; external libgio2;

// === Konventiert am: 26-6-26 19:21:46 ===

function G_TYPE_FILE_INPUT_STREAM: TGType;
function G_FILE_INPUT_STREAM(obj: Pointer): PGFileInputStream;
function G_FILE_INPUT_STREAM_CLASS(klass: Pointer): PGFileInputStreamClass;
function G_IS_FILE_INPUT_STREAM(obj: Pointer): Tgboolean;
function G_IS_FILE_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
function G_FILE_INPUT_STREAM_GET_CLASS(obj: Pointer): PGFileInputStreamClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function G_TYPE_FILE_INPUT_STREAM: TGType;
begin
  G_TYPE_FILE_INPUT_STREAM := g_file_input_stream_get_type;
end;

function G_FILE_INPUT_STREAM(obj: Pointer): PGFileInputStream;
begin
  Result := PGFileInputStream(g_type_check_instance_cast(obj, G_TYPE_FILE_INPUT_STREAM));
end;

function G_FILE_INPUT_STREAM_CLASS(klass: Pointer): PGFileInputStreamClass;
begin
  Result := PGFileInputStreamClass(g_type_check_class_cast(klass, G_TYPE_FILE_INPUT_STREAM));
end;

function G_IS_FILE_INPUT_STREAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_INPUT_STREAM);
end;

function G_IS_FILE_INPUT_STREAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, G_TYPE_FILE_INPUT_STREAM);
end;

function G_FILE_INPUT_STREAM_GET_CLASS(obj: Pointer): PGFileInputStreamClass;
begin
  Result := PGFileInputStreamClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
