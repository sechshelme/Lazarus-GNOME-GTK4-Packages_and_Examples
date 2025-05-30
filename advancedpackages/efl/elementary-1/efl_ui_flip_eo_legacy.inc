{$IFDEF read_interface}


procedure elm_flip_interaction_set(obj:PEo; mode:TElm_Flip_Interaction);cdecl;external libelementary;
function elm_flip_interaction_get(obj:PEo):TElm_Flip_Interaction;cdecl;external libelementary;
function elm_flip_front_visible_get(obj:PEo):TEina_Bool;cdecl;external libelementary;
procedure elm_flip_go(obj:PEo; mode:TElm_Flip_Mode);cdecl;external libelementary;
procedure elm_flip_go_to(obj:PEo; front:TEina_Bool; mode:TElm_Flip_Mode);cdecl;external libelementary;

// === Konventiert am: 28-5-25 19:25:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
