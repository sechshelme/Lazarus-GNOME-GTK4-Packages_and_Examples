{$IFDEF read_interface}

type
  TWebKitWebFormManager = record
    parent: TGObject;
  end;
  PWebKitWebFormManager = ^TWebKitWebFormManager;

  TWebKitWebFormManagerClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitWebFormManagerClass = ^TWebKitWebFormManagerClass;

function webkit_web_form_manager_get_type: TGType; cdecl; external libwebkit;
function webkit_web_form_manager_input_element_is_user_edited(element: PJSCValue): Tgboolean; cdecl; external libwebkit;
procedure webkit_web_form_manager_input_element_auto_fill(element: PJSCValue; Value: pchar); cdecl; external libwebkit;
function webkit_web_form_manager_input_element_is_auto_filled(element: PJSCValue): Tgboolean; cdecl; external libwebkit;

// === Konventiert am: 4-1-25 14:06:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function WEBKIT_TYPE_WEB_FORM_MANAGER: TGType;
begin
  WEBKIT_TYPE_WEB_FORM_MANAGER := webkit_web_form_manager_get_type;
end;

function WEBKIT_WEB_FORM_MANAGER(obj: Pointer): PWebKitWebFormManager;
begin
  Result := PWebKitWebFormManager(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_FORM_MANAGER));
end;

function WEBKIT_WEB_FORM_MANAGER_CLASS(klass: Pointer): PWebKitWebFormManagerClass;
begin
  Result := PWebKitWebFormManagerClass(g_type_check_class_cast(klass, WEBKIT_TYPE_WEB_FORM_MANAGER));
end;

function WEBKIT_IS_WEB_FORM_MANAGER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_FORM_MANAGER);
end;

function WEBKIT_IS_WEB_FORM_MANAGER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, WEBKIT_TYPE_WEB_FORM_MANAGER);
end;

function WEBKIT_WEB_FORM_MANAGER_GET_CLASS(obj: Pointer): PWebKitWebFormManagerClass;
begin
  Result := PWebKitWebFormManagerClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
