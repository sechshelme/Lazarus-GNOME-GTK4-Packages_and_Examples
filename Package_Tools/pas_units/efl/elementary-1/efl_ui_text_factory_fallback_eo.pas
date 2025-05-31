unit efl_ui_text_factory_fallback_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Text_Factory_Fallback = ^TEfl_Ui_Text_Factory_Fallback;
  TEfl_Ui_Text_Factory_Fallback = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS: PEfl_Class;

function efl_ui_text_factory_fallback_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 19:14:12 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_TEXT_FACTORY_FALLBACK_CLASS: PEfl_Class;
begin
  EFL_UI_TEXT_FACTORY_FALLBACK_CLASS := efl_ui_text_factory_fallback_class_get;
end;
{$endif}


end.
