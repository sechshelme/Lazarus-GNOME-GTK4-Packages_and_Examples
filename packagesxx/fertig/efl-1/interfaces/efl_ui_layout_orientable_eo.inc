{$IFDEF read_interface}


type
  PEfl_Ui_Layout_Orientable = ^TEfl_Ui_Layout_Orientable;
  TEfl_Ui_Layout_Orientable = TEo;

type
  PEfl_Ui_Layout_Orientation = ^TEfl_Ui_Layout_Orientation;
  TEfl_Ui_Layout_Orientation = longint;

const
  EFL_UI_LAYOUT_ORIENTATION_DEFAULT = 0;
  EFL_UI_LAYOUT_ORIENTATION_HORIZONTAL = 1;
  EFL_UI_LAYOUT_ORIENTATION_VERTICAL = 2;
  EFL_UI_LAYOUT_ORIENTATION_AXIS_BITMASK = 3;
  EFL_UI_LAYOUT_ORIENTATION_INVERTED = 4;

function EFL_UI_LAYOUT_ORIENTABLE_INTERFACE: PEfl_Class;

function efl_ui_layout_orientable_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_layout_orientation_set(obj: PEo; dir: TEfl_Ui_Layout_Orientation); cdecl; external libefl;
function efl_ui_layout_orientation_get(obj: PEo): TEfl_Ui_Layout_Orientation; cdecl; external libefl;

// === Konventiert am: 18-5-25 19:44:54 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_LAYOUT_ORIENTABLE_INTERFACE: PEfl_Class;
begin
  EFL_UI_LAYOUT_ORIENTABLE_INTERFACE := efl_ui_layout_orientable_interface_get;
end;


{$ENDIF read_implementation}
