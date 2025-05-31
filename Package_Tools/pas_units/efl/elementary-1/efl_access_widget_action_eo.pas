unit efl_access_widget_action_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_access_widget_action;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Access_Widget_Action = ^TEfl_Access_Widget_Action;
  TEfl_Access_Widget_Action = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_WIDGET_ACTION_MIXIN: PEfl_Class;

function efl_access_widget_action_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_access_widget_action_elm_actions_get(obj: PEo): PEfl_Access_Action_Data; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 13:24:32 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_WIDGET_ACTION_MIXIN: PEfl_Class;
begin
  EFL_ACCESS_WIDGET_ACTION_MIXIN := efl_access_widget_action_mixin_get;
end;
{$endif}


end.
