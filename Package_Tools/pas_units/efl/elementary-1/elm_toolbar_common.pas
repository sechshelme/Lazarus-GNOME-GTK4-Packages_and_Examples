unit elm_toolbar_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_toolbar_item_state_unset(it: PElm_Object_Item); cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:07:19 ===


implementation



end.
