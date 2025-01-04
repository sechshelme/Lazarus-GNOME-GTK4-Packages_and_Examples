{$IFDEF read_interface}

  {WEBKIT_DECLARE_FINAL_TYPE (WebKitNotificationPermissionRequest, webkit_notification_permission_request, WEBKIT, NOTIFICATION_PERMISSION_REQUEST, GObject) }
type
  TWebKitNotificationPermissionRequest = record
  end;
  PWebKitNotificationPermissionRequest = ^TWebKitNotificationPermissionRequest;

  TWebKitNotificationPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitNotificationPermissionRequestClass = ^TWebKitNotificationPermissionRequestClass;

function webkit_notification_permission_request_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:44:46 ===

function WEBKIT_TYPE_NOTIFICATION_PERMISSION_REQUEST: TGType;
function WEBKIT_NOTIFICATION_PERMISSION_REQUEST(obj: Pointer): PWebKitNotificationPermissionRequest;
function WEBKIT_IS_NOTIFICATION_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_NOTIFICATION_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_notification_permission_request_get_type;
end;

function WEBKIT_NOTIFICATION_PERMISSION_REQUEST(obj: Pointer): PWebKitNotificationPermissionRequest;
begin
  Result := PWebKitNotificationPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_NOTIFICATION_PERMISSION_REQUEST));
end;

function WEBKIT_IS_NOTIFICATION_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_NOTIFICATION_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
