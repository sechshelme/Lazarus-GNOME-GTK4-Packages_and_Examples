{$IFDEF read_interface}


type
  PEfl_Ui_View_Model = ^TEfl_Ui_View_Model;
  TEfl_Ui_View_Model = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEflUiViewModelPropertyGet = ^TEflUiViewModelPropertyGet;
  TEflUiViewModelPropertyGet = function(data: pointer; view_model: PEfl_Ui_View_Model; _property: PEina_Stringshare): PEina_Value; cdecl;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEflUiViewModelPropertySet = ^TEflUiViewModelPropertySet;
  TEflUiViewModelPropertySet = function(data: pointer; view_model: PEfl_Ui_View_Model; _property: PEina_Stringshare; value: PEina_Value): PEina_Future; cdecl;
  {$endif}

function EFL_UI_VIEW_MODEL_CLASS: PEfl_Config;

function efl_ui_view_model_class_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_view_model_property_string_add(obj: PEo; name: pchar; definition: pchar; not_ready: pchar; on_error: pchar): TEina_Error; cdecl; external libelementary;
function efl_ui_view_model_property_string_del(obj: PEo; name: pchar): TEina_Error; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_view_model_property_logic_add(obj: PEo; _property: pchar; get_data: pointer; get: TEflUiViewModelPropertyGet; get_free_cb: TEina_Free_Cb;
  set_data: pointer; set_: TEflUiViewModelPropertySet; set_free_cb: TEina_Free_Cb; bound: PEina_Iterator): TEina_Error; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_view_model_property_logic_del(obj: PEo; _property: pchar): TEina_Error; cdecl; external libelementary;
{$endif}

procedure efl_ui_view_model_property_bind(obj: PEo; source: pchar; destination: pchar); cdecl; external libelementary;
procedure efl_ui_view_model_property_unbind(obj: PEo; source: pchar; destination: pchar); cdecl; external libelementary;
procedure efl_ui_view_model_children_bind_set(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
function efl_ui_view_model_children_bind_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:40:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_VIEW_MODEL_CLASS: PEfl_Config;
begin
  EFL_UI_VIEW_MODEL_CLASS := efl_ui_view_model_class_get;
end;


{$ENDIF read_implementation}
