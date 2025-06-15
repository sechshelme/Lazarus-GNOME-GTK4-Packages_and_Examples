
unit Ecore_Input_Evas;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Input_Evas.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Input_Evas.h
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
PEvas  = ^Evas;
PEvas_Device  = ^Evas_Device;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_INPUT_EVAS_H}
{$define _ECORE_INPUT_EVAS_H}
{$include <Evas.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }
type

  TEcore_Event_Mouse_Move_Cb = procedure (window:pointer; x:longint; y:longint; timestamp:dword);cdecl;

  TEcore_Event_Multi_Move_Cb = procedure (window:pointer; device:longint; x:longint; y:longint; radius:Tdouble; 
                radius_x:Tdouble; radius_y:Tdouble; pressure:Tdouble; angle:Tdouble; mx:Tdouble; 
                my:Tdouble; timestamp:dword);cdecl;

  TEcore_Event_Multi_Down_Cb = procedure (window:pointer; device:longint; x:longint; y:longint; radius:Tdouble; 
                radius_x:Tdouble; radius_y:Tdouble; pressure:Tdouble; angle:Tdouble; mx:Tdouble; 
                my:Tdouble; flags:TEvas_Button_Flags; timestamp:dword);cdecl;

  TEcore_Event_Multi_Up_Cb = procedure (window:pointer; device:longint; x:longint; y:longint; radius:Tdouble; 
                radius_x:Tdouble; radius_y:Tdouble; pressure:Tdouble; angle:Tdouble; mx:Tdouble; 
                my:Tdouble; flags:TEvas_Button_Flags; timestamp:dword);cdecl;

function ecore_event_evas_init:longint;cdecl;external;
function ecore_event_evas_shutdown:longint;cdecl;external;
function ecore_event_evas_key_down(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_key_up(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_button_up(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_button_down(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_wheel(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_move(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_in(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_mouse_out(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
function ecore_event_evas_axis_update(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
{*< @since 1.13  }
function ecore_event_evas_mouse_button_cancel(data:pointer; _type:longint; event:pointer):TEina_Bool;cdecl;external;
{*< @since 1.15  }
procedure ecore_event_window_register(id:TEcore_Window; window:pointer; evas:PEvas; move_mouse:TEcore_Event_Mouse_Move_Cb; move_multi:TEcore_Event_Multi_Move_Cb; 
            down_multi:TEcore_Event_Multi_Down_Cb; up_multi:TEcore_Event_Multi_Up_Cb);cdecl;external;
procedure ecore_event_window_unregister(id:TEcore_Window);cdecl;external;
function ecore_event_window_match(id:TEcore_Window):pointer;cdecl;external;
procedure ecore_event_window_ignore_events(id:TEcore_Window; ignore_event:longint);cdecl;external;
procedure ecore_event_evas_modifier_lock_update(e:PEvas; modifiers:dword);cdecl;external;
procedure ecore_event_evas_seat_modifier_lock_update(e:PEvas; modifiers:dword; seat:PEvas_Device);cdecl;external;
{*< @since 1.19  }
{$ifdef ECORE_EVAS_INTERNAL}
(* Const before type ignored *)
type

  TEcore_Event_Direct_Input_Cb = function (window:pointer; _type:longint; info:pointer):TEina_Bool;cdecl;

procedure _ecore_event_window_direct_cb_set(id:TEcore_Window; fptr:TEcore_Event_Direct_Input_Cb);cdecl;external;
{$endif}

implementation


end.
