unit elc_multibuttonentry_common;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TElm_Multibuttonentry_Item_Filter_Cb = function(obj: PEvas_Object; item_label: pchar; item_data: pointer; data: pointer): TEina_Bool; cdecl;

  PElm_Multibuttonentry_Format_Cb = ^TElm_Multibuttonentry_Format_Cb;
  TElm_Multibuttonentry_Format_Cb = function(count: longint; data: pointer): pchar; cdecl;

  // === Konventiert am: 28-5-25 16:05:18 ===


implementation



end.
