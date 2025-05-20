{$IFDEF read_interface}


type
  PEfl_Ui_Draggable = ^TEfl_Ui_Draggable;
  TEfl_Ui_Draggable = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_DRAGGABLE_INTERFACE: PEfl_Class;

function efl_ui_draggable_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_draggable_drag_target_set(obj: PEo; set_: TEina_Bool); cdecl; external libefl;
function efl_ui_draggable_drag_target_get(obj: PEo): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 13:48:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_DRAGGABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_DRAGGABLE_INTERFACE := efl_ui_draggable_interface_get;
end;


{$ENDIF read_implementation}
