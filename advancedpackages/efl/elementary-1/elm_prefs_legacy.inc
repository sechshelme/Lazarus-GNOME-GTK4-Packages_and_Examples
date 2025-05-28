{$IFDEF read_interface}


function elm_prefs_page_widget_common_add(prefs: PEvas_Object; obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_prefs_file_set(obj: PEo; file_: pchar; page: pchar): TEina_Bool; cdecl; external libelementary;
function elm_prefs_file_get(obj: PEo; file_: PPchar; page: PPchar): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:37:35 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
