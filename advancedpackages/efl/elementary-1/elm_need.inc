{$IFDEF read_interface}


function elm_need_efreet: TEina_Bool; cdecl; external libelementary;
function elm_need_systray: TEina_Bool; cdecl; external libelementary;
function elm_need_sys_notify: TEina_Bool; cdecl; external libelementary;
function elm_need_e_dbus: TEina_Bool; cdecl; external libelementary; deprecated;
function elm_need_eldbus: TEina_Bool; cdecl; external libelementary;
function elm_need_ethumb: TEina_Bool; cdecl; external libelementary;
function elm_need_web: TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:54:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
