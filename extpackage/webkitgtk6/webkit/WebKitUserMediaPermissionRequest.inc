{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitUserMediaPermissionRequest, webkit_user_media_permission_request, WEBKIT, USER_MEDIA_PERMISSION_REQUEST, GObject) }
type
  TWebKitUserMediaPermissionRequest = record
  end;
  PWebKitUserMediaPermissionRequest = ^TWebKitUserMediaPermissionRequest;

  TWebKitUserMediaPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitUserMediaPermissionRequestClass = ^TWebKitUserMediaPermissionRequestClass;

function webkit_user_media_permission_request_get_type: TGType; cdecl; external libwebkit;
function webkit_user_media_permission_is_for_audio_device(request: PWebKitUserMediaPermissionRequest): Tgboolean; cdecl; external libwebkit;
function webkit_user_media_permission_is_for_video_device(request: PWebKitUserMediaPermissionRequest): Tgboolean; cdecl; external libwebkit;
function webkit_user_media_permission_is_for_display_device(request: PWebKitUserMediaPermissionRequest): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:39:43 ===

function WEBKIT_TYPE_USER_MEDIA_PERMISSION_REQUEST: TGType;
function WEBKIT_USER_MEDIA_PERMISSION_REQUEST(obj: Pointer): PWebKitUserMediaPermissionRequest;
function WEBKIT_IS_USER_MEDIA_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_USER_MEDIA_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_user_media_permission_request_get_type;
end;

function WEBKIT_USER_MEDIA_PERMISSION_REQUEST(obj: Pointer): PWebKitUserMediaPermissionRequest;
begin
  Result := PWebKitUserMediaPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_USER_MEDIA_PERMISSION_REQUEST));
end;

function WEBKIT_IS_USER_MEDIA_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_USER_MEDIA_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
