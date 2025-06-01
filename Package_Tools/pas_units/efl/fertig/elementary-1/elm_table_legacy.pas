unit elm_table_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_table_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_table_pack_set(subobj: PEvas_Object; col: longint; row: longint; colspan: longint; rowspan: longint); cdecl; external libelementary;
procedure elm_table_pack_get(subobj: PEvas_Object; col: Plongint; row: Plongint; colspan: Plongint; rowspan: Plongint); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:30 ===


implementation



end.
