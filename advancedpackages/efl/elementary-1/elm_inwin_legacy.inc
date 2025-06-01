{$IFDEF read_interface}


function elm_win_inwin_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_win_inwin_content_set(obj: PEvas_Object; content: PEvas_Object); cdecl; external libelementary;
function elm_win_inwin_content_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_win_inwin_content_unset(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:32:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
