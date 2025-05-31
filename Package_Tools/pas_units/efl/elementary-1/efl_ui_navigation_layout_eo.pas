unit efl_ui_navigation_layout_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Navigation_Layout = ^TEfl_Ui_Navigation_Layout;
  TEfl_Ui_Navigation_Layout = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_LAYOUT_CLASS: PEfl_Class;

function efl_ui_navigation_layout_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_navigation_layout_bar_set(obj: PEo; value: PEfl_Ui_Layout_Base); cdecl; external libelementary;
function efl_ui_navigation_layout_bar_get(obj: PEo): PEfl_Ui_Layout_Base; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:28 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_NAVIGATION_LAYOUT_CLASS: PEfl_Class;
begin
  EFL_UI_NAVIGATION_LAYOUT_CLASS := efl_ui_navigation_layout_class_get;
end;
{$endif}


end.
