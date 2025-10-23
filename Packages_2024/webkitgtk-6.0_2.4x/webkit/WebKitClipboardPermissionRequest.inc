{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitClipboardPermissionRequest, webkit_clipboard_permission_request, WEBKIT, CLIPBOARD_PERMISSION_REQUEST, GObject) }
type
  TWebKitClipboardPermissionRequest = record
  end;
  PWebKitClipboardPermissionRequest = ^TWebKitClipboardPermissionRequest;

  TWebKitClipboardPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitClipboardPermissionRequestClass = ^TWebKitClipboardPermissionRequestClass;

function webkit_clipboard_permission_request_get_type: TGType; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:57:00 ===

function WEBKIT_TYPE_CLIPBOARD_PERMISSION_REQUEST: TGType;
function WEBKIT_CLIPBOARD_PERMISSION_REQUEST(obj: Pointer): PWebKitClipboardPermissionRequest;
function WEBKIT_IS_CLIPBOARD_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_CLIPBOARD_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_clipboard_permission_request_get_type;
end;

function WEBKIT_CLIPBOARD_PERMISSION_REQUEST(obj: Pointer): PWebKitClipboardPermissionRequest;
begin
  Result := PWebKitClipboardPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_CLIPBOARD_PERMISSION_REQUEST));
end;

function WEBKIT_IS_CLIPBOARD_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_CLIPBOARD_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
