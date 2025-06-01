{$IFDEF read_interface}


function elm_genlist_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_genlist_nth_item_get(obj: PEvas_Object; nth: dword): PElm_Object_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
