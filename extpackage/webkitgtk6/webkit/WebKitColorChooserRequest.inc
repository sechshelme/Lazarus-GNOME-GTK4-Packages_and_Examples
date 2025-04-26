{$IFDEF read_interface}


  {WEBKIT_DECLARE_FINAL_TYPE (WebKitColorChooserRequest, webkit_color_chooser_request, WEBKIT, COLOR_CHOOSER_REQUEST, GObject) }
type
  TWebKitColorChooserRequest = record
  end;
  PWebKitColorChooserRequest = ^TWebKitColorChooserRequest;

  TWebKitColorChooserRequestClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitColorChooserRequestClass = ^TWebKitColorChooserRequestClass;

function webkit_color_chooser_request_get_type: TGType; cdecl; external libwebkit;
procedure webkit_color_chooser_request_get_rgba(request: PWebKitColorChooserRequest; rgba: PGdkRGBA); cdecl; external libwebkit;
procedure webkit_color_chooser_request_set_rgba(request: PWebKitColorChooserRequest; rgba: PGdkRGBA); cdecl; external libwebkit;
procedure webkit_color_chooser_request_get_element_rectangle(request: PWebKitColorChooserRequest; rect: PGdkRectangle); cdecl; external libwebkit;
procedure webkit_color_chooser_request_finish(request: PWebKitColorChooserRequest); cdecl; external libwebkit;
procedure webkit_color_chooser_request_cancel(request: PWebKitColorChooserRequest); cdecl; external libwebkit;

// === Konventiert am: 3-1-25 15:59:49 ===

function WEBKIT_TYPE_COLOR_CHOOSER_REQUEST: TGType;
function WEBKIT_COLOR_CHOOSER_REQUEST(obj: Pointer): PWebKitColorChooserRequest;
function WEBKIT_IS_COLOR_CHOOSER_REQUEST(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_COLOR_CHOOSER_REQUEST: TGType;
begin
  Result := webkit_color_chooser_request_get_type;
end;

function WEBKIT_COLOR_CHOOSER_REQUEST(obj: Pointer): PWebKitColorChooserRequest;
begin
  Result := PWebKitColorChooserRequest(g_type_check_instance_cast(obj, WEBKIT_TYPE_COLOR_CHOOSER_REQUEST));
end;

function WEBKIT_IS_COLOR_CHOOSER_REQUEST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_COLOR_CHOOSER_REQUEST);
end;


{$ENDIF read_implementation}
