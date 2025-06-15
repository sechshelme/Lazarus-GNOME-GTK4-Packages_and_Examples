
unit Elput;
interface

{
  Automatically converted by H2Pas 1.0.0 from Elput.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Elput.h
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
PEina_List  = ^Eina_List;
PEina_Stringshare  = ^Eina_Stringshare;
PElput_Device  = ^Elput_Device;
PElput_Device_Caps  = ^Elput_Device_Caps;
PElput_Device_Change_Type  = ^Elput_Device_Change_Type;
PElput_Event_Device_Change  = ^Elput_Event_Device_Change;
PElput_Event_Modifiers_Send  = ^Elput_Event_Modifiers_Send;
PElput_Event_Pointer_Motion  = ^Elput_Event_Pointer_Motion;
PElput_Event_Seat_Caps  = ^Elput_Event_Seat_Caps;
PElput_Event_Seat_Frame  = ^Elput_Event_Seat_Frame;
PElput_Event_Session_Active  = ^Elput_Event_Session_Active;
PElput_Event_Switch  = ^Elput_Event_Switch;
PElput_Manager  = ^Elput_Manager;
PElput_Seat  = ^Elput_Seat;
PElput_Swipe_Gesture  = ^Elput_Swipe_Gesture;
PElput_Switch_State  = ^Elput_Switch_State;
PElput_Switch_Type  = ^Elput_Switch_Type;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELPUT_H}
{$define _ELPUT_H}
{$ifdef EFL_BETA_API_SUPPORT}
{$include <Eina.h>}
{$ifdef extern}
{$undef extern}
{$endif}
type
  PElput_Device_Caps = ^TElput_Device_Caps;
  TElput_Device_Caps =  Longint;
  Const
    ELPUT_DEVICE_CAPS_POINTER = 1 shl 0;
    ELPUT_DEVICE_CAPS_KEYBOARD = 1 shl 1;
    ELPUT_DEVICE_CAPS_TOUCH = 1 shl 2;
    ELPUT_DEVICE_CAPS_TABLET_TOOL = 1 shl 3;
    ELPUT_DEVICE_CAPS_TABLET_PAD = 1 shl 4;
    ELPUT_DEVICE_CAPS_GESTURE = 1 shl 5;
    ELPUT_DEVICE_CAPS_SWITCH = 1 shl 6;
;
{ opaque structure to represent an input manager  }
type
{ opaque structure to represent an input seat  }
{ opaque structure to represent an input device  }
{ opaque structure to represent a keyboard  }
{ opaque structure to represent a mouse  }
{ opaque structure to represent a touch device  }
{ opaque structure to represent swipe data  }
{ structure to represent event for seat capability changes  }

  PElput_Event_Seat_Caps = ^TElput_Event_Seat_Caps;
  TElput_Event_Seat_Caps = record
      pointer_count : longint;
      keyboard_count : longint;
      touch_count : longint;
      seat : PElput_Seat;
    end;
{ structure to represent event for seat frame  }

  PElput_Event_Seat_Frame = ^TElput_Event_Seat_Frame;
  TElput_Event_Seat_Frame = record
      seat : PElput_Seat;
    end;
{ structure to represent event for seat modifiers changes  }

  PElput_Event_Modifiers_Send = ^TElput_Event_Modifiers_Send;
  TElput_Event_Modifiers_Send = record
      depressed : dword;
      latched : dword;
      locked : dword;
      group : dword;
    end;

  PElput_Device_Change_Type = ^TElput_Device_Change_Type;
  TElput_Device_Change_Type =  Longint;
  Const
    ELPUT_DEVICE_ADDED = 0;
    ELPUT_DEVICE_REMOVED = 1;
;
{ structure to represent event for device being added or removed  }
type
  PElput_Event_Device_Change = ^TElput_Event_Device_Change;
  TElput_Event_Device_Change = record
      device : PElput_Device;
      _type : TElput_Device_Change_Type;
    end;
{ structure to represent session active changes  }
(* Const before type ignored *)

  PElput_Event_Session_Active = ^TElput_Event_Session_Active;
  TElput_Event_Session_Active = record
      session : Pchar;
      flag0 : word;
    end;

const
  bm__Elput_Event_Session_Active_active = $1;
  bp__Elput_Event_Session_Active_active = 0;

function active(var a : _Elput_Event_Session_Active) : TEina_Bool;
procedure set_active(var a : _Elput_Event_Session_Active; __active : TEina_Bool);
{* @since 1.19  }
type
  PElput_Event_Pointer_Motion = ^TElput_Event_Pointer_Motion;
  TElput_Event_Pointer_Motion = record
      time_usec : Tuint64_t;
      dx : Tdouble;
      dy : Tdouble;
      dx_unaccel : Tdouble;
      dy_unaccel : Tdouble;
    end;
{* @since 1.21  }

  PElput_Switch_Type = ^TElput_Switch_Type;
  TElput_Switch_Type =  Longint;
  Const
    ELPUT_SWITCH_TYPE_LID = 1;
    ELPUT_SWITCH_TYPE_TABLET_MODE = 2;
;
{* @since 1.21  }
type
  PElput_Switch_State = ^TElput_Switch_State;
  TElput_Switch_State =  Longint;
  Const
    ELPUT_SWITCH_STATE_OFF = 0;
    ELPUT_SWITCH_STATE_ON = 1;
;
{* @since 1.21  }
type
  PElput_Event_Switch = ^TElput_Event_Switch;
  TElput_Event_Switch = record
      device : PElput_Device;
      time_usec : Tuint64_t;
      _type : TElput_Switch_Type;
      state : TElput_Switch_State;
    end;
  var
    ELPUT_EVENT_SEAT_CAPS : longint;cvar;external;
    ELPUT_EVENT_SEAT_FRAME : longint;cvar;external;
    ELPUT_EVENT_MODIFIERS_SEND : longint;cvar;external;
    ELPUT_EVENT_DEVICE_CHANGE : longint;cvar;external;
    ELPUT_EVENT_SESSION_ACTIVE : longint;cvar;external;
{* @since 1.19  }
    ELPUT_EVENT_POINTER_MOTION : longint;cvar;external;
{* @since 1.21  }
    ELPUT_EVENT_SWITCH : longint;cvar;external;
{*
 * @file
 * @brief Ecore functions for dealing with libinput
 *
 * @defgroup Elput_Group Elput - libinput integration
 * @ingroup Ecore
 *
 * Elput provides a wrapper and functions for using libinput
 *
 * @li @ref Elput_Init_Group
 * @li @ref Elput_Manager_Group
 * @li @ref Elput_Input_Group
 * @li @ref Elput_Touch_Group
 *
  }
{*
 * @defgroup Elput_Init_Group Library Init and Shutdown functions
 *
 * Functions that start and shutdown the Elput library
  }
{*
 * Initialize the Elput library
 *
 * @return The number of times the library has been initialized without being
 *         shutdown. 0 is returned if an error occurs.
 *
 * @ingroup Elput_Init_Group
 * @since 1.18
  }

function elput_init:longint;cdecl;external;
{*
 * Shutdown the Elput library
 *
 * @return The number of times the library has been initialized without being
 *         shutdown. 0 is returned if an error occurs.
 *
 * @ingroup Elput_Init_Group
 * @since 1.18
  }
function elput_shutdown:longint;cdecl;external;
{*
 * @defgroup Elput_Manager_Group Elput Manager
 *
 * Functions that deal with connecting, disconnecting, opening, closing
 * of input devices.
  }
{*
 * Create an input manager on the specified seat
 *
 * @param seat
 * @param tty
 *
 * @return A Elput_Manager on success, NULL on failure
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
(* Const before type ignored *)
function elput_manager_connect(seat:Pchar; tty:dword):PElput_Manager;cdecl;external;
{*
 * Create an input manager on the specified seat. Only gesture events are emitted. Nothing else.
 *
 * @param seat
 * @param tty
 *
 * @return A Elput_Manager on success, NULL on failure
 *
 * @ingroup Elput_Manager_Group
  }
(* Const before type ignored *)
function elput_manager_connect_gestures(seat:Pchar; tty:dword):PElput_Manager;cdecl;external;
{*
 * Disconnect an input manager
 *
 * @param manager
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
procedure elput_manager_disconnect(manager:PElput_Manager);cdecl;external;
{*
 * Request input manager to open a file
 *
 * @param manager
 * @param path
 * @param flags
 *
 * @return Filedescriptor of opened file or -1 on failure
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
(* Const before type ignored *)
function elput_manager_open(manager:PElput_Manager; path:Pchar; flags:longint):longint;cdecl;external;
{*
 * Request input manager to close a file
 *
 * @param manager
 * @param fd
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
procedure elput_manager_close(manager:PElput_Manager; fd:longint);cdecl;external;
{*
 * Request to switch to a given vt
 *
 * @param manager
 * @param vt
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
function elput_manager_vt_set(manager:PElput_Manager; vt:longint):TEina_Bool;cdecl;external;
{*
 * Get the list of seats from a manager
 *
 * @param manager
 *
 * @return An Eina_List of existing Elput_Seats or NULL on failure
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
(* Const before type ignored *)
function elput_manager_seats_get(manager:PElput_Manager):PEina_List;cdecl;external;
{*
 * Set which window to use for this input manager
 *
 * This function should be used to specify which window to set on the
 * input manager. Setting a window on the input manager is done so that
 * when we raise events (mouse movement, keyboard key, etc) then this
 * window is passed to the event structure as the window which the event
 * occurred on.
 *
 * @param manager
 * @param window
 *
 * @ingroup Elput_Manager_Group
 * @since 1.18
  }
procedure elput_manager_window_set(manager:PElput_Manager; window:dword);cdecl;external;
{*
 * @defgroup Elput_Input_Group Elput input functions
 *
 * Functions that deal with setup of inputs
  }
{*
 * Initialize input
 *
 * @param manager
 *
 * @return EINA_TRUE on success, EINA_FALSE on failure
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
function elput_input_init(manager:PElput_Manager):TEina_Bool;cdecl;external;
{*
 * Shutdown input
 *
 * @param manager
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
procedure elput_input_shutdown(manager:PElput_Manager);cdecl;external;
{*
 * Get the pointer position on a given seat
 *
 * @param manager
 * @param seat
 * @param x
 * @param y
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
(* Const before type ignored *)
procedure elput_input_pointer_xy_get(manager:PElput_Manager; seat:Pchar; x:Plongint; y:Plongint);cdecl;external;
{*
 * Set the pointer position on a given seat
 *
 * @param manager
 * @param seat
 * @param x
 * @param y
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
(* Const before type ignored *)
procedure elput_input_pointer_xy_set(manager:PElput_Manager; seat:Pchar; x:longint; y:longint);cdecl;external;
{*
 * Set the pointer left-handed mode
 *
 * @param manager
 * @param seat
 * @param left
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
(* Const before type ignored *)
function elput_input_pointer_left_handed_set(manager:PElput_Manager; seat:Pchar; left:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Set the maximum position of any existing mouse pointers
 *
 * @param manager
 * @param maxw
 * @param maxh
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
procedure elput_input_pointer_max_set(manager:PElput_Manager; maxw:longint; maxh:longint);cdecl;external;
{*
 * Set pointer value rotation
 *
 * @param manager
 * @param rotation
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Input_Group
 * @since 1.20
  }
function elput_input_pointer_rotation_set(manager:PElput_Manager; rotation:longint):TEina_Bool;cdecl;external;
{*
 * Set tap-to-click status
 *
 * @param manager
 * @param seat
 * @param enabled
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Input_Group
 * @since 1.22
  }
(* Const before type ignored *)
procedure elput_input_touch_tap_to_click_enabled_set(manager:PElput_Manager; seat:Pchar; enabled:TEina_Bool);cdecl;external;
{*
 * Calibrate input devices for given screen size
 *
 * @param manager
 * @param w
 * @param h
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
procedure elput_input_devices_calibrate(manager:PElput_Manager; w:longint; h:longint);cdecl;external;
{*
 * Enable key remap functionality
 *
 * @param manager
 * @param enable
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
function elput_input_key_remap_enable(manager:PElput_Manager; enable:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Set a given set of keys as remapped keys
 *
 * @param manager
 * @param from_keys
 * @param to_keys
 * @param num
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Input_Group
 * @since 1.18
  }
function elput_input_key_remap_set(manager:PElput_Manager; from_keys:Plongint; to_keys:Plongint; num:longint):TEina_Bool;cdecl;external;
{*
 * Set info to be used for keyboards
 *
 * @param manager
 * @param context
 * @param keymap
 * @param group
 *
 * @ingroup Elput_Input_Group
 * @since 1.20
  }
procedure elput_input_keyboard_info_set(manager:PElput_Manager; context:pointer; keymap:pointer; group:longint);cdecl;external;
{*
 * Set group layout to be used for keyboards
 *
 * @param manager
 * @param group
 *
 * @ingroup Elput_Input_Group
 * @since 1.20
  }
procedure elput_input_keyboard_group_set(manager:PElput_Manager; group:longint);cdecl;external;
{*
 * Set the pointer acceleration profile
 *
 * @param manager
 * @param seat
 * @param profile
 *
 * @ingroup Elput_Input_Group
 * @since 1.19
  }
(* Const before type ignored *)
procedure elput_input_pointer_accel_profile_set(manager:PElput_Manager; seat:Pchar; profile:Tuint32_t);cdecl;external;
{*
 * Set the pointer acceleration speed
 *
 * @param manager
 * @param seat
 * @param speed
 *
 * @ingroup Elput_Input_Group
 * @since 1.21
  }
(* Const before type ignored *)
procedure elput_input_pointer_accel_speed_set(manager:PElput_Manager; seat:Pchar; speed:Tdouble);cdecl;external;
{*
 * @defgroup Elput_Touch_Group Configuration of touch devices
 *
 * Functions related to configuration of touch devices
  }
{*
 * Enable or disable tap-and-drag on this device.
 *
 * When enabled, a single-finger tap immediately followed by a finger
 * down results in a button down event, subsequent finger motion thus
 * triggers a drag. The button is released on finger up.
 *
 * @param device
 * @param enabled
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_drag_enabled_set(device:PElput_Device; enabled:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get if tap-and-drag is enabled on this device.
 *
 * @param device
 *
 * @return EINA_TRUE if enabled, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_drag_enabled_get(device:PElput_Device):TEina_Bool;cdecl;external;
{*
 * Enable or disable drag-lock during tapping on a device.
 *
 * When enabled, a finger may be lifted and put back on the touchpad
 * within a timeout and the drag process continues. When disabled,
 * lifting the finger during a tap-and-drag will immediately stop the
 * drag.
 *
 * @param device
 * @param enabled
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_drag_lock_enabled_set(device:PElput_Device; enabled:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get if drag-lock is enabled on this device.
 *
 * @param device
 *
 * @return EINA_TRUE if enabled, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_drag_lock_enabled_get(device:PElput_Device):TEina_Bool;cdecl;external;
{*
 * Enable or disable touchpad dwt (disable-while-typing) feature.
 *
 * When enabled, the device will be disabled while typing and for a
 * short period after.
 *
 * @param device
 * @param enabled
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_dwt_enabled_set(device:PElput_Device; enabled:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get if touchpad dwt (disable-while-typing) is enabled.
 *
 * @param device
 *
 * @return EINA_TRUE if enabled, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_dwt_enabled_get(device:PElput_Device):TEina_Bool;cdecl;external;
{*
 * Set the scroll method used for this device.
 *
 * The scroll method defines when to generate scroll axis events instead
 * of pointer motion events.
 *
 * @param device
 * @param method
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_scroll_method_set(device:PElput_Device; method:longint):TEina_Bool;cdecl;external;
{*
 * Get the current scroll method set on a device
 *
 * @param device
 *
 * @return The current scroll method
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_scroll_method_get(device:PElput_Device):longint;cdecl;external;
{*
 * Set the button click method for a device.
 *
 * The button click method defines when to generate software emulated
 * buttons
 *
 * @param device
 * @param method
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_click_method_set(device:PElput_Device; method:longint):TEina_Bool;cdecl;external;
{*
 * Get the current button click method for a device
 *
 * @param device
 *
 * @return The current button click method
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_click_method_get(device:PElput_Device):longint;cdecl;external;
{*
 * Enable or disable tap-to-click on a given device
 *
 * @param device
 * @param enabled
 *
 * @return EINA_TRUE on success, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_tap_enabled_set(device:PElput_Device; enabled:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * Get if tap-to-click is enabled on a given device
 *
 * @param device
 *
 * @return EINA_TRUE if enabled, EINA_FALSE otherwise
 *
 * @ingroup Elput_Touch_Group
 * @since 1.19
  }
function elput_touch_tap_enabled_get(device:PElput_Device):TEina_Bool;cdecl;external;
{*
 * @defgroup Elput_Device_Group Elput device functions
 *
 * Functions for getting attributes of devices
  }
{*
 * Get the seat object for a device
 * @param dev
 * @return The seat
 * @ingroup Elput_Device_Group
 * @since 1.20
  }
(* Const before type ignored *)
function elput_device_seat_get(dev:PElput_Device):PElput_Seat;cdecl;external;
{*
 * Get the caps for a device
 * @param dev
 * @return The caps, 0 on failure
 * @ingroup Elput_Device_Group
 * @since 1.20
  }
(* Const before type ignored *)
function elput_device_caps_get(dev:PElput_Device):TElput_Device_Caps;cdecl;external;
{*
 * Return the output name associated with a given device
 *
 * @param device
 *
 * @return An Eina_Stringshare of the output name for this device, or NULL on error
 *
 * @ingroup Elput_Device_Group
 * @since 1.20
  }
function elput_device_output_name_get(device:PElput_Device):PEina_Stringshare;cdecl;external;
{*
 * @defgroup Elput_Seat_Group Elput seat functions
 *
 * Functions for getting attributes of seats
  }
{*
 * Get the list of devices on a given seat
 *
 * @param seat
 *
 * @return An immutable list of existing Elput_Devices on a given seat or NULL on failure
 *
 * @ingroup Elput_Seat_Group
 * @since 1.20
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elput_seat_devices_get(seat:PElput_Seat):PEina_List;cdecl;external;
{*
 * Get the name of a given seat
 *
 * @param seat
 *
 * @return The name
 *
 * @ingroup Elput_Seat_Group
 * @since 1.20
  }
(* Const before type ignored *)
function elput_seat_name_get(seat:PElput_Seat):PEina_Stringshare;cdecl;external;
{*
 * Get the manager of a given seat
 *
 * @param seat
 *
 * @return The Elput_Manager
 *
 * @ingroup Elput_Seat_Group
 * @since 1.20
  }
(* Const before type ignored *)
function elput_seat_manager_get(seat:PElput_Seat):PElput_Manager;cdecl;external;
{*
 * @defgroup Elput_Gestures Elput gesture accessors
 *
 * Functions for accessing details of gesture events.
 * The structure pointers can only be accessed within the events that emit them.
  }
{*
 * A swipe gesture has began.
 * ELPUT_EVENT_SWIPE_UPDATE and finally a single ELPUT_EVENT_SWIPE_END event will be emitted.
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
  var
    ELPUT_EVENT_SWIPE_BEGIN : longint;cvar;external;
{*
 * There is a change to a ongoing swipe gesture.
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
    ELPUT_EVENT_SWIPE_UPDATE : longint;cvar;external;
{*
 * A ongoing swipe gesture has ended.
 * This ends the lifetime of this gesture.
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
    ELPUT_EVENT_SWIPE_END : longint;cvar;external;
{*
 * Get the difference of x position from the last event to this event.
 *
 * @param gesture The event, if NULL 0 is returned
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }

function elput_swipe_dx_get(gesture:PElput_Swipe_Gesture):Tdouble;cdecl;external;
{*
 * Get the difference of y position from the last event to this event.
 *
 * @param gesture The event, if NULL 0 is returned
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
function elput_swipe_dy_get(gesture:PElput_Swipe_Gesture):Tdouble;cdecl;external;
{*
 * Get the finger_count for this gesture
 *
 * @param gesture The event, if NULL 0 is returned
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
function elput_swipe_finger_count_get(gesture:PElput_Swipe_Gesture):longint;cdecl;external;
{*
 * Get the window in which this event is emitted.
 *
 * @param gesture The event, if NULL 0 is returned
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
function elput_swipe_window_get(gesture:PElput_Swipe_Gesture):longint;cdecl;external;
{*
 * Get the device from which the gesture event is coming.
 *
 * This value is the same for the lifetime of a gesture
 *
 * @param gesture The event, if NULL, NULL is returned
 *
 * @ingroup Elput_Gestures
 * @since 1.26
  }
function elput_swipe_device_get(gesture:PElput_Swipe_Gesture):PElput_Device;cdecl;external;

implementation

function active(var a : _Elput_Event_Session_Active) : TEina_Bool;
begin
  active:=(a.flag0 and bm__Elput_Event_Session_Active_active) shr bp__Elput_Event_Session_Active_active;
end;

procedure set_active(var a : _Elput_Event_Session_Active; __active : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__active shl bp__Elput_Event_Session_Active_active) and bm__Elput_Event_Session_Active_active);
end;


end.
