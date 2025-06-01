unit efl_ui_panes_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Panes = ^TEfl_Ui_Panes;
  TEfl_Ui_Panes = TEo;

procedure elm_panes_fixed_set(obj: PEfl_Ui_Panes; fixed: TEina_Bool); cdecl; external libelementary;
function elm_panes_fixed_get(obj: PEfl_Ui_Panes): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:09:32 ===


implementation



end.
