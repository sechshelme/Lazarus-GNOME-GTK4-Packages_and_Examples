{$IFDEF read_interface}


type
  PEfl_Ui_Progressbar_Part = ^TEfl_Ui_Progressbar_Part;
  TEfl_Ui_Progressbar_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROGRESSBAR_PART_CLASS: PEfl_Class;

function efl_ui_progressbar_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:22:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PROGRESSBAR_PART_CLASS: PEfl_Class;
begin
  EFL_UI_PROGRESSBAR_PART_CLASS := efl_ui_progressbar_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
