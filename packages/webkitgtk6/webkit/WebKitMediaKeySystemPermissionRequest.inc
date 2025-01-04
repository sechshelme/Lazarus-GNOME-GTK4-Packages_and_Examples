{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitMediaKeySystemPermissionRequest, webkit_media_key_system_permission_request, WEBKIT, MEDIA_KEY_SYSTEM_PERMISSION_REQUEST, GObject) }
type
  TWebKitMediaKeySystemPermissionRequest = record
  end;
  PWebKitMediaKeySystemPermissionRequest = ^TWebKitMediaKeySystemPermissionRequest;

  TWebKitMediaKeySystemPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitMediaKeySystemPermissionRequestClass = ^TWebKitMediaKeySystemPermissionRequestClass;

function webkit_media_key_system_permission_request_get_type: TGType; cdecl; external libwebkit;
function webkit_media_key_system_permission_get_name(request: PWebKitMediaKeySystemPermissionRequest): Pgchar; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:44:34 ===

function WEBKIT_TYPE_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST: TGType;
function WEBKIT_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST(obj: Pointer): PWebKitMediaKeySystemPermissionRequest;
function WEBKIT_IS_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_media_key_system_permission_request_get_type;
end;

function WEBKIT_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST(obj: Pointer): PWebKitMediaKeySystemPermissionRequest;
begin
  Result := PWebKitMediaKeySystemPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST));
end;

function WEBKIT_IS_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_MEDIA_KEY_SYSTEM_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
