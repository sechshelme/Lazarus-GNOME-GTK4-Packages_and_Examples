unit fp_ecore_wl2;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$ifdef EFL_BETA_API_SUPPORT}
const
  ECORE_WL2_SURFACE_INTERFACE_VERSION = 1;

type
  TEcore_Wl2_Window = record
  end;
  PEcore_Wl2_Window = ^TEcore_Wl2_Window;

  TEcore_Wl2_Display = record
  end;
  PEcore_Wl2_Display = ^TEcore_Wl2_Display;

  TEcore_Wl2_Offer = record
  end;
  PEcore_Wl2_Offer = ^TEcore_Wl2_Offer;

  TEcore_Wl2_Output = record
  end;
  PEcore_Wl2_Output = ^TEcore_Wl2_Output;

  TEcore_Wl2_Input = record
  end;
  PEcore_Wl2_Input = ^TEcore_Wl2_Input;

  TEcore_Wl2_Surface = record
  end;
  PEcore_Wl2_Surface = ^TEcore_Wl2_Surface;

type

  PEcore_Wl2_Drag_Action = ^TEcore_Wl2_Drag_Action;
  TEcore_Wl2_Drag_Action = longint;

const
  ECORE_WL2_DRAG_ACTION_NONE = 0;
  ECORE_WL2_DRAG_ACTION_COPY = 1;
  ECORE_WL2_DRAG_ACTION_MOVE = 2;
  ECORE_WL2_DRAG_ACTION_ASK = 4;
  ECORE_WL2_DRAG_ACTION_LAST = 5;

type
  PEcore_Wl2_Seat_Capabilities = ^TEcore_Wl2_Seat_Capabilities;
  TEcore_Wl2_Seat_Capabilities = longint;

const
  ECORE_WL2_SEAT_CAPABILITIES_NONE = 0;
  ECORE_WL2_SEAT_CAPABILITIES_POINTER = 1;
  ECORE_WL2_SEAT_CAPABILITIES_KEYBOARD = 2;
  ECORE_WL2_SEAT_CAPABILITIES_TOUCH = 4;

type
  TEcore_Wl2_Event_Connection = record
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Connection = ^TEcore_Wl2_Event_Connection;

  TEcore_Wl2_Event_Connect = TEcore_Wl2_Event_Connection;
  TEcore_Wl2_Event_Disconnect = TEcore_Wl2_Event_Connection;

  TEcore_Wl2_Global = record
    iface: PEina_Stringshare;
    id: dword;
    version: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Global = ^TEcore_Wl2_Global;

  TEcore_Wl2_Event_Global = record
    display: PEcore_Wl2_Display;
    iface: PEina_Stringshare;
    id: dword;
    version: dword;
  end;
  PEcore_Wl2_Event_Global = ^TEcore_Wl2_Event_Global;

  TEcore_Wl2_Event_Focus_In = record
    window: PEcore_Wl2_Window;
    timestamp: dword;
    dev: PEo;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Focus_In = ^TEcore_Wl2_Event_Focus_In;

  TEcore_Wl2_Event_Focus_Out = record
    window: PEcore_Wl2_Window;
    timestamp: dword;
    dev: PEo;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Focus_Out = ^TEcore_Wl2_Event_Focus_Out;

  TEcore_Wl2_Event_Dnd_Enter = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    offer: PEcore_Wl2_Offer;
    x: longint;
    y: longint;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Dnd_Enter = ^TEcore_Wl2_Event_Dnd_Enter;

  TEcore_Wl2_Event_Dnd_Leave = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    offer: PEcore_Wl2_Offer;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Dnd_Leave = ^TEcore_Wl2_Event_Dnd_Leave;

  TEcore_Wl2_Event_Dnd_Motion = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    offer: PEcore_Wl2_Offer;
    x: longint;
    y: longint;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Dnd_Motion = ^TEcore_Wl2_Event_Dnd_Motion;

  TEcore_Wl2_Event_Dnd_Drop = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    x: longint;
    y: longint;
    offer: PEcore_Wl2_Offer;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Dnd_Drop = ^TEcore_Wl2_Event_Dnd_Drop;

  TEcore_Wl2_Event_Dnd_End = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Dnd_End = ^TEcore_Wl2_Event_Dnd_End;

  TEcore_Wl2_Event_Data_Source_Event = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    action: TEcore_Wl2_Drag_Action;
    seat: dword;
    serial: uint32;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Data_Source_Event = ^TEcore_Wl2_Event_Data_Source_Event;

  TEcore_Wl2_Event_Data_Source_End = record
    win: PEcore_Wl2_Window;
    source: PEcore_Wl2_Window;
    action: TEcore_Wl2_Drag_Action;
    seat: dword;
    serial: uint32;
    display: PEcore_Wl2_Display;
    cancelled: TEina_Bool;
  end;
  PEcore_Wl2_Event_Data_Source_End = ^TEcore_Wl2_Event_Data_Source_End;

  TEcore_Wl2_Event_Data_Source_Drop = TEcore_Wl2_Event_Data_Source_Event;
  TEcore_Wl2_Event_Data_Source_Action = TEcore_Wl2_Event_Data_Source_Event;

  TEcore_Wl2_Event_Data_Source_Target = record
    _type: pchar;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Data_Source_Target = ^TEcore_Wl2_Event_Data_Source_Target;

  TEcore_Wl2_Event_Data_Source_Send = record
    _type: pchar;
    fd: longint;
    seat: dword;
    serial: uint32;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Data_Source_Send = ^TEcore_Wl2_Event_Data_Source_Send;

  TEcore_Wl2_Event_Seat_Selection = record
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Seat_Selection = ^TEcore_Wl2_Event_Seat_Selection;

  TEcore_Wl2_Event_Seat_Name = record
    name: PEina_Stringshare;
    id: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Seat_Name = ^TEcore_Wl2_Event_Seat_Name;

  TEcore_Wl2_Event_Seat_Capabilities = record
  end;
  PEcore_Wl2_Event_Seat_Capabilities = ^TEcore_Wl2_Event_Seat_Capabilities;

type
  PEcore_Wl2_Device_Type = ^TEcore_Wl2_Device_Type;
  TEcore_Wl2_Device_Type = longint;

const
  ECORE_WL2_DEVICE_TYPE_SEAT = 0;
  ECORE_WL2_DEVICE_TYPE_POINTER = 1;
  ECORE_WL2_DEVICE_TYPE_KEYBOARD = 2;
  ECORE_WL2_DEVICE_TYPE_TOUCH = 3;

type
  TEcore_Wl2_Event_Device = record
    dev: PEo;
    window: PEcore_Wl2_Window;
    seat_id: dword;
    _type: TEcore_Wl2_Device_Type;
  end;
  PEcore_Wl2_Event_Device = ^TEcore_Wl2_Event_Device;

  PEcore_Wl2_Selection_Type = ^TEcore_Wl2_Selection_Type;
  TEcore_Wl2_Selection_Type = longint;

const
  ECORE_WL2_SELECTION_CNP = 0;
  ECORE_WL2_SELECTION_DND = 1;

type
  PEcore_Wl2_Window_States = ^TEcore_Wl2_Window_States;
  TEcore_Wl2_Window_States = longint;

const
  ECORE_WL2_WINDOW_STATE_NONE = 0;
  ECORE_WL2_WINDOW_STATE_FULLSCREEN = 1 shl 0;
  ECORE_WL2_WINDOW_STATE_MAXIMIZED = 1 shl 1;

type
  TEcore_Wl2_Event_Window_Configure = record
    win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
    edges: dword;
    w: dword;
    h: dword;
    states: dword;
  end;
  PEcore_Wl2_Event_Window_Configure = ^TEcore_Wl2_Event_Window_Configure;

  TEcore_Wl2_Event_Window_Configure_Complete = record
    win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Configure_Complete = ^TEcore_Wl2_Event_Window_Configure_Complete;

  TEcore_Wl2_Event_Input_Keymap_Changed = record
    id: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Input_Keymap_Changed = ^TEcore_Wl2_Event_Input_Keymap_Changed;

  TEcore_Wl2_Event_Seat_Keymap_Changed = TEcore_Wl2_Event_Input_Keymap_Changed;
  PEcore_Wl2_Event_Seat_Keymap_Changed = ^TEcore_Wl2_Event_Seat_Keymap_Changed;

  TEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed = record
    id: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed = ^TEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed;

  TEcore_Wl2_Event_Sync_Done = record
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Sync_Done = ^TEcore_Wl2_Event_Sync_Done;

  TEcore_Wl2_Event_Offer_Data_Ready = record
    offer: PEcore_Wl2_Offer;
    data: pchar;
    len: longint;
    mimetype: pchar;
    seat: dword;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Offer_Data_Ready = ^TEcore_Wl2_Event_Offer_Data_Ready;

  TEcore_Wl2_Event_Output_Transform = record
    output: PEcore_Wl2_Output;
    transform: longint;
    old_transform: longint;
  end;
  PEcore_Wl2_Event_Output_Transform = ^TEcore_Wl2_Event_Output_Transform;

  PEcore_Wl2_Event_Window_Rotation = ^TEcore_Wl2_Event_Window_Rotation;
  TEcore_Wl2_Event_Window_Rotation = record
  end;

type
  TEcore_Wl2_Event_Window_Rotation_Change_Prepare = TEcore_Wl2_Event_Window_Rotation;
  TEcore_Wl2_Event_Window_Rotation_Change_Prepare_Done = TEcore_Wl2_Event_Window_Rotation;
  TEcore_Wl2_Event_Window_Rotation_Change_Request = TEcore_Wl2_Event_Window_Rotation;
  TEcore_Wl2_Event_Window_Rotation_Change_Done = TEcore_Wl2_Event_Window_Rotation;

  TEcore_Wl2_Event_Window_Show = record
    win: PEcore_Wl2_Window;
    parent_win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Show = ^TEcore_Wl2_Event_Window_Show;

  TEcore_Wl2_Event_Window_Hide = record
    win: PEcore_Wl2_Window;
    parent_win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Hide = ^TEcore_Wl2_Event_Window_Hide;

  TEcore_Wl2_Event_Window_Activate = record
    win: PEcore_Wl2_Window;
    parent_win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Activate = ^TEcore_Wl2_Event_Window_Activate;

  TEcore_Wl2_Event_Window_Deactivate = record
    win: PEcore_Wl2_Window;
    parent_win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Deactivate = ^TEcore_Wl2_Event_Window_Deactivate;

  TEcore_Wl2_Event_Window_Common = record
    win: PEcore_Wl2_Window;
    parent_win: PEcore_Wl2_Window;
    event_win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Common = ^TEcore_Wl2_Event_Window_Common;

  TEcore_Wl2_Event_Window_Iconify_State_Change = record
    win: PEcore_Wl2_Window;
    iconified: dword;
    force: dword;
  end;
  PEcore_Wl2_Event_Window_Iconify_State_Change = ^TEcore_Wl2_Event_Window_Iconify_State_Change;

  PEcore_Wl2_Window_Type = ^TEcore_Wl2_Window_Type;
  TEcore_Wl2_Window_Type = longint;

const
  ECORE_WL2_WINDOW_TYPE_NONE = 0;
  ECORE_WL2_WINDOW_TYPE_TOPLEVEL = 1;
  ECORE_WL2_WINDOW_TYPE_MENU = 2;
  ECORE_WL2_WINDOW_TYPE_DND = 3;
  ECORE_WL2_WINDOW_TYPE_CUSTOM = 4;
  ECORE_WL2_WINDOW_TYPE_NOTIFICATION = 5;
  ECORE_WL2_WINDOW_TYPE_UTILITY = 6;
  ECORE_WL2_WINDOW_TYPE_DIALOG = 7;
  ECORE_WL2_WINDOW_TYPE_DOCK = 8;
  ECORE_WL2_WINDOW_TYPE_SPLASH = 9;
  ECORE_WL2_WINDOW_TYPE_LAST = 10;

type
  TEcore_Wl2_Event_Aux_Hint_Allowed = record
    win: PEcore_Wl2_Window;
    id: longint;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Aux_Hint_Allowed = ^TEcore_Wl2_Event_Aux_Hint_Allowed;

  TEcore_Wl2_Event_Aux_Hint_Supported = record
    win: PEcore_Wl2_Window;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Aux_Hint_Supported = ^TEcore_Wl2_Event_Aux_Hint_Supported;

  TEcore_Wl2_Event_Aux_Message = record
    win: PEcore_Wl2_Window;
    key: PEina_Stringshare;
    val: PEina_Stringshare;
    options: PEina_List;
    display: PEcore_Wl2_Display;
  end;
  PEcore_Wl2_Event_Aux_Message = ^TEcore_Wl2_Event_Aux_Message;

  TEcore_Wl2_Event_Window_Offscreen = record
    win: PEcore_Wl2_Window;
  end;
  PEcore_Wl2_Event_Window_Offscreen = ^TEcore_Wl2_Event_Window_Offscreen;

  PEcore_Wl2_Buffer_Type = ^TEcore_Wl2_Buffer_Type;
  TEcore_Wl2_Buffer_Type = longint;

const
  ECORE_WL2_BUFFER_NONE = 0;
  ECORE_WL2_BUFFER_SHM = 1;
  ECORE_WL2_BUFFER_DMABUF = 2;

type
  TEcore_Wl2_Bind_Cb = procedure(client: Pwl_client; data: pointer; version: uint32; id: uint32); cdecl;
  TEcore_Wl2_Unbind_Cb = procedure(resource: Pwl_resource); cdecl;
  TEcore_Wl2_Frame_Cb = procedure(win: PEcore_Wl2_Window; timestamp: uint32; data: pointer); cdecl;

  TEcore_Wl2_Frame_Cb_Handle = record
  end;
  PEcore_Wl2_Frame_Cb_Handle = ^TEcore_Wl2_Frame_Cb_Handle;

var
  ECORE_WL2_EVENT_DISCONNECT: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_CONNECT: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_GLOBAL_ADDED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_GLOBAL_REMOVED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_FOCUS_IN: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_FOCUS_OUT: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DND_ENTER: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DND_LEAVE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DND_MOTION: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DND_DROP: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DND_END: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DATA_SOURCE_END: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DATA_SOURCE_DROP: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DATA_SOURCE_ACTION: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DATA_SOURCE_TARGET: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DATA_SOURCE_SEND: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_CONFIGURE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SYNC_DONE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_OFFER_DATA_READY: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SEAT_NAME_CHANGED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SEAT_CAPABILITIES_CHANGED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DEVICE_ADDED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_DEVICE_REMOVED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_CONFIGURE_COMPLETE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SEAT_KEYMAP_CHANGED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SEAT_KEYBOARD_REPEAT_CHANGED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_SEAT_SELECTION: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_OUTPUT_TRANSFORM: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_ROTATE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_AUX_HINT_ALLOWED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_AUX_HINT_SUPPORTED: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_AUX_MESSAGE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_SHOW: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_HIDE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_ACTIVATE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_DEACTIVATE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_ICONIFY_STATE_CHANGE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_OFFSCREEN: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_CREATE: longint; cvar;external libecore_wl2;
  ECORE_WL2_EVENT_WINDOW_DESTROY: longint; cvar;external libecore_wl2;

type
  TEcore_Wl2_Surface_Interface = record
    id: longint;
    version: longint;
    setup: function(win: PEcore_Wl2_Window): pointer; cdecl;
    destroy: procedure(surface: PEcore_Wl2_Surface; priv_data: pointer); cdecl;
    reconfigure: procedure(surface: PEcore_Wl2_Surface; priv_data: pointer; w: longint; h: longint; flags: uint32; alpha: TEina_Bool); cdecl;
    data_get: function(surface: PEcore_Wl2_Surface; priv_data: pointer; w: Plongint; h: Plongint): pointer; cdecl;
    assign: function(surface: PEcore_Wl2_Surface; priv_data: pointer): longint; cdecl;
    post: procedure(surface: PEcore_Wl2_Surface; priv_data: pointer; rects: PEina_Rectangle; count: dword); cdecl;
    flush: procedure(surface: PEcore_Wl2_Surface; priv_data: pointer; purge: TEina_Bool); cdecl;
  end;
  PEcore_Wl2_Surface_Interface = ^TEcore_Wl2_Surface_Interface;

function ecore_wl2_init: longint; cdecl; external libecore_wl2;
function ecore_wl2_shutdown: longint; cdecl; external libecore_wl2;
function ecore_wl2_display_create(name: pchar): PEcore_Wl2_Display; cdecl; external libecore_wl2;
procedure ecore_wl2_display_destroy(display: PEcore_Wl2_Display); cdecl; external libecore_wl2;
function ecore_wl2_display_connect(name: pchar): PEcore_Wl2_Display; cdecl; external libecore_wl2;
procedure ecore_wl2_display_disconnect(display: PEcore_Wl2_Display); cdecl; external libecore_wl2;
function ecore_wl2_display_get(display: PEcore_Wl2_Display): Pwl_display; cdecl; external libecore_wl2;
function ecore_wl2_display_shm_get(display: PEcore_Wl2_Display): Pwl_shm; cdecl; external libecore_wl2;
function ecore_wl2_display_dmabuf_get(display: PEcore_Wl2_Display): pointer; cdecl; external libecore_wl2;
function ecore_wl2_display_globals_get(display: PEcore_Wl2_Display): PEina_Iterator; cdecl; external libecore_wl2;
procedure ecore_wl2_display_screen_size_get(display: PEcore_Wl2_Display; w: Plongint; h: Plongint); cdecl; external libecore_wl2;
function ecore_wl2_display_inputs_get(display: PEcore_Wl2_Display): PEina_Iterator; cdecl; external libecore_wl2;
function ecore_wl2_display_input_find(display: PEcore_Wl2_Display; id: dword): PEcore_Wl2_Input; cdecl; external libecore_wl2;
function ecore_wl2_display_input_find_by_name(display: PEcore_Wl2_Display; name: pchar): PEcore_Wl2_Input; cdecl; external libecore_wl2;
function ecore_wl2_display_registry_get(display: PEcore_Wl2_Display): Pwl_registry; cdecl; external libecore_wl2;
function ecore_wl2_display_sync_is_done(display: PEcore_Wl2_Display): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_display_name_get(display: PEcore_Wl2_Display): pchar; cdecl; external libecore_wl2;
function ecore_wl2_display_window_find_by_surface(display: PEcore_Wl2_Display; surface: Pwl_surface): PEcore_Wl2_Window; cdecl; external libecore_wl2;
function ecore_wl2_connected_display_get(name: pchar): PEcore_Wl2_Display; cdecl; external libecore_wl2;
function ecore_wl2_display_compositor_get(display: PEcore_Wl2_Display): Pwl_compositor; cdecl; external libecore_wl2;
function ecore_wl2_window_new(display: PEcore_Wl2_Display; parent: PEcore_Wl2_Window; x: longint; y: longint; w: longint; h: longint): PEcore_Wl2_Window; cdecl; external libecore_wl2;

type
  wl2_close_func = procedure(data: pointer; win: PEcore_Wl2_Window); cdecl;

procedure ecore_wl2_window_close_callback_set(window: PEcore_Wl2_Window; cb: wl2_close_func; data: pointer); cdecl; external libecore_wl2;
function ecore_wl2_window_surface_get(window: PEcore_Wl2_Window): Pwl_surface; cdecl; external libecore_wl2;
function ecore_wl2_window_surface_id_get(window: PEcore_Wl2_Window): longint; cdecl; external libecore_wl2;
procedure ecore_wl2_window_aspect_set(window: PEcore_Wl2_Window; w: longint; h: longint; aspect: dword); cdecl; external libecore_wl2;
procedure ecore_wl2_window_aspect_get(window: PEcore_Wl2_Window; w: Plongint; h: Plongint; aspect: Pdword); cdecl; external libecore_wl2;
procedure ecore_wl2_window_show(window: PEcore_Wl2_Window); cdecl; external libecore_wl2;
procedure ecore_wl2_window_hide(window: PEcore_Wl2_Window); cdecl; external libecore_wl2;
procedure ecore_wl2_window_free(window: PEcore_Wl2_Window); cdecl; external libecore_wl2;
procedure ecore_wl2_window_move(window: PEcore_Wl2_Window; input: PEcore_Wl2_Input); cdecl; external libecore_wl2;
procedure ecore_wl2_window_resize(window: PEcore_Wl2_Window; input: PEcore_Wl2_Input; location: longint); cdecl; external libecore_wl2;
function ecore_wl2_window_alpha_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_alpha_set(window: PEcore_Wl2_Window; alpha: TEina_Bool); cdecl; external libecore_wl2;
procedure ecore_wl2_window_opaque_region_set(window: PEcore_Wl2_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_opaque_region_get(window: PEcore_Wl2_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_input_region_set(window: PEcore_Wl2_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_input_region_get(window: PEcore_Wl2_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_wl2;
function ecore_wl2_window_maximized_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_maximized_set(window: PEcore_Wl2_Window; maximized: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_fullscreen_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_fullscreen_set(window: PEcore_Wl2_Window; fullscreen: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_rotation_get(window: PEcore_Wl2_Window): longint; cdecl; external libecore_wl2;
procedure ecore_wl2_window_rotation_set(window: PEcore_Wl2_Window; rotation: longint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_title_set(window: PEcore_Wl2_Window; title: pchar); cdecl; external libecore_wl2;
function ecore_wl2_window_title_get(window: PEcore_Wl2_Window): pchar; cdecl; external libecore_wl2;
procedure ecore_wl2_window_class_set(window: PEcore_Wl2_Window; clas: pchar); cdecl; external libecore_wl2;
function ecore_wl2_window_class_get(window: PEcore_Wl2_Window): pchar; cdecl; external libecore_wl2;
procedure ecore_wl2_window_geometry_get(window: PEcore_Wl2_Window; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_geometry_set(window: PEcore_Wl2_Window; x: longint; y: longint; w: longint; h: longint); cdecl; external libecore_wl2;
procedure ecore_wl2_window_type_set(window: PEcore_Wl2_Window; _type: TEcore_Wl2_Window_Type); cdecl; external libecore_wl2;
function ecore_wl2_window_type_get(window: PEcore_Wl2_Window): TEcore_Wl2_Window_Type; cdecl; external libecore_wl2;
function ecore_wl2_window_output_find(window: PEcore_Wl2_Window): PEcore_Wl2_Output; cdecl; external libecore_wl2;
procedure ecore_wl2_window_wm_rotation_supported_set(window: PEcore_Wl2_Window; enabled: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_wm_rotation_supported_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_rotation_app_set(window: PEcore_Wl2_Window; set_: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_rotation_app_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_preferred_rotation_set(window: PEcore_Wl2_Window; rot: longint); cdecl; external libecore_wl2;
function ecore_wl2_window_preferred_rotation_get(window: PEcore_Wl2_Window): longint; cdecl; external libecore_wl2;
procedure ecore_wl2_window_available_rotations_set(window: PEcore_Wl2_Window; rots: Plongint; count: dword); cdecl; external libecore_wl2;
function ecore_wl2_window_available_rotations_get(window: PEcore_Wl2_Window; rots: PPlongint; count: Pdword): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_window_activated_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_popup_input_set(window: PEcore_Wl2_Window; input: PEcore_Wl2_Input); cdecl; external libecore_wl2;
function ecore_wl2_window_popup_input_get(window: PEcore_Wl2_Window): PEcore_Wl2_Input; cdecl; external libecore_wl2;
function ecore_wl2_window_shell_surface_exists(win: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_window_display_get(window: PEcore_Wl2_Window): PEcore_Wl2_Display; cdecl; external libecore_wl2;
procedure ecore_wl2_window_focus_skip_set(window: PEcore_Wl2_Window; focus_skip: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_focus_skip_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_role_set(window: PEcore_Wl2_Window; role: pchar); cdecl; external libecore_wl2;
function ecore_wl2_window_role_get(window: PEcore_Wl2_Window): pchar; cdecl; external libecore_wl2;
procedure ecore_wl2_window_floating_mode_set(window: PEcore_Wl2_Window; floating: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_floating_mode_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_window_surface_find(surface: Pwl_surface): PEcore_Wl2_Window; cdecl; external libecore_wl2;
function ecore_wl2_input_seat_get(input: PEcore_Wl2_Input): Pwl_seat; cdecl; external libecore_wl2;
function ecore_wl2_input_seat_capabilities_get(input: PEcore_Wl2_Input): TEcore_Wl2_Seat_Capabilities; cdecl; external libecore_wl2;
function ecore_wl2_input_seat_id_get(input: PEcore_Wl2_Input): dword; cdecl; external libecore_wl2;
function ecore_wl2_input_display_get(input: PEcore_Wl2_Input): PEcore_Wl2_Display; cdecl; external libecore_wl2;
function ecore_wl2_input_keymap_get(input: PEcore_Wl2_Input): Pxkb_keymap; cdecl; external libecore_wl2;
function ecore_wl2_input_name_get(input: PEcore_Wl2_Input): PEina_Stringshare; cdecl; external libecore_wl2;
function ecore_wl2_input_keyboard_repeat_get(input: PEcore_Wl2_Input; rate: Pdouble; delay: Pdouble): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_input_keyboard_repeat_set(input: PEcore_Wl2_Input; rate: double; delay: double): TEina_Bool; cdecl; external libecore_wl2;
function ecore_wl2_input_pointer_xy_get(input: PEcore_Wl2_Input; x: Plongint; y: Plongint): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_input_pointer_set(input: PEcore_Wl2_Input; surface: Pwl_surface; hot_x: longint; hot_y: longint); cdecl; external libecore_wl2;
procedure ecore_wl2_input_cursor_from_name_set(input: PEcore_Wl2_Input; cursor: pchar); cdecl; external libecore_wl2;
function ecore_wl2_input_default_input_get(ewd: PEcore_Wl2_Display): PEcore_Wl2_Input; cdecl; external libecore_wl2;
function ecore_wl2_output_dpi_get(output: PEcore_Wl2_Output): longint; cdecl; external libecore_wl2;
function ecore_wl2_output_transform_get(output: PEcore_Wl2_Output): longint; cdecl; external libecore_wl2;
function ecore_wl2_display_compositor_version_get(disp: PEcore_Wl2_Display): longint; cdecl; external libecore_wl2;
procedure ecore_wl2_session_recovery_disable; cdecl; external libecore_wl2;
procedure ecore_wl2_window_commit(window: PEcore_Wl2_Window; flush: TEina_Bool); cdecl; external libecore_wl2;
function ecore_wl2_window_frame_callback_add(window: PEcore_Wl2_Window; cb: TEcore_Wl2_Frame_Cb; data: pointer): PEcore_Wl2_Frame_Cb_Handle; cdecl; external libecore_wl2;
procedure ecore_wl2_window_frame_callback_del(handle: PEcore_Wl2_Frame_Cb_Handle); cdecl; external libecore_wl2;
procedure ecore_wl2_display_flush(display: PEcore_Wl2_Display); cdecl; external libecore_wl2;
function ecore_wl2_window_resizing_get(window: PEcore_Wl2_Window): TEina_Bool; cdecl; external libecore_wl2;
procedure ecore_wl2_window_update_begin(window: PEcore_Wl2_Window); cdecl; external libecore_wl2;
{$endif}

// === Konventiert am: 15-6-25 13:22:40 ===


implementation


end.
