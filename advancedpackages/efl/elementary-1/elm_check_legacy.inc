{$IFDEF read_interface}


type
  PElm_Check = ^TElm_Check;
  TElm_Check = TEo;

function elm_check_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_check_state_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_check_state_set(obj: PEvas_Object; state: TEina_Bool); cdecl; external libelementary;
procedure elm_check_state_pointer_set(obj: PEvas_Object; statep: PEina_Bool); cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:59:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
