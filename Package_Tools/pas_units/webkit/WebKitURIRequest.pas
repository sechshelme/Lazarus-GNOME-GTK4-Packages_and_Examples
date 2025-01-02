unit WebKitURIRequest;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitURIRequest, webkit_uri_request, WEBKIT, URI_REQUEST, GObject) }
type
  TWebKitURIRequest = record
  end;
  PWebKitURIRequest = ^TWebKitURIRequest;

  TWebKitURIRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitURIRequestClass = ^TWebKitURIRequestClass;

function webkit_uri_request_get_type: TGType; cdecl; external libwebkit;
function webkit_uri_request_new(uri: Pgchar): PWebKitURIRequest; cdecl; external libwebkit;
function webkit_uri_request_get_uri(request: PWebKitURIRequest): Pgchar; cdecl; external libwebkit;
procedure webkit_uri_request_set_uri(request: PWebKitURIRequest; uri: Pgchar); cdecl; external libwebkit;
function webkit_uri_request_get_http_method(request: PWebKitURIRequest): Pgchar; cdecl; external libwebkit;
function webkit_uri_request_get_http_headers(request: PWebKitURIRequest): PSoupMessageHeaders; cdecl; external libwebkit;

// === Konventiert am: 2-1-25 19:54:44 ===

function WEBKIT_TYPE_URI_REQUEST: TGType;
function WEBKIT_URI_REQUEST(obj: Pointer): PWebKitURIRequest;
function WEBKIT_IS_URI_REQUEST(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_URI_REQUEST: TGType;
begin
  Result := webkit_uri_request_get_type;
end;

function WEBKIT_URI_REQUEST(obj: Pointer): PWebKitURIRequest;
begin
  Result := PWebKitURIRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_URI_REQUEST));
end;

function WEBKIT_IS_URI_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_URI_REQUEST);
end;

end.
