{$IFDEF read_interface}


function elm_box_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_box_layout_set(obj: PEvas_Object; cb: TEvas_Object_Box_Layout; data: pointer; free_data: TEcore_Cb); cdecl; external libelementary;

// === Konventiert am: 10-5-25 17:37:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
