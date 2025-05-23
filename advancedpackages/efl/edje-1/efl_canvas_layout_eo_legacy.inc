{$IFDEF read_interface}


// Doppelt im C-Header
//type
//  PEfl_Canvas_Layout = ^TEfl_Canvas_Layout;
//  TEfl_Canvas_Layout = TEo;

procedure edje_object_animation_set(obj: PEfl_Canvas_Layout; on: TEina_Bool); cdecl; external libedje;
function edje_object_animation_get(obj: PEfl_Canvas_Layout): TEina_Bool; cdecl; external libedje;
function edje_object_seat_get(obj: PEfl_Canvas_Layout; name: PEina_Stringshare): PEfl_Input_Device; cdecl; external libedje;
function edje_object_seat_name_get(obj: PEfl_Canvas_Layout; device: PEfl_Input_Device): PEina_Stringshare; cdecl; external libedje;
function edje_object_layout_load_error_get(obj: PEfl_Canvas_Layout): TEina_Error; cdecl; external libedje;
function edje_object_content_remove(obj: PEfl_Canvas_Layout; content: PEfl_Gfx_Entity): TEina_Bool; cdecl; external libedje;

// === Konventiert am: 22-5-25 19:40:59 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
