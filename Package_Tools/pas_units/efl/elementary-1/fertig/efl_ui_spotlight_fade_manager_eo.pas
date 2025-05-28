unit efl_ui_spotlight_fade_manager_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Spotlight_Fade_Manager = ^TEfl_Ui_Spotlight_Fade_Manager;
  TEfl_Ui_Spotlight_Fade_Manager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_FADE_MANAGER_CLASS: PEfl_Class;

function efl_ui_spotlight_fade_manager_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:19 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_FADE_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_FADE_MANAGER_CLASS := efl_ui_spotlight_fade_manager_class_get;
end;
{$endif}


end.
