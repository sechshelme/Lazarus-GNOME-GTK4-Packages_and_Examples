{$IFDEF read_interface}


function elm_hover_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_hover_parent_set(obj: PEvas_Object; parent: PEvas_Object); cdecl; external libelementary;
function elm_hover_parent_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
