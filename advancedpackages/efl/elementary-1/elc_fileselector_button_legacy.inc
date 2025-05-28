{$IFDEF read_interface}


function elm_fileselector_button_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_fileselector_button_inwin_mode_set(obj: PElm_Fileselector_Button; value: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_button_inwin_mode_get(obj: PElm_Fileselector_Button): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_button_window_size_set(obj: PElm_Fileselector_Button; width: TEvas_Coord; height: TEvas_Coord); cdecl; external libelementary;
procedure elm_fileselector_button_window_size_get(obj: PElm_Fileselector_Button; width: PEvas_Coord; height: PEvas_Coord); cdecl; external libelementary;
procedure elm_fileselector_button_window_title_set(obj: PElm_Fileselector_Button; title: pchar); cdecl; external libelementary;
function elm_fileselector_button_window_title_get(obj: PElm_Fileselector_Button): pchar; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:07:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
