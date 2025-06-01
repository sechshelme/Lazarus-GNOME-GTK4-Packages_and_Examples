unit elc_combobox_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Combobox = ^TElm_Combobox;
  TElm_Combobox = TEo;

function elm_combobox_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_combobox_expanded_get(obj: PElm_Combobox): TEina_Bool; cdecl; external libelementary;
procedure elm_combobox_hover_begin(obj: PElm_Combobox); cdecl; external libelementary;
procedure elm_combobox_hover_end(obj: PElm_Combobox); cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:40:05 ===


implementation



end.
