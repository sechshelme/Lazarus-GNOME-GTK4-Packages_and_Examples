{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitDeviceInfoPermissionRequest, webkit_device_info_permission_request, WEBKIT, DEVICE_INFO_PERMISSION_REQUEST, GObject) }
type
  TWebKitDeviceInfoPermissionRequest = record
  end;
  PWebKitDeviceInfoPermissionRequest = ^TWebKitDeviceInfoPermissionRequest;

  TWebKitDeviceInfoPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitDeviceInfoPermissionRequestClass = ^TWebKitDeviceInfoPermissionRequestClass;

function webkit_device_info_permission_request_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 16:02:22 ===

function WEBKIT_TYPE_DEVICE_INFO_PERMISSION_REQUEST: TGType;
function WEBKIT_DEVICE_INFO_PERMISSION_REQUEST(obj: Pointer): PWebKitDeviceInfoPermissionRequest;
function WEBKIT_IS_DEVICE_INFO_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_DEVICE_INFO_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_device_info_permission_request_get_type;
end;

function WEBKIT_DEVICE_INFO_PERMISSION_REQUEST(obj: Pointer): PWebKitDeviceInfoPermissionRequest;
begin
  Result := PWebKitDeviceInfoPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_DEVICE_INFO_PERMISSION_REQUEST));
end;

function WEBKIT_IS_DEVICE_INFO_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_DEVICE_INFO_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
