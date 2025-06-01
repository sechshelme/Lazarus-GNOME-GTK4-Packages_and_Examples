{$IFDEF read_interface}



procedure elm_diskselector_item_selected_set(it:PElm_Object_Item; selected:TEina_Bool);cdecl;external libelementary;
function elm_diskselector_item_selected_get(it:PElm_Object_Item):TEina_Bool;cdecl;external libelementary;
function elm_diskselector_item_prev_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external libelementary;
function elm_diskselector_item_next_get(it:PElm_Object_Item):PElm_Object_Item;cdecl;external libelementary;

// === Konventiert am: 1-6-25 12:57:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
