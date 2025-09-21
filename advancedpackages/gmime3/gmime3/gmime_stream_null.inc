{$IFDEF read_interface}


type
  TGMimeStreamNull = record
    parent_object: TGMimeStream;
    written: Tsize_t;
    newlines: Tsize_t;
    count_newlines: Tgboolean;
  end;
  PGMimeStreamNull = ^TGMimeStreamNull;

  TGMimeStreamNullClass = record
    parent_class: TGMimeStreamClass;
  end;
  PGMimeStreamNullClass = ^TGMimeStreamNullClass;

function g_mime_stream_null_get_type: TGType; cdecl; external libgmime3;
function g_mime_stream_null_new: PGMimeStream; cdecl; external libgmime3;
procedure g_mime_stream_null_set_count_newlines(stream: PGMimeStreamNull; count: Tgboolean); cdecl; external libgmime3;
function g_mime_stream_null_get_count_newlines(stream: PGMimeStreamNull): Tgboolean; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:34:18 ===

function GMIME_TYPE_STREAM_NULL: TGType;
function GMIME_STREAM_NULL(obj: Pointer): PGMimeStreamNull;
function GMIME_STREAM_NULL_CLASS(klass: Pointer): PGMimeStreamNullClass;
function GMIME_IS_STREAM_NULL(obj: Pointer): Tgboolean;
function GMIME_IS_STREAM_NULL_CLASS(klass: Pointer): Tgboolean;
function GMIME_STREAM_NULL_GET_CLASS(obj: Pointer): PGMimeStreamNullClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_STREAM_NULL: TGType;
begin
  GMIME_TYPE_STREAM_NULL := g_mime_stream_null_get_type;
end;

function GMIME_STREAM_NULL(obj: Pointer): PGMimeStreamNull;
begin
  Result := PGMimeStreamNull(g_type_check_instance_cast(obj, GMIME_TYPE_STREAM_NULL));
end;

function GMIME_STREAM_NULL_CLASS(klass: Pointer): PGMimeStreamNullClass;
begin
  Result := PGMimeStreamNullClass(g_type_check_class_cast(klass, GMIME_TYPE_STREAM_NULL));
end;

function GMIME_IS_STREAM_NULL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_STREAM_NULL);
end;

function GMIME_IS_STREAM_NULL_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_STREAM_NULL);
end;

function GMIME_STREAM_NULL_GET_CLASS(obj: Pointer): PGMimeStreamNullClass;
begin
  Result := PGMimeStreamNullClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
