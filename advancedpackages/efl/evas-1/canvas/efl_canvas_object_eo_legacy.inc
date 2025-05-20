{$IFDEF read_interface}

// Doppelt im C-Header
//type
//  PEfl_Canvas_Object = ^TEfl_Canvas_Object;
//  TEfl_Canvas_Object = TEo;
//
//type
//  TEfl_Event_Animator_Tick = record
//    update_area: TEina_Rect;
//  end;
//  PEfl_Event_Animator_Tick = ^TEfl_Event_Animator_Tick;

function evas_object_pointer_mode_set(obj: PEfl_Canvas_Object; pointer_mode: TEvas_Object_Pointer_Mode): TEina_Bool; cdecl; external libevas;
function evas_object_pointer_mode_get(obj: PEfl_Canvas_Object): TEvas_Object_Pointer_Mode; cdecl; external libevas;
procedure evas_object_clip_set(obj: PEfl_Canvas_Object; clip: PEfl_Canvas_Object); cdecl; external libevas;
function evas_object_clip_get(obj: PEfl_Canvas_Object): PEfl_Canvas_Object; cdecl; external libevas;
procedure evas_object_repeat_events_set(obj: PEfl_Canvas_Object; _repeat: TEina_Bool); cdecl; external libevas;
function evas_object_repeat_events_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_focus_set(obj: PEfl_Canvas_Object; focus: TEina_Bool); cdecl; external libevas;
function evas_object_focus_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_precise_is_inside_set(obj: PEfl_Canvas_Object; precise: TEina_Bool); cdecl; external libevas;
function evas_object_precise_is_inside_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_propagate_events_set(obj: PEfl_Canvas_Object; propagate: TEina_Bool); cdecl; external libevas;
function evas_object_propagate_events_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_pass_events_set(obj: PEfl_Canvas_Object; pass: TEina_Bool); cdecl; external libevas;
function evas_object_pass_events_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
procedure evas_object_anti_alias_set(obj: PEfl_Canvas_Object; anti_alias: TEina_Bool); cdecl; external libevas;
function evas_object_anti_alias_get(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;
function evas_object_smart_parent_get(obj: PEfl_Canvas_Object): PEfl_Canvas_Object; cdecl; external libevas;
procedure evas_object_paragraph_direction_set(obj: PEfl_Canvas_Object; dir: TEvas_BiDi_Direction); cdecl; external libevas;
function evas_object_paragraph_direction_get(obj: PEfl_Canvas_Object): TEvas_BiDi_Direction; cdecl; external libevas;
function evas_object_clipees_has(obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libevas;

// === Konventiert am: 13-5-25 16:50:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
