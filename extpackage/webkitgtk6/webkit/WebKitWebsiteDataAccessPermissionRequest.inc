{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebsiteDataAccessPermissionRequest, webkit_website_data_access_permission_request, WEBKIT, WEBSITE_DATA_ACCESS_PERMISSION_REQUEST, GObject) }
type
  TWebKitWebsiteDataAccessPermissionRequest = record
  end;
  PWebKitWebsiteDataAccessPermissionRequest = ^TWebKitWebsiteDataAccessPermissionRequest;

  TWebKitWebsiteDataAccessPermissionRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebsiteDataAccessPermissionRequestClass = ^TWebKitWebsiteDataAccessPermissionRequestClass;

function webkit_website_data_access_permission_request_get_type: TGType; cdecl; external libwebkit;
function webkit_website_data_access_permission_request_get_requesting_domain(request: PWebKitWebsiteDataAccessPermissionRequest): pchar; cdecl; external libwebkit;
function webkit_website_data_access_permission_request_get_current_domain(request: PWebKitWebsiteDataAccessPermissionRequest): pchar; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 15:40:02 ===

function WEBKIT_TYPE_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST: TGType;
function WEBKIT_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST(obj: Pointer): PWebKitWebsiteDataAccessPermissionRequest;
function WEBKIT_IS_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST: TGType;
begin
  Result := webkit_website_data_access_permission_request_get_type;
end;

function WEBKIT_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST(obj: Pointer): PWebKitWebsiteDataAccessPermissionRequest;
begin
  Result := PWebKitWebsiteDataAccessPermissionRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST));
end;

function WEBKIT_IS_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEBSITE_DATA_ACCESS_PERMISSION_REQUEST);
end;


{$ENDIF read_implementation}
