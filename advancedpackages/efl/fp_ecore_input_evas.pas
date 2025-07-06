unit fp_ecore_input_evas;

interface

uses
  efl, fp_eina, fp_evas, fp_ecore_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TEcore_Event_Mouse_Move_Cb = procedure(window: pointer; x: longint; y: longint; timestamp: dword); cdecl;
  TEcore_Event_Multi_Move_Cb = procedure(window: pointer; device: longint; x: longint; y: longint; radius: double; radius_x: double; radius_y: double; pressure: double; angle: double; mx: double; my: double; timestamp: dword); cdecl;
  TEcore_Event_Multi_Down_Cb = procedure(window: pointer; device: longint; x: longint; y: longint; radius: double; radius_x: double; radius_y: double; pressure: double; angle: double; mx: double; my: double; flags: TEvas_Button_Flags; timestamp: dword); cdecl;
  TEcore_Event_Multi_Up_Cb = procedure(window: pointer; device: longint; x: longint; y: longint; radius: double; radius_x: double; radius_y: double; pressure: double; angle: double; mx: double; my: double; flags: TEvas_Button_Flags; timestamp: dword); cdecl;

function ecore_event_evas_init: longint; cdecl; external libecore_input_evas;
function ecore_event_evas_shutdown: longint; cdecl; external libecore_input_evas;
function ecore_event_evas_key_down(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_key_up(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_button_up(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_button_down(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_wheel(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_move(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_in(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_out(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_axis_update(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
function ecore_event_evas_mouse_button_cancel(data: pointer; _type: longint; event: pointer): TEina_Bool; cdecl; external libecore_input_evas;
procedure ecore_event_window_register(id: TEcore_Window; window: pointer; evas: PEvas; move_mouse: TEcore_Event_Mouse_Move_Cb; move_multi: TEcore_Event_Multi_Move_Cb;
  down_multi: TEcore_Event_Multi_Down_Cb; up_multi: TEcore_Event_Multi_Up_Cb); cdecl; external libecore_input_evas;
procedure ecore_event_window_unregister(id: TEcore_Window); cdecl; external libecore_input_evas;
function ecore_event_window_match(id: TEcore_Window): pointer; cdecl; external libecore_input_evas;
procedure ecore_event_window_ignore_events(id: TEcore_Window; ignore_event: longint); cdecl; external libecore_input_evas;
procedure ecore_event_evas_modifier_lock_update(e: PEvas; modifiers: dword); cdecl; external libecore_input_evas;
procedure ecore_event_evas_seat_modifier_lock_update(e: PEvas; modifiers: dword; seat: PEvas_Device); cdecl; external libecore_input_evas;

type
  TEcore_Event_Direct_Input_Cb = function(window: pointer; _type: longint; info: pointer): TEina_Bool; cdecl;

procedure _ecore_event_window_direct_cb_set(id: TEcore_Window; fptr: TEcore_Event_Direct_Input_Cb); cdecl; external libecore_input_evas;

// === Konventiert am: 15-6-25 13:21:07 ===


implementation



end.
