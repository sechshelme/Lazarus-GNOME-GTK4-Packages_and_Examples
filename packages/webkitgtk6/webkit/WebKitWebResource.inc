{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWebResource, webkit_web_resource, WEBKIT, WEB_RESOURCE, GObject) }
type
  TWebKitWebResource = record
  end;
  PWebKitWebResource = ^TWebKitWebResource;

  TWebKitWebResourceClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebResourceClass = ^TWebKitWebResourceClass;

function webkit_web_resource_get_type: TGType; cdecl; external libwebkit;
function webkit_web_resource_get_uri(resource: PWebKitWebResource): Pgchar; cdecl; external libwebkit;
function webkit_web_resource_get_response(resource: PWebKitWebResource): PWebKitURIResponse; cdecl; external libwebkit;
procedure webkit_web_resource_get_data(resource: PWebKitWebResource; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libwebkit;
function webkit_web_resource_get_data_finish(resource: PWebKitWebResource; Result: PGAsyncResult; length: Pgsize; error: PPGError): Pguchar; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:36:25 ===

function WEBKIT_TYPE_WEB_RESOURCE: TGType;
function WEBKIT_WEB_RESOURCE(obj: Pointer): PWebKitWebResource;
function WEBKIT_IS_WEB_RESOURCE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEB_RESOURCE: TGType;
begin
  Result := webkit_web_resource_get_type;
end;

function WEBKIT_WEB_RESOURCE(obj: Pointer): PWebKitWebResource;
begin
  Result := PWebKitWebResource(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_RESOURCE));
end;

function WEBKIT_IS_WEB_RESOURCE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_RESOURCE);
end;




{$ENDIF read_implementation}
