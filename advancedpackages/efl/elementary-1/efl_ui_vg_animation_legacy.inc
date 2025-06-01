{$IFDEF read_interface}


function elm_animation_view_add(parent: PEvas_Object): PElm_Animation_View; cdecl; external libelementary;
function elm_animation_view_file_set(obj: PElm_Animation_View; file_: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_state_get(obj: PElm_Animation_View): TElm_Animation_View_State; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:25:55 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
