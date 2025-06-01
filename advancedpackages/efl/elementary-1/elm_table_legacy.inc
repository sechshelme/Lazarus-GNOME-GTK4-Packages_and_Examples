{$IFDEF read_interface}


function elm_table_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_table_pack_set(subobj: PEvas_Object; col: longint; row: longint; colspan: longint; rowspan: longint); cdecl; external libelementary;
procedure elm_table_pack_get(subobj: PEvas_Object; col: Plongint; row: Plongint; colspan: Plongint; rowspan: Plongint); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:28:30 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
