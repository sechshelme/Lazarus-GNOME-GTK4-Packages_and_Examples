{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitGeolocationPermissionRequest, webkit_geolocation_permission_request, WEBKIT, GEOLOCATION_PERMISSION_REQUEST, GObject) }
type
  TWebKitGeolocationPermissionRequest = record
  end;
  PWebKitGeolocationPermissionRequest = ^TWebKitGeolocationPermissionRequest;

  TWebKitGeolocationPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitGeolocationPermissionRequestClass = ^TWebKitGeolocationPermissionRequestClass;

function webkit_geolocation_permission_request_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:57:05 ===

function WEBKIT_TYPE_GEOLOCATION_PERMISSION_REQUEST: TGType;
function WEBKIT_GEOLOCATION_PERMISSION_REQUEST(obj: Pointer): PWebKitGeolocationPermissionRequest;
function WEBKIT_IS_GEOLOCATION_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_GEOLOCATION_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_geolocation_permission_request_get_type;
end;

function WEBKIT_GEOLOCATION_PERMISSION_REQUEST(obj: Pointer): PWebKitGeolocationPermissionRequest;
begin
  Result := PWebKitGeolocationPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_GEOLOCATION_PERMISSION_REQUEST));
end;

function WEBKIT_IS_GEOLOCATION_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_GEOLOCATION_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
