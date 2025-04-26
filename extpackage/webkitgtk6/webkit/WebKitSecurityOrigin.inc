{$IFDEF read_interface}

type
  TWebKitSecurityOrigin = record
  end;
  PWebKitSecurityOrigin = ^TWebKitSecurityOrigin;

function webkit_security_origin_get_type: TGType; cdecl; external libwebkit;
function webkit_security_origin_new(protocol: Pgchar; host: Pgchar; port: Tguint16): PWebKitSecurityOrigin; cdecl; external libwebkit;
function webkit_security_origin_new_for_uri(uri: Pgchar): PWebKitSecurityOrigin; cdecl; external libwebkit;
function webkit_security_origin_ref(origin: PWebKitSecurityOrigin): PWebKitSecurityOrigin; cdecl; external libwebkit;
procedure webkit_security_origin_unref(origin: PWebKitSecurityOrigin); cdecl; external libwebkit;
function webkit_security_origin_get_protocol(origin: PWebKitSecurityOrigin): Pgchar; cdecl; external libwebkit;
function webkit_security_origin_get_host(origin: PWebKitSecurityOrigin): Pgchar; cdecl; external libwebkit;
function webkit_security_origin_get_port(origin: PWebKitSecurityOrigin): Tguint16; cdecl; external libwebkit;
function webkit_security_origin_to_string(origin: PWebKitSecurityOrigin): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:56:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_SECURITY_ORIGIN: TGType;
begin
  WEBKIT_TYPE_SECURITY_ORIGIN := webkit_security_origin_get_type;
end;



{$ENDIF read_implementation}
