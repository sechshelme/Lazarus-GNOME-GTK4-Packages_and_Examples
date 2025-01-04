{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitAuthenticationRequest, webkit_authentication_request, WEBKIT, AUTHENTICATION_REQUEST, GObject) }
type
  PWebKitAuthenticationScheme = ^TWebKitAuthenticationScheme;
  TWebKitAuthenticationScheme = longint;

const
  WEBKIT_AUTHENTICATION_SCHEME_DEFAULT = 1;
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_BASIC = 2;
  WEBKIT_AUTHENTICATION_SCHEME_HTTP_DIGEST = 3;
  WEBKIT_AUTHENTICATION_SCHEME_HTML_FORM = 4;
  WEBKIT_AUTHENTICATION_SCHEME_NTLM = 5;
  WEBKIT_AUTHENTICATION_SCHEME_NEGOTIATE = 6;
  WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_REQUESTED = 7;
  WEBKIT_AUTHENTICATION_SCHEME_SERVER_TRUST_EVALUATION_REQUESTED = 8;
  WEBKIT_AUTHENTICATION_SCHEME_CLIENT_CERTIFICATE_PIN_REQUESTED = 9;
  WEBKIT_AUTHENTICATION_SCHEME_UNKNOWN = 100;

type
  TWebKitAuthenticationRequest = record
  end;
  PWebKitAuthenticationRequest = ^TWebKitAuthenticationRequest;

  TWebKitAuthenticationRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitAuthenticationRequestClass = ^TWebKitAuthenticationRequestClass;

function webkit_authentication_request_get_type: TGType; cdecl; external libwebkit;
function webkit_authentication_request_can_save_credentials(request: PWebKitAuthenticationRequest): Tgboolean; cdecl; external libwebkit;
procedure webkit_authentication_request_set_can_save_credentials(request: PWebKitAuthenticationRequest; Enabled: Tgboolean); cdecl; external libwebkit;
function webkit_authentication_request_get_proposed_credential(request: PWebKitAuthenticationRequest): PWebKitCredential; cdecl; external libwebkit;
procedure webkit_authentication_request_set_proposed_credential(request: PWebKitAuthenticationRequest; credential: PWebKitCredential); cdecl; external libwebkit;
function webkit_authentication_request_get_host(request: PWebKitAuthenticationRequest): Pgchar; cdecl; external libwebkit;
function webkit_authentication_request_get_port(request: PWebKitAuthenticationRequest): Tguint; cdecl; external libwebkit;
function webkit_authentication_request_get_security_origin(request: PWebKitAuthenticationRequest): PWebKitSecurityOrigin; cdecl; external libwebkit;
function webkit_authentication_request_get_realm(request: PWebKitAuthenticationRequest): Pgchar; cdecl; external libwebkit;
function webkit_authentication_request_get_scheme(request: PWebKitAuthenticationRequest): TWebKitAuthenticationScheme; cdecl; external libwebkit;
function webkit_authentication_request_is_for_proxy(request: PWebKitAuthenticationRequest): Tgboolean; cdecl; external libwebkit;
function webkit_authentication_request_is_retry(request: PWebKitAuthenticationRequest): Tgboolean; cdecl; external libwebkit;
procedure webkit_authentication_request_authenticate(request: PWebKitAuthenticationRequest; credential: PWebKitCredential); cdecl; external libwebkit;
procedure webkit_authentication_request_cancel(request: PWebKitAuthenticationRequest); cdecl; external libwebkit;
function webkit_authentication_request_get_certificate_pin_flags(request: PWebKitAuthenticationRequest): TGTlsPasswordFlags; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:52:05 ===

function WEBKIT_TYPE_AUTHENTICATION_REQUEST: TGType;
function WEBKIT_AUTHENTICATION_REQUEST(obj: Pointer): PWebKitAuthenticationRequest;
function WEBKIT_IS_AUTHENTICATION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_AUTHENTICATION_REQUEST: TGType;
begin
  Result := webkit_authentication_request_get_type;
end;

function WEBKIT_AUTHENTICATION_REQUEST(obj: Pointer): PWebKitAuthenticationRequest;
begin
  Result := PWebKitAuthenticationRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_AUTHENTICATION_REQUEST));
end;

function WEBKIT_IS_AUTHENTICATION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_AUTHENTICATION_REQUEST);
end;


{$ENDIF read_implementation}
