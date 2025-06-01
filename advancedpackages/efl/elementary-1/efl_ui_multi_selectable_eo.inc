{$IFDEF read_interface}


type
  PEfl_Ui_Multi_Selectable = ^TEfl_Ui_Multi_Selectable;
  TEfl_Ui_Multi_Selectable = TEo;

function EFL_UI_MULTI_SELECTABLE_INTERFACE: PEfl_Class;

function efl_ui_multi_selectable_interface_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_multi_selectable_select_mode_set(obj: PEo; mode: TEfl_Ui_Select_Mode); cdecl; external libelementary;
function efl_ui_multi_selectable_select_mode_get(obj: PEo): TEfl_Ui_Select_Mode; cdecl; external libelementary;
procedure efl_ui_multi_selectable_all_select(obj: PEo); cdecl; external libelementary;
procedure efl_ui_multi_selectable_all_unselect(obj: PEo); cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:50:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_MULTI_SELECTABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_MULTI_SELECTABLE_INTERFACE := efl_ui_multi_selectable_interface_get;
end;


{$ENDIF read_implementation}
