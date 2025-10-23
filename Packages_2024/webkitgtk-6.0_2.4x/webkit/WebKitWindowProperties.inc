{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitWindowProperties, webkit_window_properties, WEBKIT, WINDOW_PROPERTIES, GObject) }
type
  TWebKitWindowProperties = record
  end;
  PWebKitWindowProperties = ^TWebKitWindowProperties;

  TWebKitWindowPropertiesClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWindowPropertiesClass = ^TWebKitWindowPropertiesClass;

function webkit_window_properties_get_type: TGType; cdecl; external libwebkit;
procedure webkit_window_properties_get_geometry(window_properties: PWebKitWindowProperties; geometry: PGdkRectangle); cdecl; external libwebkit;
function webkit_window_properties_get_toolbar_visible(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_statusbar_visible(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_scrollbars_visible(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_menubar_visible(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_locationbar_visible(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_resizable(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;
function webkit_window_properties_get_fullscreen(window_properties: PWebKitWindowProperties): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 3-1-25 19:49:30 ===

function WEBKIT_TYPE_WINDOW_PROPERTIES: TGType;
function WEBKIT_WINDOW_PROPERTIES(obj: Pointer): PWebKitWindowProperties;
function WEBKIT_IS_WINDOW_PROPERTIES(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WINDOW_PROPERTIES: TGType;
begin
  Result := webkit_window_properties_get_type;
end;

function WEBKIT_WINDOW_PROPERTIES(obj: Pointer): PWebKitWindowProperties;
begin
  Result := PWebKitWindowProperties(g_type_check_instance_cast(obj, WEBKIT_TYPE_WINDOW_PROPERTIES));
end;

function WEBKIT_IS_WINDOW_PROPERTIES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WINDOW_PROPERTIES);
end;


{$ENDIF read_implementation}
