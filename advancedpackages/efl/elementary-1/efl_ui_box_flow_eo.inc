{$IFDEF read_interface}


type
  PEfl_Ui_Box_Flow = ^TEfl_Ui_Box_Flow;
  TEfl_Ui_Box_Flow = TEo;

function EFL_UI_BOX_FLOW_CLASS: PEfl_Class;

function efl_ui_box_flow_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:09:44 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_BOX_FLOW_CLASS: PEfl_Class;
begin
  EFL_UI_BOX_FLOW_CLASS := efl_ui_box_flow_class_get;
end;


{$ENDIF read_implementation}
