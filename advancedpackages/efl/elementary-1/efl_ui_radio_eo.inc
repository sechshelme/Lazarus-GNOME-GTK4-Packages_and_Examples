{$IFDEF read_interface}


type
  PEfl_Ui_Radio = ^TEfl_Ui_Radio;
  TEfl_Ui_Radio = TEo;

function EFL_UI_RADIO_CLASS: PEfl_Config;

function efl_ui_radio_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_radio_state_value_set(obj: PEo; value: longint); cdecl; external libelementary;
function efl_ui_radio_state_value_get(obj: PEo): longint; cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:52:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_RADIO_CLASS: PEfl_Config;
begin
  EFL_UI_RADIO_CLASS := efl_ui_radio_class_get;
end;


{$ENDIF read_implementation}
