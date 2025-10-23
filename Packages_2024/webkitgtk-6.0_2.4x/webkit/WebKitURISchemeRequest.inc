{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitURISchemeRequest, webkit_uri_scheme_request, WEBKIT, URI_SCHEME_REQUEST, GObject) }
type
  TWebKitURISchemeRequest = record
  end;
  PWebKitURISchemeRequest = ^TWebKitURISchemeRequest;

  TWebKitURISchemeRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitURISchemeRequestClass = ^TWebKitURISchemeRequestClass;

function webkit_uri_scheme_request_get_type: TGType; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_scheme(request: PWebKitURISchemeRequest): Pgchar; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_uri(request: PWebKitURISchemeRequest): Pgchar; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_path(request: PWebKitURISchemeRequest): Pgchar; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_web_view(request: PWebKitURISchemeRequest): PWebKitWebView; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_http_method(request: PWebKitURISchemeRequest): Pgchar; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_http_headers(request: PWebKitURISchemeRequest): PSoupMessageHeaders; cdecl; external libwebkit;
function webkit_uri_scheme_request_get_http_body(request: PWebKitURISchemeRequest): PGInputStream; cdecl; external libwebkit;
procedure webkit_uri_scheme_request_finish(request: PWebKitURISchemeRequest; stream: PGInputStream; stream_length: Tgint64; content_type: Pgchar); cdecl; external libwebkit;
procedure webkit_uri_scheme_request_finish_with_response(request: PWebKitURISchemeRequest; response: PWebKitURISchemeResponse); cdecl; external libwebkit;
procedure webkit_uri_scheme_request_finish_error(request: PWebKitURISchemeRequest; error: PGError); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:29:43 ===

function WEBKIT_TYPE_URI_SCHEME_REQUEST: TGType;
function WEBKIT_URI_SCHEME_REQUEST(obj: Pointer): PWebKitURISchemeRequest;
function WEBKIT_IS_URI_SCHEME_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_URI_SCHEME_REQUEST: TGType;
begin
  Result := webkit_uri_scheme_request_get_type;
end;

function WEBKIT_URI_SCHEME_REQUEST(obj: Pointer): PWebKitURISchemeRequest;
begin
  Result := PWebKitURISchemeRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_URI_SCHEME_REQUEST));
end;

function WEBKIT_IS_URI_SCHEME_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_URI_SCHEME_REQUEST);
end;


{$ENDIF read_implementation}
