unit efl_ui_list_view_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_List_View = ^TEfl_Ui_List_View;
  TEfl_Ui_List_View = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LIST_VIEW_CLASS: PEfl_Class;

function efl_ui_list_view_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:50:13 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_LIST_VIEW_CLASS: PEfl_Class;
begin
  EFL_UI_LIST_VIEW_CLASS := efl_ui_list_view_class_get;
end;
{$endif}


end.
