{$IFDEF read_interface}


type
  PGMimeHeader = ^TGMimeHeader;

  TGMimeHeaderRawValueFormatter = function(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl;

  TGMimeHeader = record
    parent_object: TGObject;
    name: pchar;
    value: pchar;
    formatter: TGMimeHeaderRawValueFormatter;
    options: PGMimeParserOptions;
    reformat: Tgboolean;
    changed: Tgpointer;
    raw_value: pchar;
    raw_name: pchar;
    charset: pchar;
    offset: Tgint64;
  end;

  TGMimeHeaderClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeHeaderClass = ^TGMimeHeaderClass;

function g_mime_header_format_content_disposition(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_content_type(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_message_id(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_references(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_addrlist(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_received(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_format_default(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar): pchar; cdecl; external libgmime3;
function g_mime_header_get_type: TGType; cdecl; external libgmime3;
function g_mime_header_get_name(header: PGMimeHeader): pchar; cdecl; external libgmime3;
function g_mime_header_get_raw_name(header: PGMimeHeader): pchar; cdecl; external libgmime3;
function g_mime_header_get_value(header: PGMimeHeader): pchar; cdecl; external libgmime3;
procedure g_mime_header_set_value(header: PGMimeHeader; options: PGMimeFormatOptions; value: pchar; charset: pchar); cdecl; external libgmime3;
function g_mime_header_get_raw_value(header: PGMimeHeader): pchar; cdecl; external libgmime3;
procedure g_mime_header_set_raw_value(header: PGMimeHeader; raw_value: pchar); cdecl; external libgmime3;
function g_mime_header_get_offset(header: PGMimeHeader): Tgint64; cdecl; external libgmime3;
function g_mime_header_write_to_stream(header: PGMimeHeader; options: PGMimeFormatOptions; stream: PGMimeStream): Tssize_t; cdecl; external libgmime3;

type
  TGMimeHeaderList = record
    parent_object: TGObject;
    options: PGMimeParserOptions;
    changed: Tgpointer;
    hash: PGHashTable;
    arr: PGPtrArray;
  end;
  PGMimeHeaderList = ^TGMimeHeaderList;

  TGMimeHeaderListClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeHeaderListClass = ^TGMimeHeaderListClass;

function g_mime_header_list_get_type: TGType; cdecl; external libgmime3;
function g_mime_header_list_new(options: PGMimeParserOptions): PGMimeHeaderList; cdecl; external libgmime3;
procedure g_mime_header_list_clear(headers: PGMimeHeaderList); cdecl; external libgmime3;
function g_mime_header_list_get_count(headers: PGMimeHeaderList): longint; cdecl; external libgmime3;
function g_mime_header_list_contains(headers: PGMimeHeaderList; name: pchar): Tgboolean; cdecl; external libgmime3;
procedure g_mime_header_list_prepend(headers: PGMimeHeaderList; name: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
procedure g_mime_header_list_append(headers: PGMimeHeaderList; name: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
procedure g_mime_header_list_set(headers: PGMimeHeaderList; name: pchar; value: pchar; charset: pchar); cdecl; external libgmime3;
function g_mime_header_list_get_header(headers: PGMimeHeaderList; name: pchar): PGMimeHeader; cdecl; external libgmime3;
function g_mime_header_list_get_header_at(headers: PGMimeHeaderList; index: longint): PGMimeHeader; cdecl; external libgmime3;
function g_mime_header_list_remove(headers: PGMimeHeaderList; name: pchar): Tgboolean; cdecl; external libgmime3;
procedure g_mime_header_list_remove_at(headers: PGMimeHeaderList; index: longint); cdecl; external libgmime3;
function g_mime_header_list_write_to_stream(headers: PGMimeHeaderList; options: PGMimeFormatOptions; stream: PGMimeStream): Tssize_t; cdecl; external libgmime3;
function g_mime_header_list_to_string(headers: PGMimeHeaderList; options: PGMimeFormatOptions): pchar; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:56 ===

function GMIME_TYPE_HEADER: TGType;
function GMIME_HEADER(obj: Pointer): PGMimeHeader;
function GMIME_HEADER_CLASS(klass: Pointer): PGMimeHeaderClass;
function GMIME_IS_HEADER(obj: Pointer): Tgboolean;
function GMIME_IS_HEADER_CLASS(klass: Pointer): Tgboolean;
function GMIME_HEADER_GET_CLASS(obj: Pointer): PGMimeHeaderClass;

function GMIME_TYPE_HEADER_LIST: TGType;
function GMIME_HEADER_LIST(obj: Pointer): PGMimeHeaderList;
function GMIME_HEADER_LIST_CLASS(klass: Pointer): PGMimeHeaderListClass;
function GMIME_IS_HEADER_LIST(obj: Pointer): Tgboolean;
function GMIME_IS_HEADER_LIST_CLASS(klass: Pointer): Tgboolean;
function GMIME_HEADER_LIST_GET_CLASS(obj: Pointer): PGMimeHeaderListClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_HEADER: TGType;
begin
  GMIME_TYPE_HEADER := g_mime_header_get_type;
end;

function GMIME_HEADER(obj: Pointer): PGMimeHeader;
begin
  Result := PGMimeHeader(g_type_check_instance_cast(obj, GMIME_TYPE_HEADER));
end;

function GMIME_HEADER_CLASS(klass: Pointer): PGMimeHeaderClass;
begin
  Result := PGMimeHeaderClass(g_type_check_class_cast(klass, GMIME_TYPE_HEADER));
end;

function GMIME_IS_HEADER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_HEADER);
end;

function GMIME_IS_HEADER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_HEADER);
end;

function GMIME_HEADER_GET_CLASS(obj: Pointer): PGMimeHeaderClass;
begin
  Result := PGMimeHeaderClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_HEADER_LIST: TGType;
begin
  GMIME_TYPE_HEADER_LIST := g_mime_header_list_get_type;
end;

function GMIME_HEADER_LIST(obj: Pointer): PGMimeHeaderList;
begin
  Result := PGMimeHeaderList(g_type_check_instance_cast(obj, GMIME_TYPE_HEADER_LIST));
end;

function GMIME_HEADER_LIST_CLASS(klass: Pointer): PGMimeHeaderListClass;
begin
  Result := PGMimeHeaderListClass(g_type_check_class_cast(klass, GMIME_TYPE_HEADER_LIST));
end;

function GMIME_IS_HEADER_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_HEADER_LIST);
end;

function GMIME_IS_HEADER_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_HEADER_LIST);
end;

function GMIME_HEADER_LIST_GET_CLASS(obj: Pointer): PGMimeHeaderListClass;
begin
  Result := PGMimeHeaderListClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
