unit efl_ui_check_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Check = ^TEfl_Ui_Check;
  TEfl_Ui_Check = TEo;

procedure elm_check_selected_set(obj: PEfl_Ui_Check; value: TEina_Bool); cdecl; external libelementary;
function elm_check_selected_get(obj: PEfl_Ui_Check): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:59:25 ===


implementation



end.
