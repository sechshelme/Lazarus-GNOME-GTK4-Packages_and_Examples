/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 20-09-2024   15:33                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}


function gst_uri_error_quark: TGQuark; cdecl; external libgstreamer;

type
  PGstURIError = ^TGstURIError;
  TGstURIError = longint;

const
  GST_URI_ERROR_UNSUPPORTED_PROTOCOL = 0;
  GST_URI_ERROR_BAD_URI = 1;
  GST_URI_ERROR_BAD_STATE = 2;
  GST_URI_ERROR_BAD_REFERENCE = 3;

type
  PGstURIType = ^TGstURIType;
  TGstURIType = longint;

const
  GST_URI_UNKNOWN = 0;
  GST_URI_SINK = 1;
  GST_URI_SRC = 2;

type
  TGstURIHandler = record
  end;
  PGstURIHandler = ^TGstURIHandler;

  PGstURIHandlerInterface = ^TGstURIHandlerInterface;

  TGstURIHandlerInterface = record
    parent: TGTypeInterface;
    get_type: function(_type: TGType): TGstURIType; cdecl;
    get_protocols: function(_type: TGType): PPgchar; cdecl;
    get_uri: function(handler: PGstURIHandler): Pgchar; cdecl;
    set_uri: function(handler: PGstURIHandler; uri: Pgchar; error: PPGError): Tgboolean; cdecl;
  end;

function gst_uri_protocol_is_valid(protocol: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_protocol_is_supported(_type: TGstURIType; protocol: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_is_valid(uri: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_protocol(uri: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_uri_has_protocol(uri: Pgchar; protocol: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_location(uri: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_uri_construct(protocol: Pgchar; location: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_filename_to_uri(filename: Pgchar; error: PPGError): Pgchar; cdecl; external libgstreamer;
function gst_element_make_from_uri(_type: TGstURIType; uri: Pgchar; elementname: Pgchar; error: PPGError): PGstElement; cdecl; external libgstreamer;
function gst_uri_handler_get_type: TGType; cdecl; external libgstreamer;
function gst_uri_handler_get_uri_type(handler: PGstURIHandler): TGstURIType; cdecl; external libgstreamer;
function gst_uri_handler_get_protocols(handler: PGstURIHandler): PPgchar; cdecl; external libgstreamer;
function gst_uri_handler_get_uri(handler: PGstURIHandler): Pgchar; cdecl; external libgstreamer;
function gst_uri_handler_set_uri(handler: PGstURIHandler; uri: Pgchar; error: PPGError): Tgboolean; cdecl; external libgstreamer;

type
  TGstUri = record
  end;
  PGstUri = ^TGstUri;
  PPGstUri = ^PGstUri;

const
  GST_URI_NO_PORT = 0;

function gst_uri_get_type: TGType; cdecl; external libgstreamer;
function gst_uri_new(scheme: Pgchar; userinfo: Pgchar; host: Pgchar; port: Tguint; path: Pgchar;
  query: Pgchar; fragment: Pgchar): PGstUri; cdecl; external libgstreamer;
function gst_uri_new_with_base(base: PGstUri; scheme: Pgchar; userinfo: Pgchar; host: Pgchar; port: Tguint;
  path: Pgchar; query: Pgchar; fragment: Pgchar): PGstUri; cdecl; external libgstreamer;
function gst_uri_from_string(uri: Pgchar): PGstUri; cdecl; external libgstreamer;
function gst_uri_from_string_escaped(uri: Pgchar): PGstUri; cdecl; external libgstreamer;
function gst_uri_from_string_with_base(base: PGstUri; uri: Pgchar): PGstUri; cdecl; external libgstreamer;
function gst_uri_equal(First: PGstUri; second: PGstUri): Tgboolean; cdecl; external libgstreamer;
function gst_uri_join(base_uri: PGstUri; ref_uri: PGstUri): PGstUri; cdecl; external libgstreamer;
function gst_uri_join_strings(base_uri: Pgchar; ref_uri: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_uri_is_writable(uri: PGstUri): Tgboolean; cdecl; external libgstreamer;
function gst_uri_make_writable(uri: PGstUri): PGstUri; cdecl; external libgstreamer;
function gst_uri_to_string(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_to_string_with_keys(uri: PGstUri; keys: PGList): Pgchar; cdecl; external libgstreamer;
function gst_uri_is_normalized(uri: PGstUri): Tgboolean; cdecl; external libgstreamer;
function gst_uri_normalize(uri: PGstUri): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_scheme(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_scheme(uri: PGstUri; scheme: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_userinfo(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_userinfo(uri: PGstUri; userinfo: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_host(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_host(uri: PGstUri; host: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_port(uri: PGstUri): Tguint; cdecl; external libgstreamer;
function gst_uri_set_port(uri: PGstUri; port: Tguint): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_path(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_path(uri: PGstUri; path: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_path_string(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_path_string(uri: PGstUri; path: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_path_segments(uri: PGstUri): PGList; cdecl; external libgstreamer;
function gst_uri_set_path_segments(uri: PGstUri; path_segments: PGList): Tgboolean; cdecl; external libgstreamer;
function gst_uri_append_path(uri: PGstUri; relative_path: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_append_path_segment(uri: PGstUri; path_segment: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_query_string(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_get_query_string_ordered(uri: PGstUri; keys: PGList): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_query_string(uri: PGstUri; query: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_query_table(uri: PGstUri): PGHashTable; cdecl; external libgstreamer;
function gst_uri_set_query_table(uri: PGstUri; query_table: PGHashTable): Tgboolean; cdecl; external libgstreamer;
function gst_uri_set_query_value(uri: PGstUri; query_key: Pgchar; query_value: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_remove_query_key(uri: PGstUri; query_key: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_query_has_key(uri: PGstUri; query_key: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_query_value(uri: PGstUri; query_key: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_uri_get_query_keys(uri: PGstUri): PGList; cdecl; external libgstreamer;
function gst_uri_get_fragment(uri: PGstUri): Pgchar; cdecl; external libgstreamer;
function gst_uri_set_fragment(uri: PGstUri; fragment: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_uri_get_media_fragment_table(uri: PGstUri): PGHashTable; cdecl; external libgstreamer;
function gst_uri_copy(uri: PGstUri): PGstUri; cdecl; external libgstreamer;
function gst_uri_ref(uri: PGstUri): PGstUri; cdecl; external libgstreamer;
procedure gst_uri_unref(uri: PGstUri); cdecl; external libgstreamer;
procedure gst_clear_uri(uri_ptr: PPGstUri); cdecl; external libgstreamer;

function GST_TYPE_URI_HANDLER: TGType;
function GST_URI_HANDLER(obj: Pointer): PGstURIHandler;
function GST_IS_URI_HANDLER(obj: Pointer): Tgboolean;
function GST_URI_HANDLER_GET_INTERFACE(obj: Pointer): PGstURIHandlerInterface;

function GST_URI_TYPE_IS_VALID(typ: TGType): Tgboolean;

function GST_TYPE_URI: TGType;
function GST_IS_URI(obj: Pointer): Tgboolean;
function GST_URI_CAST(obj: Pointer): PGstUri;
function GST_URI_CONST_CAST(obj: Pointer): PGstUri;
function GST_URI(obj: Pointer): PGstUri;



// === Konventiert am: 15-9-24 16:38:50 ===

function GST_URI_ERROR: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_URI_ERROR: TGType;
begin
  GST_URI_ERROR := gst_uri_error_quark;
end;


function GST_TYPE_URI_HANDLER: TGType;
begin
  GST_TYPE_URI_HANDLER := gst_uri_handler_get_type;
end;

function GST_URI_HANDLER(obj: Pointer): PGstURIHandler;
begin
  Result := PGstURIHandler(g_type_check_instance_cast(obj, GST_TYPE_URI_HANDLER));
end;

function GST_IS_URI_HANDLER(obj: Pointer): Tgboolean;
begin
  GST_IS_URI_HANDLER := G_TYPE_CHECK_INSTANCE_TYPE(obj, GST_TYPE_URI_HANDLER);
end;

function GST_URI_HANDLER_GET_INTERFACE(obj: Pointer): PGstURIHandlerInterface;
begin
  Result := g_type_interface_peek(obj, GST_TYPE_URI_HANDLER);
end;

function GST_URI_TYPE_IS_VALID(typ: TGType): Tgboolean;
begin
  Result := (typ = GST_URI_SRC) or (typ = GST_URI_SINK);
end;

function GST_TYPE_URI: TGType;
begin
  GST_TYPE_URI := gst_uri_get_type;
end;

function GST_IS_URI(obj: Pointer): Tgboolean;
begin
  GST_IS_URI := GST_IS_MINI_OBJECT_TYPE(obj, GST_TYPE_URI);
end;

function GST_URI_CAST(obj: Pointer): PGstUri;
begin
  GST_URI_CAST := PGstUri(obj);
end;

function GST_URI_CONST_CAST(obj: Pointer): PGstUri;
begin
  GST_URI_CONST_CAST := PGstUri(obj);
end;

function GST_URI(obj: Pointer): PGstUri;
begin
  GST_URI := GST_URI_CAST(obj);
end;


{$ENDIF read_implementation}
