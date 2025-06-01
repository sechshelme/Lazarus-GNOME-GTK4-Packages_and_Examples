unit efl_ui_vg_animation_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_animation_view_add(parent: PEvas_Object): PElm_Animation_View; cdecl; external libelementary;
function elm_animation_view_file_set(obj: PElm_Animation_View; file_: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_state_get(obj: PElm_Animation_View): TElm_Animation_View_State; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:25:55 ===


implementation



end.
