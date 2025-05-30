{$IFDEF read_interface}


type
  PEfl_Ui_Flip_Part = ^TEfl_Ui_Flip_Part;
  TEfl_Ui_Flip_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FLIP_PART_CLASS: PEfl_Class;

function efl_ui_flip_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 19:37:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_FLIP_PART_CLASS: PEfl_Class;
begin
  EFL_UI_FLIP_PART_CLASS := efl_ui_flip_part_class_get;
end;


{$ENDIF read_implementation}
