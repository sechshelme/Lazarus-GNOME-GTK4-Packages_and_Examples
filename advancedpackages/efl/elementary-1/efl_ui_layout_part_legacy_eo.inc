{$IFDEF read_interface}


type
  PEfl_Ui_Layout_Part_Legacy = ^TEfl_Ui_Layout_Part_Legacy;
  TEfl_Ui_Layout_Part_Legacy = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_PART_LEGACY_CLASS: PEfl_Class;

function efl_ui_layout_part_legacy_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:37:04 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LAYOUT_PART_LEGACY_CLASS: PEfl_Class;
begin
  EFL_UI_LAYOUT_PART_LEGACY_CLASS := efl_ui_layout_part_legacy_class_get;
end;
{$endif}


{$ENDIF read_implementation}
