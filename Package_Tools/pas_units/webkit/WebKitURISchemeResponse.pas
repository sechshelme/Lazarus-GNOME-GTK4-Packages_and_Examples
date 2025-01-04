unit WebKitURISchemeResponse;

interface

uses
  fp_glib2, fp_GTK4, WebKit;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitURISchemeResponse, webkit_uri_scheme_response, WEBKIT, URI_SCHEME_RESPONSE, GObject) }
type
  TWebKitURISchemeResponse = record
  end;
  PWebKitURISchemeResponse = ^TWebKitURISchemeResponse;

  TWebKitURISchemeResponseClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitURISchemeResponseClass = ^TWebKitURISchemeResponseClass;

function webkit_uri_scheme_response_get_type: TGType; cdecl; external libwebkit;
function webkit_uri_scheme_response_new(input_stream: PGInputStream; stream_length: Tgint64): PWebKitURISchemeResponse; cdecl; external libwebkit;
procedure webkit_uri_scheme_response_set_status(response: PWebKitURISchemeResponse; status_code: Tguint; reason_phrase: Pgchar); cdecl; external libwebkit;
procedure webkit_uri_scheme_response_set_content_type(response: PWebKitURISchemeResponse; content_type: Pgchar); cdecl; external libwebkit;
procedure webkit_uri_scheme_response_set_http_headers(response: PWebKitURISchemeResponse; headers: PSoupMessageHeaders); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:31:39 ===

function WEBKIT_TYPE_URI_SCHEME_RESPONSE: TGType;
function WEBKIT_URI_SCHEME_RESPONSE(obj: Pointer): PWebKitURISchemeResponse;
function WEBKIT_IS_URI_SCHEME_RESPONSE(obj: Pointer): Tgboolean;

implementation

function WEBKIT_TYPE_URI_SCHEME_RESPONSE: TGType;
begin
  Result := webkit_uri_scheme_response_get_type;
end;

function WEBKIT_URI_SCHEME_RESPONSE(obj: Pointer): PWebKitURISchemeResponse;
begin
  Result := PWebKitURISchemeResponse(g_type_check_instance_cast(obj, WEBKIT_TYPE_URI_SCHEME_RESPONSE));
end;

function WEBKIT_IS_URI_SCHEME_RESPONSE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_URI_SCHEME_RESPONSE);
end;



end.
