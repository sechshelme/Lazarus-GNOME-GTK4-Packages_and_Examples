{$IFDEF read_interface}


type
  PEfl_Ui_Popup_Part_Backwall = ^TEfl_Ui_Popup_Part_Backwall;
  TEfl_Ui_Popup_Part_Backwall = TEo;

function EFL_UI_POPUP_PART_BACKWALL_CLASS: PEfl_Class;

function efl_ui_popup_part_backwall_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_popup_part_backwall_repeat_events_set(obj: PEo; _repeat: TEina_Bool); cdecl; external libelementary;
function efl_ui_popup_part_backwall_repeat_events_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:09:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_POPUP_PART_BACKWALL_CLASS: PEfl_Class;
begin
  EFL_UI_POPUP_PART_BACKWALL_CLASS := efl_ui_popup_part_backwall_class_get;
end;


{$ENDIF read_implementation}
