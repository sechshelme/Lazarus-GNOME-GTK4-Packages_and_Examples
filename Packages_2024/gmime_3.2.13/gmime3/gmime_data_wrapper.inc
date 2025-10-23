{$IFDEF read_interface}


type
  TGMimeDataWrapper = record
    parent_object: TGObject;
    encoding: TGMimeContentEncoding;
    stream: PGMimeStream;
  end;
  PGMimeDataWrapper = ^TGMimeDataWrapper;

  TGMimeDataWrapperClass = record
    parent_class: TGObjectClass;
    write_to_stream: function(wrapper: PGMimeDataWrapper; stream: PGMimeStream): Tssize_t; cdecl;
  end;
  PGMimeDataWrapperClass = ^TGMimeDataWrapperClass;

function g_mime_data_wrapper_get_type: TGType; cdecl; external libgmime3;
function g_mime_data_wrapper_new: PGMimeDataWrapper; cdecl; external libgmime3;
function g_mime_data_wrapper_new_with_stream(stream: PGMimeStream; encoding: TGMimeContentEncoding): PGMimeDataWrapper; cdecl; external libgmime3;
procedure g_mime_data_wrapper_set_stream(wrapper: PGMimeDataWrapper; stream: PGMimeStream); cdecl; external libgmime3;
function g_mime_data_wrapper_get_stream(wrapper: PGMimeDataWrapper): PGMimeStream; cdecl; external libgmime3;
procedure g_mime_data_wrapper_set_encoding(wrapper: PGMimeDataWrapper; encoding: TGMimeContentEncoding); cdecl; external libgmime3;
function g_mime_data_wrapper_get_encoding(wrapper: PGMimeDataWrapper): TGMimeContentEncoding; cdecl; external libgmime3;
function g_mime_data_wrapper_write_to_stream(wrapper: PGMimeDataWrapper; stream: PGMimeStream): Tssize_t; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:26:33 ===

function GMIME_TYPE_DATA_WRAPPER: TGType;
function GMIME_DATA_WRAPPER(obj: Pointer): PGMimeDataWrapper;
function GMIME_DATA_WRAPPER_CLASS(klass: Pointer): PGMimeDataWrapperClass;
function GMIME_IS_DATA_WRAPPER(obj: Pointer): Tgboolean;
function GMIME_IS_DATA_WRAPPER_CLASS(klass: Pointer): Tgboolean;
function GMIME_DATA_WRAPPER_GET_CLASS(obj: Pointer): PGMimeDataWrapperClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_DATA_WRAPPER: TGType;
begin
  GMIME_TYPE_DATA_WRAPPER := g_mime_data_wrapper_get_type;
end;

function GMIME_DATA_WRAPPER(obj: Pointer): PGMimeDataWrapper;
begin
  Result := PGMimeDataWrapper(g_type_check_instance_cast(obj, GMIME_TYPE_DATA_WRAPPER));
end;

function GMIME_DATA_WRAPPER_CLASS(klass: Pointer): PGMimeDataWrapperClass;
begin
  Result := PGMimeDataWrapperClass(g_type_check_class_cast(klass, GMIME_TYPE_DATA_WRAPPER));
end;

function GMIME_IS_DATA_WRAPPER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_DATA_WRAPPER);
end;

function GMIME_IS_DATA_WRAPPER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_DATA_WRAPPER);
end;

function GMIME_DATA_WRAPPER_GET_CLASS(obj: Pointer): PGMimeDataWrapperClass;
begin
  Result := PGMimeDataWrapperClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
