{$IFDEF read_interface}


const
  ELM_WIN_TRAP_VERSION = 1;

type
  TElm_Win_Trap = record
    version: dword;
    add: function(o: PEvas_Object): pointer; cdecl;
    del: procedure(data: pointer; o: PEvas_Object); cdecl;
    hide: function(data: pointer; o: PEvas_Object): TEina_Bool; cdecl;
    show: function(data: pointer; o: PEvas_Object): TEina_Bool; cdecl;
    move: function(data: pointer; o: PEvas_Object; x: longint; y: longint): TEina_Bool; cdecl;
    resize: function(data: pointer; o: PEvas_Object; w: longint; h: longint): TEina_Bool; cdecl;
    center: function(data: pointer; o: PEvas_Object; h: TEina_Bool; v: TEina_Bool): TEina_Bool; cdecl;
    lower: function(data: pointer; o: PEvas_Object): TEina_Bool; cdecl;
    raise_: function(data: pointer; o: PEvas_Object): TEina_Bool; cdecl;
    activate: function(data: pointer; o: PEvas_Object): TEina_Bool; cdecl;
    alpha_set: function(data: pointer; o: PEvas_Object; alpha: TEina_Bool): TEina_Bool; cdecl;
    aspect_set: function(data: pointer; o: PEvas_Object; aspect: double): TEina_Bool; cdecl;
    avoid_damage_set: function(data: pointer; o: PEvas_Object; on_: TEcore_Evas_Avoid_Damage_Type): TEina_Bool; cdecl;
    borderless_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    demand_attention_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    focus_skip_set: function(data: pointer; o: PEvas_Object; skip: TEina_Bool): TEina_Bool; cdecl;
    fullscreen_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    iconified_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    layer_set: function(data: pointer; o: PEvas_Object; layer: longint): TEina_Bool; cdecl;
    manual_render_set: function(data: pointer; o: PEvas_Object; manual_render: TEina_Bool): TEina_Bool; cdecl;
    maximized_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    modal_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    name_class_set: function(data: pointer; o: PEvas_Object; n: pchar; c: pchar): TEina_Bool; cdecl;
    object_cursor_set: function(data: pointer; o: PEvas_Object; obj: PEvas_Object; layer: longint; hot_x: longint;
      hot_y: longint): TEina_Bool; cdecl;
    override_set: function(data: pointer; o: PEvas_Object; on_: TEina_Bool): TEina_Bool; cdecl;
    rotation_set: function(data: pointer; o: PEvas_Object; rot: longint): TEina_Bool; cdecl;
    rotation_with_resize_set: function(data: pointer; o: PEvas_Object; rot: longint): TEina_Bool; cdecl;
    shaped_set: function(data: pointer; o: PEvas_Object; shaped: TEina_Bool): TEina_Bool; cdecl;
    size_base_set: function(data: pointer; o: PEvas_Object; w: longint; h: longint): TEina_Bool; cdecl;
    size_step_set: function(data: pointer; o: PEvas_Object; w: longint; h: longint): TEina_Bool; cdecl;
    size_min_set: function(data: pointer; o: PEvas_Object; w: longint; h: longint): TEina_Bool; cdecl;
    size_max_set: function(data: pointer; o: PEvas_Object; w: longint; h: longint): TEina_Bool; cdecl;
    sticky_set: function(data: pointer; o: PEvas_Object; sticky: TEina_Bool): TEina_Bool; cdecl;
    title_set: function(data: pointer; o: PEvas_Object; t: pchar): TEina_Bool; cdecl;
    urgent_set: function(data: pointer; o: PEvas_Object; urgent: TEina_Bool): TEina_Bool; cdecl;
    withdrawn_set: function(data: pointer; o: PEvas_Object; withdrawn: TEina_Bool): TEina_Bool; cdecl;
  end;
  PElm_Win_Trap = ^TElm_Win_Trap;

function elm_win_trap_set(trap: PElm_Win_Trap): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:25:58 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
