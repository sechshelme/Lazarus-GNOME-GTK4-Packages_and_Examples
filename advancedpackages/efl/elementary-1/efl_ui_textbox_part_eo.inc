{$IFDEF read_interface}


type
  PEfl_Ui_Textbox_Part = ^TEfl_Ui_Textbox_Part;
  TEfl_Ui_Textbox_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTBOX_PART_CLASS: PEfl_Class;

function efl_ui_textbox_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:14:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXTBOX_PART_CLASS: PEfl_Class;
begin
  EFL_UI_TEXTBOX_PART_CLASS := efl_ui_textbox_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
