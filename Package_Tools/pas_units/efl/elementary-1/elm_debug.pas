unit elm_debug;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_object_tree_dump(top: PEvas_Object); cdecl; external libelementary;
procedure elm_object_tree_dot_dump(top: PEvas_Object; file_: pchar); cdecl; external libelementary;

// === Konventiert am: 1-6-25 12:57:13 ===


implementation



end.
