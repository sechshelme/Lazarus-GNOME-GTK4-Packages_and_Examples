{$IFDEF read_interface}


type
  PElm_Combobox = ^TElm_Combobox;
  TElm_Combobox = TEo;

function elm_combobox_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_combobox_expanded_get(obj: PElm_Combobox): TEina_Bool; cdecl; external libelementary;
procedure elm_combobox_hover_begin(obj: PElm_Combobox); cdecl; external libelementary;
procedure elm_combobox_hover_end(obj: PElm_Combobox); cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:40:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
