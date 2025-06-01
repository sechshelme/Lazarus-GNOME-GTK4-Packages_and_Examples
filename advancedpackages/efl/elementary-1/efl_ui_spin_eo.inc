{$IFDEF read_interface}


type
  PEfl_Ui_Spin = ^TEfl_Ui_Spin;
  TEfl_Ui_Spin = TEo;

function EFL_UI_SPIN_CLASS: PEfl_Class;

function efl_ui_spin_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:37:45 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_SPIN_CLASS: PEfl_Class;
begin
  EFL_UI_SPIN_CLASS := efl_ui_spin_class_get;
end;


{$ENDIF read_implementation}
