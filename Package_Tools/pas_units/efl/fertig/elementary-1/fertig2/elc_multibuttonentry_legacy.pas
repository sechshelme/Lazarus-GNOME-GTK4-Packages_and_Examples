unit elc_multibuttonentry_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, elc_multibuttonentry_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_multibuttonentry_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_multibuttonentry_format_function_set(obj: PEo; format_function: TElm_Multibuttonentry_Format_Cb; data: pointer); cdecl; external libelementary;

// === Konventiert am: 28-5-25 16:05:21 ===


implementation



end.
