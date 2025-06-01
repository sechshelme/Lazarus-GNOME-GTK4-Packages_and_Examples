unit efl_ui_focus_manager_sub_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Focus_Manager_Sub = ^TEfl_Ui_Focus_Manager_Sub;
  TEfl_Ui_Focus_Manager_Sub = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_SUB_MIXIN: PEfl_Class;

function efl_ui_focus_manager_sub_mixin_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 17:16:28 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_FOCUS_MANAGER_SUB_MIXIN: PEfl_Class;
begin
  EFL_UI_FOCUS_MANAGER_SUB_MIXIN := efl_ui_focus_manager_sub_mixin_get;
end;
{$endif}


end.
