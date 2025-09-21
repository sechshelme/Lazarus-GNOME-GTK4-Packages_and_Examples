{$IFDEF read_interface}


type
  TGMimeObject = record
    parent_object: TGObject;
    disposition: PGMimeContentDisposition;
    content_type: PGMimeContentType;
    headers: PGMimeHeaderList;
    content_id: pchar;
    ensure_newline: Tgboolean;
  end;
  PGMimeObject = ^TGMimeObject;
  PPGMimeObject = ^PGMimeObject;

  TGMimeObjectClass = record
    parent_class: TGObjectClass;
    header_added: procedure(obj: PGMimeObject; header: PGMimeHeader); cdecl;
    header_changed: procedure(obj: PGMimeObject; header: PGMimeHeader); cdecl;
    header_removed: procedure(obj: PGMimeObject; header: PGMimeHeader); cdecl;
    headers_cleared: procedure(obj: PGMimeObject); cdecl;
    set_content_type: procedure(obj: PGMimeObject; content_type: PGMimeContentType); cdecl;
    get_headers: function(obj: PGMimeObject; options: PGMimeFormatOptions): pchar; cdecl;
    write_to_stream: function(obj: PGMimeObject; options: PGMimeFormatOptions; content_only: Tgboolean; stream: PGMimeStream): Tssize_t; cdecl;
    encode: procedure(obj: PGMimeObject; constraint: TGMimeEncodingConstraint); cdecl;
  end;
  PGMimeObjectClass = ^TGMimeObjectClass;

  TGMimeObjectForeachFunc = procedure(parent: PGMimeObject; part: PGMimeObject; user_data: Tgpointer); cdecl;

function g_mime_object_get_type: TGType; cdecl; external libgmime3;
procedure g_mime_object_register_type(_type: pchar; subtype: pchar; object_type: TGType); cdecl; external libgmime3;
function g_mime_object_new(options: PGMimeParserOptions; content_type: PGMimeContentType): PGMimeObject; cdecl; external libgmime3;
function g_mime_object_new_type(options: PGMimeParserOptions; _type: pchar; subtype: pchar): PGMimeObject; cdecl; external libgmime3;
procedure g_mime_object_set_content_type(obj: PGMimeObject; content_type: PGMimeContentType); cdecl; external libgmime3;
function g_mime_object_get_content_type(obj: PGMimeObject): PGMimeContentType; cdecl; external libgmime3;
procedure g_mime_object_set_content_type_parameter(obj: PGMimeObject; name: pchar; value: pchar); cdecl; external libgmime3;
function g_mime_object_get_content_type_parameter(obj: PGMimeObject; name: pchar): pchar; cdecl; external libgmime3;
procedure g_mime_object_set_content_disposition(obj: PGMimeObject; disposition: PGMimeContentDisposition); cdecl; external libgmime3;
function g_mime_object_get_content_disposition(obj: PGMimeObject): PGMimeContentDisposition; cdecl; external libgmime3;
procedure g_mime_object_set_disposition(obj: PGMimeObject; disposition: pchar); cdecl; external libgmime3;
function g_mime_object_get_disposition(obj: PGMimeObject): pchar; cdecl; external libgmime3;
procedure g_mime_object_set_content_disposition_parameter(obj: PGMimeObject; name: pchar; value: pchar); cdecl; external libgmime3;
function g_mime_object_get_content_disposition_parameter(obj: PGMimeObject; name: pchar): pchar; cdecl; external libgmime3;
procedure g_mime_object_set_content_id(obj: PGMimeObject; content_id: pchar); cdecl; external libgmime3;
function g_mime_object_get_content_id(obj: PGMimeObject): pchar; cdecl; external libgmime3;
procedure g_mime_object_prepend_header(obj: PGMimeObject; header: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
procedure g_mime_object_append_header(obj: PGMimeObject; header: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
procedure g_mime_object_set_header(obj: PGMimeObject; header: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
function g_mime_object_get_header(obj: PGMimeObject; header: pchar): pchar; cdecl; external libgmime3;
function g_mime_object_remove_header(obj: PGMimeObject; header: pchar): Tgboolean; cdecl; external libgmime3;
function g_mime_object_get_header_list(obj: PGMimeObject): PGMimeHeaderList; cdecl; external libgmime3;
function g_mime_object_get_headers(obj: PGMimeObject; options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;
function g_mime_object_write_to_stream(obj: PGMimeObject; options: PGMimeFormatOptions; stream: PGMimeStream): Tssize_t; cdecl; external libgmime3;
function g_mime_object_write_content_to_stream(obj: PGMimeObject; options: PGMimeFormatOptions; stream: PGMimeStream): Tssize_t; cdecl; external libgmime3;
function g_mime_object_to_string(obj: PGMimeObject; options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;
procedure g_mime_object_encode(obj: PGMimeObject; constraint: TGMimeEncodingConstraint); cdecl; external libgmime3;
procedure g_mime_object_type_registry_init; cdecl; external libgmime3;
procedure g_mime_object_type_registry_shutdown; cdecl; external libgmime3;
function g_mime_object_get_autocrypt_headers(mime_part: PGMimeObject; effective_date: PGDateTime; matchheader: pchar; addresses: PInternetAddressList; keep_incomplete: Tgboolean): PGMimeAutocryptHeaderList; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:30:06 ===

function GMIME_TYPE_OBJECT: TGType;
function GMIME_OBJECT(obj: Pointer): PGMimeObject;
function GMIME_OBJECT_CLASS(klass: Pointer): PGMimeObjectClass;
function GMIME_IS_OBJECT(obj: Pointer): Tgboolean;
function GMIME_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
function GMIME_OBJECT_GET_CLASS(obj: Pointer): PGMimeObjectClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_OBJECT: TGType;
begin
  GMIME_TYPE_OBJECT := g_mime_object_get_type;
end;

function GMIME_OBJECT(obj: Pointer): PGMimeObject;
begin
  Result := PGMimeObject(g_type_check_instance_cast(obj, GMIME_TYPE_OBJECT));
end;

function GMIME_OBJECT_CLASS(klass: Pointer): PGMimeObjectClass;
begin
  Result := PGMimeObjectClass(g_type_check_class_cast(klass, GMIME_TYPE_OBJECT));
end;

function GMIME_IS_OBJECT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_OBJECT);
end;

function GMIME_IS_OBJECT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_OBJECT);
end;

function GMIME_OBJECT_GET_CLASS(obj: Pointer): PGMimeObjectClass;
begin
  Result := PGMimeObjectClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
