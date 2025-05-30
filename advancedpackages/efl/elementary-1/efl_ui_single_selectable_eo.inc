{$IFDEF read_interface}


type
  PEfl_Ui_Single_Selectable = ^TEfl_Ui_Single_Selectable;
  TEfl_Ui_Single_Selectable = TEo;

function EFL_UI_SINGLE_SELECTABLE_INTERFACE: PEfl_Config;

function efl_ui_single_selectable_interface_get: PEfl_Class; cdecl; external libelementary;
function efl_ui_selectable_last_selected_get(obj: PEo): PEfl_Ui_Selectable; cdecl; external libelementary;
procedure efl_ui_selectable_fallback_selection_set(obj: PEo; fallback: PEfl_Ui_Selectable); cdecl; external libelementary;
function efl_ui_selectable_fallback_selection_get(obj: PEo): PEfl_Ui_Selectable; cdecl; external libelementary;
procedure efl_ui_selectable_allow_manual_deselection_set(obj: PEo; allow_manual_deselection: TEina_Bool); cdecl; external libelementary;
function efl_ui_selectable_allow_manual_deselection_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED: PEfl_Event_Description;


// === Konventiert am: 30-5-25 15:25:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_SINGLE_SELECTABLE_INTERFACE: PEfl_Config;
begin
  EFL_UI_SINGLE_SELECTABLE_INTERFACE := efl_ui_single_selectable_interface_get;
end;

function EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED := @(_EFL_UI_SELECTABLE_EVENT_SELECTION_CHANGED);
end;


{$ENDIF read_implementation}
