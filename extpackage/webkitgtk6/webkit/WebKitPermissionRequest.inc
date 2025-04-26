{$IFDEF read_interface}

  {G_DECLARE_INTERFACE (WebKitPermissionRequest, webkit_permission_request, WEBKIT, PERMISSION_REQUEST, GObject) }
type
  TWebKitPermissionRequest = record
  end;
  PWebKitPermissionRequest = ^TWebKitPermissionRequest;

  TWebKitPermissionRequestInterface = record
    parent_interface: TGTypeInterface;
    allow: procedure(request: PWebKitPermissionRequest); cdecl;
    deny: procedure(request: PWebKitPermissionRequest); cdecl;
  end;
  PWebKitPermissionRequestInterface = ^TWebKitPermissionRequestInterface;

function webkit_permission_request_get_type: TGType; cdecl; external libwebkit;
procedure webkit_permission_request_allow(request: PWebKitPermissionRequest); cdecl; external libwebkit;
procedure webkit_permission_request_deny(request: PWebKitPermissionRequest); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:22:52 ===

function WEBKIT_TYPE_PERMISSION_REQUEST: TGType;
function WEBKIT_PERMISSION_REQUEST(obj: Pointer): PWebKitPermissionRequest;
function WEBKIT_IS_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
function WEBKIT_PERMISSION_REQUEST_GET_IFACE(obj: Pointer): PWebKitPermissionRequestInterface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_permission_request_get_type;
end;

function WEBKIT_PERMISSION_REQUEST(obj: Pointer): PWebKitPermissionRequest;
begin
  Result := PWebKitPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_PERMISSION_REQUEST));
end;

function WEBKIT_IS_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_PERMISSION_REQUEST);
end;

function WEBKIT_PERMISSION_REQUEST_GET_IFACE(obj: Pointer): PWebKitPermissionRequestInterface;
begin
  Result := g_type_interface_peek(obj, WEBKIT_TYPE_PERMISSION_REQUEST);
end;



{$ENDIF read_implementation}
