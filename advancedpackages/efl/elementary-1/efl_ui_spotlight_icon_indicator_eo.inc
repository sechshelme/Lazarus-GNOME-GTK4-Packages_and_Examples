{$IFDEF read_interface}


type
  PEfl_Ui_Spotlight_Icon_Indicator = ^TEfl_Ui_Spotlight_Icon_Indicator;
  TEfl_Ui_Spotlight_Icon_Indicator = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_ICON_INDICATOR_CLASS: PEfl_Class;

function efl_ui_spotlight_icon_indicator_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_ICON_INDICATOR_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_ICON_INDICATOR_CLASS := efl_ui_spotlight_icon_indicator_class_get;
end;
{$endif}


{$ENDIF read_implementation}
