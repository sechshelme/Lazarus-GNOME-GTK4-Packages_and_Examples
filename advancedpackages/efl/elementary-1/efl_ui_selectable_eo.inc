{$IFDEF read_interface}


type
  PEfl_Ui_Selectable = ^TEfl_Ui_Selectable;
  TEfl_Ui_Selectable = TEo;

function EFL_UI_SELECTABLE_INTERFACE: PEfl_Config;

function efl_ui_selectable_interface_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_selectable_selected_set(obj: PEo; selected: TEina_Bool); cdecl; external libelementary;
function efl_ui_selectable_selected_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_EVENT_SELECTED_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_EVENT_SELECTED_CHANGED: PEfl_Event_Description;


// === Konventiert am: 30-5-25 15:42:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_SELECTABLE_INTERFACE: PEfl_Config;
begin
  EFL_UI_SELECTABLE_INTERFACE := efl_ui_selectable_interface_get;
end;

function EFL_UI_EVENT_SELECTED_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_EVENT_SELECTED_CHANGED := @(_EFL_UI_EVENT_SELECTED_CHANGED);
end;


{$ENDIF read_implementation}
