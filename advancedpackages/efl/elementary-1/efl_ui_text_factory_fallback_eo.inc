{$IFDEF read_interface}


type
  PEfl_Ui_Text_Factory_Fallback = ^TEfl_Ui_Text_Factory_Fallback;
  TEfl_Ui_Text_Factory_Fallback = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS: PEfl_Class;

function efl_ui_text_factory_fallback_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:14:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS: PEfl_Class;
begin
  EFL_UI_TEXT_FACTORY_FALLBACK_CLASS := efl_ui_text_factory_fallback_class_get;
end;
{$endif}


{$ENDIF read_implementation}
