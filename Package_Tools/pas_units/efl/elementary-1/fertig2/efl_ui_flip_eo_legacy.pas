unit efl_ui_flip_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_ui_flip_legacy;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


procedure elm_flip_interaction_set(obj:PEo; mode:TElm_Flip_Interaction);cdecl;external libelementary;
function elm_flip_interaction_get(obj:PEo):TElm_Flip_Interaction;cdecl;external libelementary;
function elm_flip_front_visible_get(obj:PEo):TEina_Bool;cdecl;external libelementary;
procedure elm_flip_go(obj:PEo; mode:TElm_Flip_Mode);cdecl;external libelementary;
procedure elm_flip_go_to(obj:PEo; front:TEina_Bool; mode:TElm_Flip_Mode);cdecl;external libelementary;

// === Konventiert am: 28-5-25 19:25:06 ===


implementation



end.
