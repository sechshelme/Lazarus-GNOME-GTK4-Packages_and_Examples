{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitPointerLockPermissionRequest, webkit_pointer_lock_permission_request, WEBKIT, POINTER_LOCK_PERMISSION_REQUEST, GObject) }
type
  TWebKitPointerLockPermissionRequest = record
  end;
  PWebKitPointerLockPermissionRequest = ^TWebKitPointerLockPermissionRequest;

  TWebKitPointerLockPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitPointerLockPermissionRequestClass = ^TWebKitPointerLockPermissionRequestClass;

function webkit_pointer_lock_permission_request_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:57:08 ===

function WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST: TGType;
function WEBKIT_POINTER_LOCK_PERMISSION_REQUEST(obj: Pointer): PWebKitPointerLockPermissionRequest;
function WEBKIT_IS_POINTER_LOCK_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_pointer_lock_permission_request_get_type;
end;

function WEBKIT_POINTER_LOCK_PERMISSION_REQUEST(obj: Pointer): PWebKitPointerLockPermissionRequest;
begin
  Result := PWebKitPointerLockPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST));
end;

function WEBKIT_IS_POINTER_LOCK_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_POINTER_LOCK_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
