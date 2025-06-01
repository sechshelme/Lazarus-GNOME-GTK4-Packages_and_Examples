unit elm_separator_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


function elm_separator_add(parent:PEvas_Object):PEvas_Object;cdecl;external libelementary;

// === Konventiert am: 1-6-25 15:10:17 ===


implementation



end.
