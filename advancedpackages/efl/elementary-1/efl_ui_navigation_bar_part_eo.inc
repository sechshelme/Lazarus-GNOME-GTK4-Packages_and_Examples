{$IFDEF read_interface}


type
  PEfl_Ui_Navigation_Bar_Part = ^TEfl_Ui_Navigation_Bar_Part;
  TEfl_Ui_Navigation_Bar_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_BAR_PART_CLASS: PEfl_Class;

function efl_ui_navigation_bar_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_BAR_PART_CLASS: PEfl_Class;
begin
  EFL_UI_NAVIGATION_BAR_PART_CLASS := efl_ui_navigation_bar_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
