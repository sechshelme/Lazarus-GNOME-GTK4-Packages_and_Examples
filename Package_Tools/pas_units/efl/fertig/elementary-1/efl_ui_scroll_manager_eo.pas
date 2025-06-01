unit efl_ui_scroll_manager_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Scroll_Manager = ^TEfl_Ui_Scroll_Manager;
  TEfl_Ui_Scroll_Manager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SCROLL_MANAGER_CLASS: PEfl_Class;

function efl_ui_scroll_manager_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_scroll_manager_pan_set(obj: PEo; pan: PEfl_Ui_Pan); cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 17:22:16 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SCROLL_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_SCROLL_MANAGER_CLASS := efl_ui_scroll_manager_class_get;
end;
{$endif}


end.
