{$IFDEF read_interface}


type
  PEfl_Canvas_Wl = ^TEfl_Canvas_Wl;
  TEfl_Canvas_Wl = TEo;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Canvas_Wl_Rotation = ^TEfl_Canvas_Wl_Rotation;
  TEfl_Canvas_Wl_Rotation =  Longint;
  Const
    EFL_CANVAS_WL_ROTATION_ROTATE_0 = 0;
    EFL_CANVAS_WL_ROTATION_ROTATE_90 = 1;
    EFL_CANVAS_WL_ROTATION_ROTATE_180 = 2;
    EFL_CANVAS_WL_ROTATION_ROTATE_270 = 3;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_WL_CLASS : PEfl_Class;

function efl_canvas_wl_class_get:PEfl_Class;cdecl;external libefl_canvas_wl;
function efl_canvas_wl_run(obj:PEo; cmd:Pchar):PEfl_Exe;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_exec_flags_set(obj:PEo; flags:TEfl_Exe_Flags);cdecl;external libefl_canvas_wl;
function efl_canvas_wl_exec_flags_get(obj:PEo):TEfl_Exe_Flags;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_allowed_pid_add(obj:PEo; pid:longint);cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_allowed_pid_del(obj:PEo; pid:longint);cdecl;external libefl_canvas_wl;
function efl_canvas_wl_surface_next(obj:PEo):PEfl_Canvas_Wl_Surface;cdecl;external libefl_canvas_wl;
function efl_canvas_wl_surface_prev(obj:PEo):PEfl_Canvas_Wl_Surface;cdecl;external libefl_canvas_wl;
function efl_canvas_wl_active_surface_set(obj:PEo; surface:PEfl_Canvas_Wl_Surface):TEina_Bool;cdecl;external libefl_canvas_wl;
function efl_canvas_wl_active_surface_get(obj:PEo):PEfl_Canvas_Wl_Surface;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_aspect_propagate_set(obj:PEo; set_:TEina_Bool);cdecl;external libefl_canvas_wl;
function efl_canvas_wl_aspect_propagate_get(obj:PEo):TEina_Bool;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_minmax_propagate_set(obj:PEo; set_:TEina_Bool);cdecl;external libefl_canvas_wl;
function efl_canvas_wl_minmax_propagate_get(obj:PEo):TEina_Bool;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_rotation_set(obj:PEo; rotation:TEfl_Canvas_Wl_Rotation; rtl:TEina_Bool);cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_rotation_get(obj:PEo; rotation:PEfl_Canvas_Wl_Rotation; rtl:PEina_Bool);cdecl;external libefl_canvas_wl;
function efl_canvas_wl_global_add(obj:PEo; iface:PEfl_Canvas_Wl_Wl_Interface; version:dword; data:PEfl_Canvas_Wl_Wl_Interface_Data; bind_cb:PEfl_Canvas_Wl_Wl_Interface_Bind_Cb):PEfl_Canvas_Wl_Wl_Global;cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_seat_keymap_set(obj:PEo; seat:PEfl_Input_Device; state:PEfl_Canvas_Wl_Xkb_State; keymap_str:Pchar; key_array:PEfl_Canvas_Wl_Wl_Array);cdecl;external libefl_canvas_wl;
procedure efl_canvas_wl_seat_key_repeat_set(obj:PEo; seat:PEfl_Input_Device; repeat_rate:longint; repeat_delay:longint);cdecl;external libefl_canvas_wl;
  var
    _EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED : TEfl_Event_Description;cvar;external libefl_canvas_wl;
    _EFL_CANVAS_WL_EVENT_CHILD_ADDED : TEfl_Event_Description;cvar;external libefl_canvas_wl;
    _EFL_CANVAS_WL_EVENT_POPUP_ADDED : TEfl_Event_Description;cvar;external libefl_canvas_wl;
    _EFL_CANVAS_WL_EVENT_SEAT_ADDED : TEfl_Event_Description;cvar;external libefl_canvas_wl;
function EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED : PEfl_Event_Description;
function EFL_CANVAS_WL_EVENT_CHILD_ADDED : PEfl_Event_Description;
function EFL_CANVAS_WL_EVENT_POPUP_ADDED : PEfl_Event_Description;
function EFL_CANVAS_WL_EVENT_SEAT_ADDED : PEfl_Event_Description;
{$endif}

// === Konventiert am: 14-6-25 16:27:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CANVAS_WL_CLASS: PEfl_Class;
  begin
    EFL_CANVAS_WL_CLASS:=efl_canvas_wl_class_get;
  end;

function EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED: PEfl_Event_Description;
  begin
    EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED:=@(_EFL_CANVAS_WL_EVENT_TOPLEVEL_ADDED);
  end;

function EFL_CANVAS_WL_EVENT_CHILD_ADDED: PEfl_Event_Description;
  begin
    EFL_CANVAS_WL_EVENT_CHILD_ADDED:=@(_EFL_CANVAS_WL_EVENT_CHILD_ADDED);
  end;

function EFL_CANVAS_WL_EVENT_POPUP_ADDED: PEfl_Event_Description;
  begin
    EFL_CANVAS_WL_EVENT_POPUP_ADDED:=@(_EFL_CANVAS_WL_EVENT_POPUP_ADDED);
  end;

function EFL_CANVAS_WL_EVENT_SEAT_ADDED: PEfl_Event_Description;
  begin
    EFL_CANVAS_WL_EVENT_SEAT_ADDED:=@(_EFL_CANVAS_WL_EVENT_SEAT_ADDED);
  end;
{$endif}


{$ENDIF read_implementation}
