{$IFDEF read_interface}


type
  PEfl_Ui_Radio_Legacy_Part = ^TEfl_Ui_Radio_Legacy_Part;
  TEfl_Ui_Radio_Legacy_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_RADIO_LEGACY_PART_CLASS: PEfl_Config;

function efl_ui_radio_legacy_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 15:52:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_RADIO_LEGACY_PART_CLASS: PEfl_Config;
begin
  EFL_UI_RADIO_LEGACY_PART_CLASS := efl_ui_radio_legacy_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
