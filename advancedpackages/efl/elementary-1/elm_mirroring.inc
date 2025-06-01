{$IFDEF read_interface}


function elm_object_mirrored_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_object_mirrored_set(obj: PEvas_Object; mirrored: TEina_Bool); cdecl; external libelementary;
function elm_object_mirrored_automatic_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_object_mirrored_automatic_set(obj: PEvas_Object; automatic: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:42:03 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
