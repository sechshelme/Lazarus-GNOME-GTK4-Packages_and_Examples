{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitURIResponse, webkit_uri_response, WEBKIT, URI_RESPONSE, GObject) }
type
  TWebKitURIResponse = record
  end;
  PWebKitURIResponse = ^TWebKitURIResponse;

  TWebKitURIResponseClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitURIResponseClass = ^TWebKitURIResponseClass;

function webkit_uri_response_get_type: TGType; cdecl; external libwebkit;
function webkit_uri_response_get_uri(response: PWebKitURIResponse): Pgchar; cdecl; external libwebkit;
function webkit_uri_response_get_status_code(response: PWebKitURIResponse): Tguint; cdecl; external libwebkit;
function webkit_uri_response_get_content_length(response: PWebKitURIResponse): Tguint64; cdecl; external libwebkit;
function webkit_uri_response_get_mime_type(response: PWebKitURIResponse): Pgchar; cdecl; external libwebkit;
function webkit_uri_response_get_suggested_filename(response: PWebKitURIResponse): Pgchar; cdecl; external libwebkit;
function webkit_uri_response_get_http_headers(response: PWebKitURIResponse): PSoupMessageHeaders; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:38:44 ===

function WEBKIT_TYPE_URI_RESPONSE: TGType;
function WEBKIT_URI_RESPONSE(obj: Pointer): PWebKitURIResponse;
function WEBKIT_IS_URI_RESPONSE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_URI_RESPONSE: TGType;
begin
  Result := webkit_uri_response_get_type;
end;

function WEBKIT_URI_RESPONSE(obj: Pointer): PWebKitURIResponse;
begin
  Result := PWebKitURIResponse(g_type_check_instance_cast(obj, WEBKIT_TYPE_URI_RESPONSE));
end;

function WEBKIT_IS_URI_RESPONSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_URI_RESPONSE);
end;




{$ENDIF read_implementation}
