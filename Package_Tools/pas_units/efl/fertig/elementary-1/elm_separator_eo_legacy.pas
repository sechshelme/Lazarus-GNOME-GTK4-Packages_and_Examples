unit elm_separator_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Separator = ^TElm_Separator;
  TElm_Separator = TEo;

procedure elm_separator_horizontal_set(obj: PElm_Separator; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_separator_horizontal_get(obj: PElm_Separator): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:10:15 ===


implementation



end.
