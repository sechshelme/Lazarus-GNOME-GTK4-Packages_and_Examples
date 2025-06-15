
unit Ecore_Wl2;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Wl2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Wl2.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pchar  = ^char;
Pdouble  = ^double;
Pdword  = ^dword;
PEcore_Wl2_Buffer_Type  = ^Ecore_Wl2_Buffer_Type;
PEcore_Wl2_Device_Type  = ^Ecore_Wl2_Device_Type;
PEcore_Wl2_Display  = ^Ecore_Wl2_Display;
PEcore_Wl2_Drag_Action  = ^Ecore_Wl2_Drag_Action;
PEcore_Wl2_Event_Aux_Hint_Allowed  = ^Ecore_Wl2_Event_Aux_Hint_Allowed;
PEcore_Wl2_Event_Aux_Hint_Supported  = ^Ecore_Wl2_Event_Aux_Hint_Supported;
PEcore_Wl2_Event_Aux_Message  = ^Ecore_Wl2_Event_Aux_Message;
PEcore_Wl2_Event_Connection  = ^Ecore_Wl2_Event_Connection;
PEcore_Wl2_Event_Data_Source_End  = ^Ecore_Wl2_Event_Data_Source_End;
PEcore_Wl2_Event_Data_Source_Event  = ^Ecore_Wl2_Event_Data_Source_Event;
PEcore_Wl2_Event_Data_Source_Send  = ^Ecore_Wl2_Event_Data_Source_Send;
PEcore_Wl2_Event_Data_Source_Target  = ^Ecore_Wl2_Event_Data_Source_Target;
PEcore_Wl2_Event_Device  = ^Ecore_Wl2_Event_Device;
PEcore_Wl2_Event_Dnd_Drop  = ^Ecore_Wl2_Event_Dnd_Drop;
PEcore_Wl2_Event_Dnd_End  = ^Ecore_Wl2_Event_Dnd_End;
PEcore_Wl2_Event_Dnd_Enter  = ^Ecore_Wl2_Event_Dnd_Enter;
PEcore_Wl2_Event_Dnd_Leave  = ^Ecore_Wl2_Event_Dnd_Leave;
PEcore_Wl2_Event_Dnd_Motion  = ^Ecore_Wl2_Event_Dnd_Motion;
PEcore_Wl2_Event_Focus_In  = ^Ecore_Wl2_Event_Focus_In;
PEcore_Wl2_Event_Focus_Out  = ^Ecore_Wl2_Event_Focus_Out;
PEcore_Wl2_Event_Global  = ^Ecore_Wl2_Event_Global;
PEcore_Wl2_Event_Input_Keymap_Changed  = ^Ecore_Wl2_Event_Input_Keymap_Changed;
PEcore_Wl2_Event_Offer_Data_Ready  = ^Ecore_Wl2_Event_Offer_Data_Ready;
PEcore_Wl2_Event_Output_Transform  = ^Ecore_Wl2_Event_Output_Transform;
PEcore_Wl2_Event_Seat_Capabilities  = ^Ecore_Wl2_Event_Seat_Capabilities;
PEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed  = ^Ecore_Wl2_Event_Seat_Keyboard_Repeat_Changed;
PEcore_Wl2_Event_Seat_Keymap_Changed  = ^Ecore_Wl2_Event_Seat_Keymap_Changed;
PEcore_Wl2_Event_Seat_Name  = ^Ecore_Wl2_Event_Seat_Name;
PEcore_Wl2_Event_Seat_Selection  = ^Ecore_Wl2_Event_Seat_Selection;
PEcore_Wl2_Event_Sync_Done  = ^Ecore_Wl2_Event_Sync_Done;
PEcore_Wl2_Event_Window_Activate  = ^Ecore_Wl2_Event_Window_Activate;
PEcore_Wl2_Event_Window_Common  = ^Ecore_Wl2_Event_Window_Common;
PEcore_Wl2_Event_Window_Configure  = ^Ecore_Wl2_Event_Window_Configure;
PEcore_Wl2_Event_Window_Configure_Complete  = ^Ecore_Wl2_Event_Window_Configure_Complete;
PEcore_Wl2_Event_Window_Deactivate  = ^Ecore_Wl2_Event_Window_Deactivate;
PEcore_Wl2_Event_Window_Hide  = ^Ecore_Wl2_Event_Window_Hide;
PEcore_Wl2_Event_Window_Iconify_State_Change  = ^Ecore_Wl2_Event_Window_Iconify_State_Change;
PEcore_Wl2_Event_Window_Offscreen  = ^Ecore_Wl2_Event_Window_Offscreen;
PEcore_Wl2_Event_Window_Rotation  = ^Ecore_Wl2_Event_Window_Rotation;
PEcore_Wl2_Event_Window_Show  = ^Ecore_Wl2_Event_Window_Show;
PEcore_Wl2_Frame_Cb_Handle  = ^Ecore_Wl2_Frame_Cb_Handle;
PEcore_Wl2_Global  = ^Ecore_Wl2_Global;
PEcore_Wl2_Input  = ^Ecore_Wl2_Input;
PEcore_Wl2_Offer  = ^Ecore_Wl2_Offer;
PEcore_Wl2_Output  = ^Ecore_Wl2_Output;
PEcore_Wl2_Seat_Capabilities  = ^Ecore_Wl2_Seat_Capabilities;
PEcore_Wl2_Selection_Type  = ^Ecore_Wl2_Selection_Type;
PEcore_Wl2_Surface  = ^Ecore_Wl2_Surface;
PEcore_Wl2_Surface_Interface  = ^Ecore_Wl2_Surface_Interface;
PEcore_Wl2_Window  = ^Ecore_Wl2_Window;
PEcore_Wl2_Window_States  = ^Ecore_Wl2_Window_States;
PEcore_Wl2_Window_Type  = ^Ecore_Wl2_Window_Type;
PEina_Iterator  = ^Eina_Iterator;
PEina_List  = ^Eina_List;
PEina_Rectangle  = ^Eina_Rectangle;
PEina_Stringshare  = ^Eina_Stringshare;
PEo  = ^Eo;
Plongint  = ^longint;
Pwl_client  = ^wl_client;
Pwl_compositor  = ^wl_compositor;
Pwl_display  = ^wl_display;
Pwl_registry  = ^wl_registry;
Pwl_resource  = ^wl_resource;
Pwl_seat  = ^wl_seat;
Pwl_shm  = ^wl_shm;
Pwl_surface  = ^wl_surface;
Pxkb_keymap  = ^xkb_keymap;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_WL2_H_}
{$define _ECORE_WL2_H_}
{$include <Eina.h>}
{$include <Ecore.h>}
{$include <wayland-client.h>}
{$include <wayland-cursor.h>}
{$include <xkbcommon/xkbcommon.h>}
{$define WL_HIDE_DEPRECATED}
{$include <wayland-server.h>}
{ # ifdef __cplusplus  }
{ extern "C"   }
{ # endif  }
{$ifdef EFL_BETA_API_SUPPORT}

const
  ECORE_WL2_SURFACE_INTERFACE_VERSION = 1;  
type
{$ifndef _ECORE_WL2_WINDOW_PREDEF}
type
{$endif}
type
{ matches protocol values  }

  PEcore_Wl2_Drag_Action = ^TEcore_Wl2_Drag_Action;
  TEcore_Wl2_Drag_Action =  Longint;
  Const
    ECORE_WL2_DRAG_ACTION_NONE = 0;
    ECORE_WL2_DRAG_ACTION_COPY = 1;
    ECORE_WL2_DRAG_ACTION_MOVE = 2;
    ECORE_WL2_DRAG_ACTION_ASK = 4;
    ECORE_WL2_DRAG_ACTION_LAST = 5;
;
type
  PEcore_Wl2_Seat_Capabilities = ^TEcore_Wl2_Seat_Capabilities;
  TEcore_Wl2_Seat_Capabilities =  Longint;
  Const
    ECORE_WL2_SEAT_CAPABILITIES_NONE = 0;
    ECORE_WL2_SEAT_CAPABILITIES_POINTER = 1;
    ECORE_WL2_SEAT_CAPABILITIES_KEYBOARD = 2;
    ECORE_WL2_SEAT_CAPABILITIES_TOUCH = 4;
;
type
  PEcore_Wl2_Event_Connection = ^TEcore_Wl2_Event_Connection;
  TEcore_Wl2_Event_Connection = record
      display : PEcore_Wl2_Display;
    end;

  TEcore_Wl2_Event_Connection = TEcore_Wl2_Event_Connect;
  TEcore_Wl2_Event_Connection = TEcore_Wl2_Event_Disconnect;

  PEcore_Wl2_Global = ^TEcore_Wl2_Global;
  TEcore_Wl2_Global = record
      interface : PEina_Stringshare;
      id : dword;
      version : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Global = ^TEcore_Wl2_Event_Global;
  TEcore_Wl2_Event_Global = record
      display : PEcore_Wl2_Display;
      interface : PEina_Stringshare;
      id : dword;
      version : dword;
    end;
{The seat device }

  PEcore_Wl2_Event_Focus_In = ^TEcore_Wl2_Event_Focus_In;
  TEcore_Wl2_Event_Focus_In = record
      window : PEcore_Wl2_Window;
      timestamp : dword;
      dev : PEo;
      display : PEcore_Wl2_Display;
    end;
{The seat device }

  PEcore_Wl2_Event_Focus_Out = ^TEcore_Wl2_Event_Focus_Out;
  TEcore_Wl2_Event_Focus_Out = record
      window : PEcore_Wl2_Window;
      timestamp : dword;
      dev : PEo;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Dnd_Enter = ^TEcore_Wl2_Event_Dnd_Enter;
  TEcore_Wl2_Event_Dnd_Enter = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      offer : PEcore_Wl2_Offer;
      x : longint;
      y : longint;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Dnd_Leave = ^TEcore_Wl2_Event_Dnd_Leave;
  TEcore_Wl2_Event_Dnd_Leave = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      offer : PEcore_Wl2_Offer;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Dnd_Motion = ^TEcore_Wl2_Event_Dnd_Motion;
  TEcore_Wl2_Event_Dnd_Motion = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      offer : PEcore_Wl2_Offer;
      x : longint;
      y : longint;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Dnd_Drop = ^TEcore_Wl2_Event_Dnd_Drop;
  TEcore_Wl2_Event_Dnd_Drop = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      x : longint;
      y : longint;
      offer : PEcore_Wl2_Offer;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Dnd_End = ^TEcore_Wl2_Event_Dnd_End;
  TEcore_Wl2_Event_Dnd_End = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;
  PEcore_Wl2_Event_Data_Source_Event = ^TEcore_Wl2_Event_Data_Source_Event;
  TEcore_Wl2_Event_Data_Source_Event = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      action : TEcore_Wl2_Drag_Action;
      seat : dword;
      serial : Tuint32_t;
      display : PEcore_Wl2_Display;
    end;


  PEcore_Wl2_Event_Data_Source_End = ^TEcore_Wl2_Event_Data_Source_End;
  TEcore_Wl2_Event_Data_Source_End = record
      win : PEcore_Wl2_Window;
      source : PEcore_Wl2_Window;
      action : TEcore_Wl2_Drag_Action;
      seat : dword;
      serial : Tuint32_t;
      display : PEcore_Wl2_Display;
      cancelled : TEina_Bool;
    end;
  TEcore_Wl2_Event_Data_Source_Event = TEcore_Wl2_Event_Data_Source_Drop;
  TEcore_Wl2_Event_Data_Source_Event = TEcore_Wl2_Event_Data_Source_Action;

  PEcore_Wl2_Event_Data_Source_Target = ^TEcore_Wl2_Event_Data_Source_Target;
  TEcore_Wl2_Event_Data_Source_Target = record
      _type : Pchar;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Data_Source_Send = ^TEcore_Wl2_Event_Data_Source_Send;
  TEcore_Wl2_Event_Data_Source_Send = record
      _type : Pchar;
      fd : longint;
      seat : dword;
      serial : Tuint32_t;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Seat_Selection = ^TEcore_Wl2_Event_Seat_Selection;
  TEcore_Wl2_Event_Seat_Selection = record
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Seat_Name = ^TEcore_Wl2_Event_Seat_Name;
  TEcore_Wl2_Event_Seat_Name = record
      name : PEina_Stringshare;
      id : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Seat_Capabilities = ^TEcore_Wl2_Event_Seat_Capabilities;
  TEcore_Wl2_Event_Seat_Capabilities = record
      id : dword;
      flag0 : word;
      display : PEcore_Wl2_Display;
    end;

const
  bm__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled = $1;
  bp__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled = 0;
  bm__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled = $2;
  bp__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled = 1;
  bm__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled = $4;
  bp__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled = 2;

function pointer_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
procedure set_pointer_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __pointer_enabled : TEina_Bool);
function keyboard_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
procedure set_keyboard_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __keyboard_enabled : TEina_Bool);
function touch_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
procedure set_touch_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __touch_enabled : TEina_Bool);
type
  PEcore_Wl2_Device_Type = ^TEcore_Wl2_Device_Type;
  TEcore_Wl2_Device_Type =  Longint;
  Const
    ECORE_WL2_DEVICE_TYPE_SEAT = 0;
    ECORE_WL2_DEVICE_TYPE_POINTER = 1;
    ECORE_WL2_DEVICE_TYPE_KEYBOARD = 2;
    ECORE_WL2_DEVICE_TYPE_TOUCH = 3;
;
type
  PEcore_Wl2_Event_Device = ^TEcore_Wl2_Event_Device;
  TEcore_Wl2_Event_Device = record
      dev : PEo;
      window : PEcore_Wl2_Window;
      seat_id : dword;
      _type : TEcore_Wl2_Device_Type;
    end;

  PEcore_Wl2_Selection_Type = ^TEcore_Wl2_Selection_Type;
  TEcore_Wl2_Selection_Type =  Longint;
  Const
    ECORE_WL2_SELECTION_CNP = 0;
    ECORE_WL2_SELECTION_DND = 1;
;
type
  PEcore_Wl2_Window_States = ^TEcore_Wl2_Window_States;
  TEcore_Wl2_Window_States =  Longint;
  Const
    ECORE_WL2_WINDOW_STATE_NONE = 0;
    ECORE_WL2_WINDOW_STATE_FULLSCREEN = 1 shl 0;
    ECORE_WL2_WINDOW_STATE_MAXIMIZED = 1 shl 1;
;
type
  PEcore_Wl2_Event_Window_Configure = ^TEcore_Wl2_Event_Window_Configure;
  TEcore_Wl2_Event_Window_Configure = record
      win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
      edges : dword;
      w : dword;
      h : dword;
      states : dword;
    end;

  PEcore_Wl2_Event_Window_Configure_Complete = ^TEcore_Wl2_Event_Window_Configure_Complete;
  TEcore_Wl2_Event_Window_Configure_Complete = record
      win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Input_Keymap_Changed = ^TEcore_Wl2_Event_Input_Keymap_Changed;
  TEcore_Wl2_Event_Input_Keymap_Changed = record
      id : dword;
      display : PEcore_Wl2_Display;
    end;
  TEcore_Wl2_Event_Seat_Keymap_Changed = TEcore_Wl2_Event_Input_Keymap_Changed;
  PEcore_Wl2_Event_Seat_Keymap_Changed = ^TEcore_Wl2_Event_Seat_Keymap_Changed;

  PEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed = ^TEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed;
  TEcore_Wl2_Event_Seat_Keyboard_Repeat_Changed = record
      id : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Sync_Done = ^TEcore_Wl2_Event_Sync_Done;
  TEcore_Wl2_Event_Sync_Done = record
      display : PEcore_Wl2_Display;
    end;
(* Const before type ignored *)

  PEcore_Wl2_Event_Offer_Data_Ready = ^TEcore_Wl2_Event_Offer_Data_Ready;
  TEcore_Wl2_Event_Offer_Data_Ready = record
      offer : PEcore_Wl2_Offer;
      data : Pchar;
      len : longint;
      mimetype : Pchar;
      seat : dword;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Output_Transform = ^TEcore_Wl2_Event_Output_Transform;
  TEcore_Wl2_Event_Output_Transform = record
      output : PEcore_Wl2_Output;
      transform : longint;
      old_transform : longint;
    end;

  PEcore_Wl2_Event_Window_Rotation = ^TEcore_Wl2_Event_Window_Rotation;
  TEcore_Wl2_Event_Window_Rotation = record
      win : PEcore_Wl2_Window;
      rotation : longint;
      w : longint;
      h : longint;
      angle : longint;
      flag0 : word;
    end;

const
  bm__Ecore_Wl2_Event_Window_Rotation_resize = $1;
  bp__Ecore_Wl2_Event_Window_Rotation_resize = 0;

function resize(var a : _Ecore_Wl2_Event_Window_Rotation) : TEina_Bool;
procedure set_resize(var a : _Ecore_Wl2_Event_Window_Rotation; __resize : TEina_Bool);
type
  TEcore_Wl2_Event_Window_Rotation = TEcore_Wl2_Event_Window_Rotation_Change_Prepare;
  TEcore_Wl2_Event_Window_Rotation = TEcore_Wl2_Event_Window_Rotation_Change_Prepare_Done;
  TEcore_Wl2_Event_Window_Rotation = TEcore_Wl2_Event_Window_Rotation_Change_Request;
  TEcore_Wl2_Event_Window_Rotation = TEcore_Wl2_Event_Window_Rotation_Change_Done;

  PEcore_Wl2_Event_Window_Show = ^TEcore_Wl2_Event_Window_Show;
  TEcore_Wl2_Event_Window_Show = record
      win : PEcore_Wl2_Window;
      parent_win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Window_Hide = ^TEcore_Wl2_Event_Window_Hide;
  TEcore_Wl2_Event_Window_Hide = record
      win : PEcore_Wl2_Window;
      parent_win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Window_Activate = ^TEcore_Wl2_Event_Window_Activate;
  TEcore_Wl2_Event_Window_Activate = record
      win : PEcore_Wl2_Window;
      parent_win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Window_Deactivate = ^TEcore_Wl2_Event_Window_Deactivate;
  TEcore_Wl2_Event_Window_Deactivate = record
      win : PEcore_Wl2_Window;
      parent_win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Window_Common = ^TEcore_Wl2_Event_Window_Common;
  TEcore_Wl2_Event_Window_Common = record
      win : PEcore_Wl2_Window;
      parent_win : PEcore_Wl2_Window;
      event_win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Event_Window_Iconify_State_Change = ^TEcore_Wl2_Event_Window_Iconify_State_Change;
  TEcore_Wl2_Event_Window_Iconify_State_Change = record
      win : PEcore_Wl2_Window;
      iconified : dword;
      force : dword;
    end;
{* @since 1.20  }
{* @since 1.20  }
{* @since 1.20  }
{* @since 1.20  }
{* @since 1.20  }

  PEcore_Wl2_Window_Type = ^TEcore_Wl2_Window_Type;
  TEcore_Wl2_Window_Type =  Longint;
  Const
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
;
type
  PEcore_Wl2_Event_Aux_Hint_Allowed = ^TEcore_Wl2_Event_Aux_Hint_Allowed;
  TEcore_Wl2_Event_Aux_Hint_Allowed = record
      win : PEcore_Wl2_Window;
      id : longint;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Aux_Hint_Supported = ^TEcore_Wl2_Event_Aux_Hint_Supported;
  TEcore_Wl2_Event_Aux_Hint_Supported = record
      win : PEcore_Wl2_Window;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Aux_Message = ^TEcore_Wl2_Event_Aux_Message;
  TEcore_Wl2_Event_Aux_Message = record
      win : PEcore_Wl2_Window;
      key : PEina_Stringshare;
      val : PEina_Stringshare;
      options : PEina_List;
      display : PEcore_Wl2_Display;
    end;

  PEcore_Wl2_Event_Window_Offscreen = ^TEcore_Wl2_Event_Window_Offscreen;
  TEcore_Wl2_Event_Window_Offscreen = record
      win : PEcore_Wl2_Window;
    end;

  PEcore_Wl2_Buffer_Type = ^TEcore_Wl2_Buffer_Type;
  TEcore_Wl2_Buffer_Type = TEcore_Wl2_Buffer_Type;
  TEcore_Wl2_Buffer_Type =  Longint;
  Const
    ECORE_WL2_BUFFER_NONE = 0;
    ECORE_WL2_BUFFER_SHM = 1;
    ECORE_WL2_BUFFER_DMABUF = 2;

type

  TEcore_Wl2_Bind_Cb = procedure (client:Pwl_client; data:pointer; version:Tuint32_t; id:Tuint32_t);cdecl;

  TEcore_Wl2_Unbind_Cb = procedure (resource:Pwl_resource);cdecl;

  TEcore_Wl2_Frame_Cb = procedure (win:PEcore_Wl2_Window; timestamp:Tuint32_t; data:pointer);cdecl;
  var
    ECORE_WL2_EVENT_DISCONNECT : longint;cvar;external;
{* @since 1.18  }
    ECORE_WL2_EVENT_CONNECT : longint;cvar;external;
{* @since 1.18  }
    ECORE_WL2_EVENT_GLOBAL_ADDED : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_GLOBAL_REMOVED : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_FOCUS_IN : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_FOCUS_OUT : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DND_ENTER : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DND_LEAVE : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DND_MOTION : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DND_DROP : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DND_END : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DATA_SOURCE_END : longint;cvar;external;
{* @since 1.18  }
    ECORE_WL2_EVENT_DATA_SOURCE_DROP : longint;cvar;external;
{* @since 1.18  }
    ECORE_WL2_EVENT_DATA_SOURCE_ACTION : longint;cvar;external;
{* @since 1.18  }
    ECORE_WL2_EVENT_DATA_SOURCE_TARGET : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_DATA_SOURCE_SEND : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_WINDOW_CONFIGURE : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_SYNC_DONE : longint;cvar;external;
{* @since 1.17  }
    ECORE_WL2_EVENT_OFFER_DATA_READY : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_SEAT_NAME_CHANGED : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_SEAT_CAPABILITIES_CHANGED : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_DEVICE_ADDED : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_DEVICE_REMOVED : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_WINDOW_CONFIGURE_COMPLETE : longint;cvar;external;
{* @since 1.19  }
    ECORE_WL2_EVENT_SEAT_KEYMAP_CHANGED : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_SEAT_KEYBOARD_REPEAT_CHANGED : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_SEAT_SELECTION : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_OUTPUT_TRANSFORM : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_ROTATE : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_AUX_HINT_ALLOWED : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_AUX_HINT_SUPPORTED : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_AUX_MESSAGE : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_SHOW : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_HIDE : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_ACTIVATE : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_DEACTIVATE : longint;cvar;external;
{* @since 1.20  }
    ECORE_WL2_EVENT_WINDOW_ICONIFY_STATE_CHANGE : longint;cvar;external;
{* @since 1.21  }
    ECORE_WL2_EVENT_WINDOW_OFFSCREEN : longint;cvar;external;
{* @since 1.21  }
    ECORE_WL2_EVENT_WINDOW_CREATE : longint;cvar;external;
{* @since 1.25  }
    ECORE_WL2_EVENT_WINDOW_DESTROY : longint;cvar;external;
{* @since 1.25  }
type
  PEcore_Wl2_Surface_Interface = ^TEcore_Wl2_Surface_Interface;
  TEcore_Wl2_Surface_Interface = record
      id : longint;
      version : longint;
      setup : function (win:PEcore_Wl2_Window):pointer;cdecl;
      destroy : procedure (surface:PEcore_Wl2_Surface; priv_data:pointer);cdecl;
      reconfigure : procedure (surface:PEcore_Wl2_Surface; priv_data:pointer; w:longint; h:longint; flags:Tuint32_t; 
                    alpha:TEina_Bool);cdecl;
      data_get : function (surface:PEcore_Wl2_Surface; priv_data:pointer; w:Plongint; h:Plongint):pointer;cdecl;
      assign : function (surface:PEcore_Wl2_Surface; priv_data:pointer):longint;cdecl;
      post : procedure (surface:PEcore_Wl2_Surface; priv_data:pointer; rects:PEina_Rectangle; count:dword);cdecl;
      flush : procedure (surface:PEcore_Wl2_Surface; priv_data:pointer; purge:TEina_Bool);cdecl;
    end;
{*
 * @file
 * @brief Ecore functions for dealing with the Wayland display protocol
 *
 * @defgroup Ecore_Wl2_Group Ecore_Wl2 - Wayland integration
 * @ingroup Ecore
 *
 * Ecore_Wl2 provides a wrapper and convenience functions for using the
 * Wayland protocol in implementing a window system. Function groups for
 * this part of the library include the following:
 *
 * @li @ref Ecore_Wl2_Init_Group
 * @li @ref Ecore_Wl2_Display_Group
 * @li @ref Ecore_Wl2_Window_Group
 * @li @ref Ecore_Wl2_Output_Group
 * @li @ref Ecore_Wl2_Input_Group
  }
{*
 * @defgroup Ecore_Wl2_Init_Group Wayland Library Init and Shutdown Functions
 * @ingroup Ecore_Wl2_Group
 *
 * Functions that start and shutdown the Ecore Wl2 Library.
  }
{*
 * Initialize the Ecore_Wl2 library
 *
 * @return  The number of times the library has been initialized without being
 *          shutdown. 0 is returned if an error occurs.
 *
 * @ingroup Ecore_Wl2_Init_Group
 * @since 1.17
  }

function ecore_wl2_init:longint;cdecl;external;
{*
 * Shutdown the Ecore_Wl2 Library
 *
 * @return  The number of times the library has been initialized without
 *          being shutdown.
 *
 * @ingroup Ecore_Wl2_Init_Group
 * @since 1.17
  }
function ecore_wl2_shutdown:longint;cdecl;external;
{*
 * @defgroup Ecore_Wl2_Display_Group Wayland Library Display Functions
 * @ingroup Ecore_Wl2_Group
 *
 * Functions that deal with creating, connecting, or interacting with
 * Wayland displays
  }
{*
 * Create a new Wayland display
 *
 * @brief This function is typically used to create a new display for
 * use with compositors, or to create a new display for use in nested
 * compositors.
 *
 * @param name The display target name to create. If @c NULL, a default
 *             display name will be assigned.
 * @return The newly created Ecore_Wl2_Display
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
(* Const before type ignored *)
function ecore_wl2_display_create(name:Pchar):PEcore_Wl2_Display;cdecl;external;
{*
 * Destroy an existing Wayland display
 *
 * @brief This function is typically used by servers to terminate an
 * existing Wayland display.
 *
 * @param display The display to terminate
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
procedure ecore_wl2_display_destroy(display:PEcore_Wl2_Display);cdecl;external;
{*
 * Connect to an existing Wayland display
 *
 * @brief This function is typically used by clients to connect to an
 * existing Wayland display.
 *
 * @param name The display target name to connect to. If @c NULL, the default
 *             display is assumed.
 *
 * @return The Ecore_Wl2_Display which was connected to
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
(* Const before type ignored *)
function ecore_wl2_display_connect(name:Pchar):PEcore_Wl2_Display;cdecl;external;
{*
 * Disconnect an existing Wayland display
 *
 * @brief This function is typically used by clients to disconnect from an
 * existing Wayland display.
 *
 * @param display The display to disconnect from
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
procedure ecore_wl2_display_disconnect(display:PEcore_Wl2_Display);cdecl;external;
{*
 * Retrieve the existing Wayland display
 *
 * @param display The Ecore_Wl2_Display for which to retrieve the existing
 *                Wayland display from
 *
 * @return The wl_display which this Ecore_Wl2_Display is using
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
function ecore_wl2_display_get(display:PEcore_Wl2_Display):Pwl_display;cdecl;external;
{*
 * Retrieve the wl_shm from a given Ecore_Wl2_Display
 *
 * @param display The Ecore_Wl2_Display for which to retrieve the existing
 *                Wayland shm interface from
 *
 * @return The wl_shm which this Ecore_Wl2_Display is using
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
function ecore_wl2_display_shm_get(display:PEcore_Wl2_Display):Pwl_shm;cdecl;external;
{*
 * Retrieve the wl_dmabuf from a given Ecore_Wl2_Display
 *
 *
 * @param display The Ecore_Wl2_Display for which to retrieve the existing
 *                Wayland dmabuf interface from
 *
 * @return The wl_dmabuf which this Ecore_Wl2_Display is using
 *
 * @ingroup Ecore_Wl2_Display_Group
 *
 * @note This is intended for client use only and should be used only
 *       after ecore_wl2_display_connect().  Also, the return type is
 *       void * instead of zpw_linux_dmabuf_v1 * since we don't want
 *       to change our public API every time the version changes in
 *       wayland-protocols.
 *
 * @since 1.18
  }
function ecore_wl2_display_dmabuf_get(display:PEcore_Wl2_Display):pointer;cdecl;external;
{*
 * Return an Eina_Iterator that can be used to iterate through globals
 *
 * @param display The Ecore_Wl2_Display for which to return a global iterator
 *
 * @note The caller of this function should free the returned Eina_Iterator
 * when finished with it.
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
function ecore_wl2_display_globals_get(display:PEcore_Wl2_Display):PEina_Iterator;cdecl;external;
{*
 * Retrieves the size of the current screen.
 *
 * @param display The display to get the screen size of
 * @param w where to return the width. May be NULL. Returns 0 on error.
 * @param h where to return the height. May be NULL. Returns 0 on error.
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
procedure ecore_wl2_display_screen_size_get(display:PEcore_Wl2_Display; w:Plongint; h:Plongint);cdecl;external;
{*
 * Get all the Ecore_Wl2_Input from the display.
 *
 * @param display The display
 *
 * @return A Eina_Iterator of Ecore_Wl2_Input or @c NULL on error
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.19
  }
function ecore_wl2_display_inputs_get(display:PEcore_Wl2_Display):PEina_Iterator;cdecl;external;
{*
 * Find a seat for a given display object using the seat id
 *
 * @param display The display
 * @param id The seat id
 *
 * @return The corresponding Ecore_Wl2_Input object or @c NULL if no match is found
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_display_input_find(display:PEcore_Wl2_Display; id:dword):PEcore_Wl2_Input;cdecl;external;
{*
 * Find a seat for a given display object using the seat id
 *
 * @param display The display
 * @param name The seat name
 *
 * @return The corresponding Ecore_Wl2_Input object or @c NULL if no match is found
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_wl2_display_input_find_by_name(display:PEcore_Wl2_Display; name:Pchar):PEcore_Wl2_Input;cdecl;external;
{*
 * Retrieves the Wayland Registry used for the current Wayland display.
 *
 * @param display The display to get the registry of
 *
 * @return The current wayland registry, or NULL on error
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
function ecore_wl2_display_registry_get(display:PEcore_Wl2_Display):Pwl_registry;cdecl;external;
{*
 * Check if the display has performed a sync
 *
 * @param display The display
 *
 * @return True if the display sync has occurred
 * @see ECORE_WL2_EVENT_SYNC_DONE
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_display_sync_is_done(display:PEcore_Wl2_Display):TEina_Bool;cdecl;external;
{*
 * Get the name of the display object
 *
 * @param display The display
 *
 * @return The name of the display object
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
function ecore_wl2_display_name_get(display:PEcore_Wl2_Display):Pchar;cdecl;external;
{*
 * Finds an Ecore_Wl2_Window based on wl_surface
 *
 * @param display The display to search for the window
 * @param surface The wl_surface of the window to find
 *
 * @return The Ecore_Wl2_Window if found, or NULL if no such window exists
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.24
  }
function ecore_wl2_display_window_find_by_surface(display:PEcore_Wl2_Display; surface:Pwl_surface):PEcore_Wl2_Window;cdecl;external;
{*
 * Gets the connected display object
 *
 * @brief This function is typically used by clients to get an
 *        existing Wayland display.
 *
 * @param name The display target name. If @c NULL, the default
 *        display is assumed.
 *
 * @return The Ecore_Wl2_Display which was connected to
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.24
  }
(* Const before type ignored *)
function ecore_wl2_connected_display_get(name:Pchar):PEcore_Wl2_Display;cdecl;external;
{*
 * Gets the wl_compositor which belongs to this display
 *
 * @param display The Ecore_Wl2_Display to get the compositor of
 *
 * @return The wl_compositor associated with this display
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.24
  }
function ecore_wl2_display_compositor_get(display:PEcore_Wl2_Display):Pwl_compositor;cdecl;external;
{*
 * @defgroup Ecore_Wl2_Window_Group Wayland Library Window Functions
 * @ingroup Ecore_Wl2_Group
 *
 * Functions that deal with creating, destroying, or interacting with
 * Wayland windows
  }
{*
 * Create a new Ecore_Wl2_Window
 *
 * @param display The Ecore_Wl2_Display on which to create this new window
 * @param parent The Ecore_Wl2_Window which is the parent of this window
 * @param x Initial x position of window
 * @param y Initial y position of window
 * @param w Initial width of window
 * @param h Initial height of window
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_new(display:PEcore_Wl2_Display; parent:PEcore_Wl2_Window; x:longint; y:longint; w:longint; 
           h:longint):PEcore_Wl2_Window;cdecl;external;
{*
 * Set a callback to be caleld just before the window is closed and freed
 *
 * @param window The window to listen to for a xdg toplevel close callback
 * @param cb The callback function to call being passed data and window
 * @param data The Data pointer to pass as data to the callback
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
procedure ecore_wl2_window_close_callback_set(window:PEcore_Wl2_Window; cb:procedure (data:pointer; win:PEcore_Wl2_Window); data:pointer);cdecl;external;
{*
 * Get the wl_surface which belongs to this window
 *
 * @param window The Ecore_Wl2_Window to get the surface of
 *
 * @return The wl_surface associated with this window.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_surface_get(window:PEcore_Wl2_Window):Pwl_surface;cdecl;external;
{*
 * Get the id of a given Ecore_Wl2_Window
 *
 * @param window The window to return the id of
 *
 * @return The id of the given window, or -1 on failure
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_surface_id_get(window:PEcore_Wl2_Window):longint;cdecl;external;
{*
 * @see evas_object_size_hint_aspect_set
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.21
  }
procedure ecore_wl2_window_aspect_set(window:PEcore_Wl2_Window; w:longint; h:longint; aspect:dword);cdecl;external;
{*
 * @see evas_object_size_hint_aspect_get
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
procedure ecore_wl2_window_aspect_get(window:PEcore_Wl2_Window; w:Plongint; h:Plongint; aspect:Pdword);cdecl;external;
{*
 * Show a given Ecore_Wl2_Window
 *
 * @param window The Ecore_Wl2_Window to show
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_show(window:PEcore_Wl2_Window);cdecl;external;
{*
 * Hide a given Ecore_Wl2_Window
 *
 * @param window The Ecore_Wl2_Window to hide
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_hide(window:PEcore_Wl2_Window);cdecl;external;
{*
 * Free a given Ecore_Wl2_Window
 *
 * @param window The Ecore_Wl2_Window to free
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_free(window:PEcore_Wl2_Window);cdecl;external;
{*
 * @brief Begin moving a given Ecore_Wl2_Window
 *
 * @param window The Ecore_Wl2_Window which to move
 * @param input The seat on which the move is active on
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_move(window:PEcore_Wl2_Window; input:PEcore_Wl2_Input);cdecl;external;
{*
 * @brief Begin resizing a given window
 *
 * @param window The Ecore_Wl2_Window which to resize
 * @param input The seat on which the resize is active
 * @param location The edge of the window from which the resize should start
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_resize(window:PEcore_Wl2_Window; input:PEcore_Wl2_Input; location:longint);cdecl;external;
{*
 * Get if a given window is alpha
 *
 * @param window The window to get if is alpha
 *
 * @return EINA_TRUE if window is alpha, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_alpha_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set a given window's alpha property
 *
 * @param window The window on which to set the alpha property
 * @param alpha EINA_TRUE to set window as alpha, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_alpha_set(window:PEcore_Wl2_Window; alpha:TEina_Bool);cdecl;external;
{*
 * Set the opaque region of the Ecore_Wl2_Window
 *
 * @param window The window
 * @param x The left point of the region.
 * @param y The top point of the region.
 * @param w The width of the region.
 * @param h The height of the region.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_opaque_region_set(window:PEcore_Wl2_Window; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * Get the opaque region of the Ecore_Wl2_Window
 *
 * @param window The window
 * @param x The left point of the region.
 * @param y The top point of the region.
 * @param w The width of the region.
 * @param h The height of the region.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
procedure ecore_wl2_window_opaque_region_get(window:PEcore_Wl2_Window; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * Set the input region of the Ecore_Wl2_Window.
 *
 * To set an empty region, pass width and height as 0.
 *
 * An empty input region means the entire window surface will accept input.
 *
 * @param window The window to set the input region of
 * @param x The left point of the region.
 * @param y The top point of the region.
 * @param w The width of the region.
 * @param h The height of the region.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_input_region_set(window:PEcore_Wl2_Window; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * Get the input region of the Ecore_Wl2_Window.
 *
 * @param window The window to set the input region of
 * @param x The left point of the region.
 * @param y The top point of the region.
 * @param w The width of the region.
 * @param h The height of the region.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
procedure ecore_wl2_window_input_region_get(window:PEcore_Wl2_Window; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * Get if a given window is maximized
 *
 * @param window The window to get the maximized state of
 *
 * @return EINA_TRUE if window is maximized, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_maximized_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set the maximized state of a given window
 *
 * @param window The window to set the maximized state of
 * @param maximized EINA_TRUE to set maximized, EINA_FALSE to unset
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_maximized_set(window:PEcore_Wl2_Window; maximized:TEina_Bool);cdecl;external;
{*
 * Get if a given window is fullscreen
 *
 * @param window The window to get the fullscreen state of
 *
 * @return EINA_TRUE if window is fullscreen, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_fullscreen_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set the fullscreen state of a given window
 *
 * @param window The window to set the fullscreen state of
 * @param fullscreen EINA_TRUE to set fullscreen, EINA_FALSE to unset
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_fullscreen_set(window:PEcore_Wl2_Window; fullscreen:TEina_Bool);cdecl;external;
{*
 * Get if a given window is rotated
 *
 * @param window The window to get the rotation of
 *
 * @return The amount of rotation for this window, or -1 on failure
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
function ecore_wl2_window_rotation_get(window:PEcore_Wl2_Window):longint;cdecl;external;
{*
 * Set the rotation of a given window
 *
 * @param window The window to set the rotation of
 * @param rotation The amount of rotation
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_rotation_set(window:PEcore_Wl2_Window; rotation:longint);cdecl;external;
{*
 * Set the title of a given window
 *
 * @param window The window to set the title of
 * @param title The title of the window
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
(* Const before type ignored *)
procedure ecore_wl2_window_title_set(window:PEcore_Wl2_Window; title:Pchar);cdecl;external;
{*
 * Get the title of a given window
 *
 * @param window The window to set the title of
 *
 * @return A string if found, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
(* Const before type ignored *)
function ecore_wl2_window_title_get(window:PEcore_Wl2_Window):Pchar;cdecl;external;
{*
 * Set the class of a given window
 *
 * @param window The window to set the class of
 * @param clas The class of the window
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
(* Const before type ignored *)
procedure ecore_wl2_window_class_set(window:PEcore_Wl2_Window; clas:Pchar);cdecl;external;
{*
 * Get the class of a given window
 *
 * @param window The window to set the class of
 *
 * @return A string if found, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
(* Const before type ignored *)
function ecore_wl2_window_class_get(window:PEcore_Wl2_Window):Pchar;cdecl;external;
{*
 * Get the geometry of a given window
 *
 * @brief The window geometry returned here is the window geometry as
 * recognized by xdg_surface_set_window_geometry. As such, it represents the
 * "visible bounds" of a window from the user's perspective.
 *
 * @param window The window to get the geometry of
 * @param x The left point of the window geometry
 * @param y The top point of the window geometry
 * @param w The width of the window geometry
 * @param h The height of the window geometry
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_geometry_get(window:PEcore_Wl2_Window; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{*
 * Set the geometry of a given window
 *
 * @brief The window geometry referenced here is the window geometry as
 * recognized by xdg_surface_set_window_geometry. As such, it represents the
 * "visible bounds" of a window from the user's perspective.
 *
 * @param window The window to set the geometry of
 * @param x The left point of the window geometry
 * @param y The top point of the window geometry
 * @param w The width of the window geometry
 * @param h The height of the window geometry
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_geometry_set(window:PEcore_Wl2_Window; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * Set the type of a given window
 *
 * @param window The window to set the type of
 * @param type The Ecore_Wl2_Window_Type to set on the window
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
procedure ecore_wl2_window_type_set(window:PEcore_Wl2_Window; _type:TEcore_Wl2_Window_Type);cdecl;external;
{*
 * Get the type of a given window
 *
 * @see Ecore_Wl2_Window_Type
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
function ecore_wl2_window_type_get(window:PEcore_Wl2_Window):TEcore_Wl2_Window_Type;cdecl;external;
{*
 * Find the output that a given window is on
 *
 * @param window The window to find the output for
 *
 * @return An Ecore_Wl2_Output if found, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_output_find(window:PEcore_Wl2_Window):PEcore_Wl2_Output;cdecl;external;
{*
 * Set if window rotation is supported by the window manager
 *
 * @param window
 * @param enabled
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_wm_rotation_supported_set(window:PEcore_Wl2_Window; enabled:TEina_Bool);cdecl;external;
{*
 * Get if window rotation is supported by the window manager
 *
 * @param window
 *
 * @return EINA_TRUE if supported, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_wm_rotation_supported_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set if an application has set window rotation
 *
 * @param window
 * @param set
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_rotation_app_set(window:PEcore_Wl2_Window; set:TEina_Bool);cdecl;external;
{*
 * Get if an application has set window rotation
 *
 * @param window
 *
 * @return EINA_TRUE if set, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_rotation_app_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set preferred rotation on a given window
 *
 * @param window The window to set preferred rotation on
 * @param rot The value of the preferred rotation to set
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_preferred_rotation_set(window:PEcore_Wl2_Window; rot:longint);cdecl;external;
{*
 * Get preferred rotation for a given window
 *
 * @param window The window to get preferred rotation from
 *
 * @return Given windows preferred rotation
 *
 * @ingroup Ecore_Wl2_Window
 * @since 1.20
  }
function ecore_wl2_window_preferred_rotation_get(window:PEcore_Wl2_Window):longint;cdecl;external;
{*
 * Set a windows available rotations
 *
 * @param window
 * @param rots
 * @param count
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
(* Const before type ignored *)
procedure ecore_wl2_window_available_rotations_set(window:PEcore_Wl2_Window; rots:Plongint; count:dword);cdecl;external;
{*
 * Get a windows available rotations
 *
 * @param window
 * @param rots
 * @param count
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_available_rotations_get(window:PEcore_Wl2_Window; rots:PPlongint; count:Pdword):TEina_Bool;cdecl;external;
{*
 * @brief Get the activated state of a window
 *
 * @param window The window to get activated state from
 *
 * @return @c EINA_TRUE if activated
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_window_activated_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * @brief Set the seat for a popup window to be used with grab
 *
 * @param window The window
 * @param input The seat
 *
 * Use this function for desktop shell requests involving popup grabs which require
 * a seat for the grab.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_popup_input_set(window:PEcore_Wl2_Window; input:PEcore_Wl2_Input);cdecl;external;
{*
 * @brief Get the seat for a popup window to be used with grab
 *
 * @param window The window
 *
 * @return Returns Ecore_Wl2_Input if the window has an input.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
function ecore_wl2_window_popup_input_get(window:PEcore_Wl2_Window):PEcore_Wl2_Input;cdecl;external;
{*
 * Check if a window has a shell surface - without one it can't be visible.
 *
 * @param win The window to check
 *
 * @return Returns true if the window has an associated shell surface.
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.19
  }
function ecore_wl2_window_shell_surface_exists(win:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Get which display a given window is using
 *
 * @param window The window to get the display of
 *
 * @return The Ecore_Wl2_Display that this window is using, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.17
  }
(* Const before type ignored *)
function ecore_wl2_window_display_get(window:PEcore_Wl2_Window):PEcore_Wl2_Display;cdecl;external;
{*
 * Set if this window should ignore focus requests
 *
 * @param window The window to set ignore focus requests on
 * @param focus_skip EINA_TRUE if this window should skip focus requests, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_focus_skip_set(window:PEcore_Wl2_Window; focus_skip:TEina_Bool);cdecl;external;
{*
 * Get if this window ignores focus requests
 *
 * @param window The window to get the focus skip value from
 *
 * @return EINA_TRUE if a window should skip focus requests, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_focus_skip_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Set the role of a given window
 *
 * @param window
 * @param role
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
(* Const before type ignored *)
procedure ecore_wl2_window_role_set(window:PEcore_Wl2_Window; role:Pchar);cdecl;external;
{*
 * Get the role of a given window
 *
 * @param window The window to set the class role
 *
 * @return A string if found, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
(* Const before type ignored *)
function ecore_wl2_window_role_get(window:PEcore_Wl2_Window):Pchar;cdecl;external;
{*
 * Set if a given window is in floating mode
 *
 * @param window The window to set floating mode on
 * @param floating EINA_TRUE if this window should be in floating mode, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
procedure ecore_wl2_window_floating_mode_set(window:PEcore_Wl2_Window; floating:TEina_Bool);cdecl;external;
{*
 * Get if a given window is in floating mode
 *
 * @param window The window to get floating mode
 *
 * @return EINA_TRUE if floating, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.20
  }
function ecore_wl2_window_floating_mode_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Finds a window by surface
 *
 * @param surface The surface to find the window of
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.24
  }
function ecore_wl2_window_surface_find(surface:Pwl_surface):PEcore_Wl2_Window;cdecl;external;
{*
 * @defgroup Ecore_Wl2_Input_Group Wayland Library Input Functions
 * @ingroup Ecore_Wl2_Group
 *
 * Functions that deal with creating, destroying, or interacting with
 * Wayland Input
  }
{*
 * Get the wl_seat that an input is using
 *
 * @param input The Ecore_Wl2_Input to get the seat of
 *
 * @return The wl_seat of this input, or NULL otherwise
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.17
  }
function ecore_wl2_input_seat_get(input:PEcore_Wl2_Input):Pwl_seat;cdecl;external;
{*
 * Get the seat capabilities for a given input.
 *
 * @param input The input
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.19
  }
function ecore_wl2_input_seat_capabilities_get(input:PEcore_Wl2_Input):TEcore_Wl2_Seat_Capabilities;cdecl;external;
{*
 * Get the wayland's seat id from an input.
 *
 * @param input The input
 *
 * @return The seat id
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.19
  }
function ecore_wl2_input_seat_id_get(input:PEcore_Wl2_Input):dword;cdecl;external;
{*
 * Get the display object of an input
 *
 * @param input The input
 *
 * @return The display
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_input_display_get(input:PEcore_Wl2_Input):PEcore_Wl2_Display;cdecl;external;
{*
 * Get the xkb_keymap object of an input
 *
 * @param input The input
 *
 * @return The xkb_keymap object
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_input_keymap_get(input:PEcore_Wl2_Input):Pxkb_keymap;cdecl;external;
{*
 * Get the name of an input
 *
 * @param input The input
 *
 * @return The name
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
function ecore_wl2_input_name_get(input:PEcore_Wl2_Input):PEina_Stringshare;cdecl;external;
{*
 * Get the keyboard repeat rate and delay of an input
 *
 * @param input The input
 * @param rate Pointer to store the repeat rate (in seconds)
 * @param rate Pointer to store the repeat delay (in seconds)
 *
 * @return True if repeat is enabled
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_input_keyboard_repeat_get(input:PEcore_Wl2_Input; rate:Pdouble; delay:Pdouble):TEina_Bool;cdecl;external;
{*
 * Set the keyboard repeat rate and delay of an input
 * @param input The input
 * @param rate Pointer to store the repeat rate (in seconds)
 * @param rate Pointer to store the repeat delay (in seconds)
 * @return True if repeat is enabled
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.24
  }
function ecore_wl2_input_keyboard_repeat_set(input:PEcore_Wl2_Input; rate:Tdouble; delay:Tdouble):TEina_Bool;cdecl;external;
{*
 * Retrieves the mouse position of the seat
 *
 * @param input The seat
 * @param x where to return the horizontal position. May be NULL. Returns 0 on error.
 * @param y where to return the vertical position. May be NULL. Returns 0 on error.
 * @return @c EINA_TRUE if coords were successfully retrieved
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
(* Const before type ignored *)
function ecore_wl2_input_pointer_xy_get(input:PEcore_Wl2_Input; x:Plongint; y:Plongint):TEina_Bool;cdecl;external;
{*
 * Set a given wl_surface to use as the pointer on a seat
 *
 * @param input The seat to set this surface as the pointer on
 * @param surface The surface to use as the pointer
 * @param hot_x The x coordinate to use as the cursor hot spot
 * @param hot_y The y coordinate to use as the cursor hot spot
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
procedure ecore_wl2_input_pointer_set(input:PEcore_Wl2_Input; surface:Pwl_surface; hot_x:longint; hot_y:longint);cdecl;external;
{*
 * Set a specific cursor on a given seat
 *
 * @brief This function will try to find a matching cursor inside the existing
 * cursor theme and set the pointer for the specified seat to be
 * the specified cursor
 *
 * @param input The seat to set the cursor on
 * @param cursor The name of the cursor to try and set
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.20
  }
(* Const before type ignored *)
procedure ecore_wl2_input_cursor_from_name_set(input:PEcore_Wl2_Input; cursor:Pchar);cdecl;external;
{*
 * Gets default input of a given display
 *
 * @param ewd The display
 *
 * @ingroup Ecore_Wl2_Input_Group
 * @since 1.24
  }
(* Const before type ignored *)
function ecore_wl2_input_default_input_get(ewd:PEcore_Wl2_Display):PEcore_Wl2_Input;cdecl;external;
{*
 * @defgroup Ecore_Wl2_Output_Group Wayland Library Output Functions
 * @ingroup Ecore_Wl2_Group
 *
 * Functions that deal with creating, destroying, or interacting with
 * Wayland Outputs
  }
{*
 * Return the DPI of a given output
 *
 * This is a simplistic call to get DPI. It does not account for differing
 * DPI in the x and y axes nor does it account for multihead or xinerama and
 * xrandr where different parts of the screen may have different DPI etc.
 *
 * @param output The output to get the DPI of
 *
 * @return the general screen DPI (dots/pixels per inch).
 *
 * @ingroup Ecore_Wl2_Output_Group
 * @since 1.17
  }
function ecore_wl2_output_dpi_get(output:PEcore_Wl2_Output):longint;cdecl;external;
{*
 * Get the current transform of a given output
 *
 * @param output The output to get the transform of
 *
 * @return The output's current transform value
 *
 * @ingroup Ecore_Wl2_Output_Group
 * @since 1.20
  }
function ecore_wl2_output_transform_get(output:PEcore_Wl2_Output):longint;cdecl;external;
{*
 * Return the version of the display's compositor object
 *
 * @param disp the display to get the compositor object version from
 *
 * @return the version of the display's compositor object
 *
 * @ingroup Ecore_Wl2_Display_Group
 * @since 1.17
  }
function ecore_wl2_display_compositor_version_get(disp:PEcore_Wl2_Display):longint;cdecl;external;
{*
 * Disable session recovery for any further connections.  Must be called
 * before connecting.  This is irreversible and not intended for general
 * use.
 *
 * @since 1.19
  }
procedure ecore_wl2_session_recovery_disable;cdecl;external;
{*
 * Commit the surface of a wayland window.
 *
 * If flush is set this generates a wl_surface_commit(), otherwise it is
 * expected that some other call in the very near future (such as
 * eglSwapBuffers) will cause an implicit flush.
 *
 * A surface that has been commit will be in the "pending" state until
 * the compositor tells us it's time to draw again via a frame callback.
 *
 * @param window The window whose surface we want to commit
 * @param flush EINA_TRUE if we need to flush immediately.
 *
 * @since 1.21
  }
procedure ecore_wl2_window_commit(window:PEcore_Wl2_Window; flush:TEina_Bool);cdecl;external;
{*
 * Add a callback that fires when the window's surface_frame callback fires
 *
 * @param window The window to add a callback on
 * @param cb The callback
 * @param data User data to provide to the callback handler
 *
 * @since 1.21
  }
function ecore_wl2_window_frame_callback_add(window:PEcore_Wl2_Window; cb:TEcore_Wl2_Frame_Cb; data:pointer):PEcore_Wl2_Frame_Cb_Handle;cdecl;external;
{*
 * Delete a callback that fires when the window's surface_frame callback fires
 *
 * @param handle The callback handle obtained through ecore_wl2_window_frame_callback_add().
 *
 * @since 1.21
  }
procedure ecore_wl2_window_frame_callback_del(handle:PEcore_Wl2_Frame_Cb_Handle);cdecl;external;
{*
 * Push buffered wayland protocol to compositor
 *
 * Wayland protocol is only actually sent when a flush occurs,
 * so the display should be flushed at appropriate times, such
 * as after a commit.
 *
 * @param display The display to flush
 *
 * @since 1.21
  }
procedure ecore_wl2_display_flush(display:PEcore_Wl2_Display);cdecl;external;
{*
 * Get if a given window is resizing
 *
 * @param window The window to check for resizing
 *
 * @return EINA_TRUE if resizing, EINA_FALSE otherwise
 *
 * @ingroup Ecore_Wl2_Window_Group
 * @since 1.21
  }
function ecore_wl2_window_resizing_get(window:PEcore_Wl2_Window):TEina_Bool;cdecl;external;
{*
 * Latch window state at the start of an update
 *
 * When async render takes place we continue to dispatch wayland
 * events from the main loop. We need to defer any changes to
 * window state from those events until the update is complete.
 *
 * Events deferred during an update will automatically fire
 * immediately after the caller calls ecore_wl2_window_commit.
 *
 * @param window The window whose state we want to latch
 *
 * @since 1.21
  }
procedure ecore_wl2_window_update_begin(window:PEcore_Wl2_Window);cdecl;external;

implementation

function pointer_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
begin
  pointer_enabled:=(a.flag0 and bm__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled) shr bp__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled;
end;

procedure set_pointer_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __pointer_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__pointer_enabled shl bp__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled) and bm__Ecore_Wl2_Event_Seat_Capabilities_pointer_enabled);
end;

function keyboard_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
begin
  keyboard_enabled:=(a.flag0 and bm__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled) shr bp__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled;
end;

procedure set_keyboard_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __keyboard_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__keyboard_enabled shl bp__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled) and bm__Ecore_Wl2_Event_Seat_Capabilities_keyboard_enabled);
end;

function touch_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities) : TEina_Bool;
begin
  touch_enabled:=(a.flag0 and bm__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled) shr bp__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled;
end;

procedure set_touch_enabled(var a : _Ecore_Wl2_Event_Seat_Capabilities; __touch_enabled : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__touch_enabled shl bp__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled) and bm__Ecore_Wl2_Event_Seat_Capabilities_touch_enabled);
end;

function resize(var a : _Ecore_Wl2_Event_Window_Rotation) : TEina_Bool;
begin
  resize:=(a.flag0 and bm__Ecore_Wl2_Event_Window_Rotation_resize) shr bp__Ecore_Wl2_Event_Window_Rotation_resize;
end;

procedure set_resize(var a : _Ecore_Wl2_Event_Window_Rotation; __resize : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__resize shl bp__Ecore_Wl2_Event_Window_Rotation_resize) and bm__Ecore_Wl2_Event_Window_Rotation_resize);
end;


end.
