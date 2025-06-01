unit elm_win_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure elm_win_autodel_set(obj: PEvas_Object; autodel: TEina_Bool); cdecl; external libelementary;
function elm_win_autodel_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:54:18 ===


implementation



end.
