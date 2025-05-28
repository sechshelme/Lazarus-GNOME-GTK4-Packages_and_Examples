{$IFDEF read_interface}


function elm_fileselector_entry_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_fileselector_entry_inwin_mode_set(obj: PElm_Fileselector_Entry; value: TEina_Bool); cdecl; external libelementary;
function elm_fileselector_entry_inwin_mode_get(obj: PElm_Fileselector_Entry): TEina_Bool; cdecl; external libelementary;
procedure elm_fileselector_entry_window_size_set(obj: PElm_Fileselector_Entry; width: TEvas_Coord; height: TEvas_Coord); cdecl; external libelementary;
procedure elm_fileselector_entry_window_size_get(obj: PElm_Fileselector_Entry; width: PEvas_Coord; height: PEvas_Coord); cdecl; external libelementary;
procedure elm_fileselector_entry_window_title_set(obj: PElm_Fileselector_Entry; title: pchar); cdecl; external libelementary;
function elm_fileselector_entry_window_title_get(obj: PElm_Fileselector_Entry): pchar; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:07:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
