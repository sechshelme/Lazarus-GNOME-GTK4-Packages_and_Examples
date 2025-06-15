
unit Ecore_Input;
interface

{
  Automatically converted by H2Pas 1.0.0 from Ecore_Input.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Ecore_Input.h
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
PEcore_Axis  = ^Ecore_Axis;
PEcore_Axis_Label  = ^Ecore_Axis_Label;
PEcore_Compose_State  = ^Ecore_Compose_State;
PEcore_Event_Axis_Update  = ^Ecore_Event_Axis_Update;
PEcore_Event_IO  = ^Ecore_Event_IO;
PEcore_Event_Joystick  = ^Ecore_Event_Joystick;
PEcore_Event_Joystick_Axis  = ^Ecore_Event_Joystick_Axis;
PEcore_Event_Joystick_Button  = ^Ecore_Event_Joystick_Button;
PEcore_Event_Joystick_Event  = ^Ecore_Event_Joystick_Event;
PEcore_Event_Joystick_Event_Type  = ^Ecore_Event_Joystick_Event_Type;
PEcore_Event_Key  = ^Ecore_Event_Key;
PEcore_Event_Modifier  = ^Ecore_Event_Modifier;
PEcore_Event_Modifiers  = ^Ecore_Event_Modifiers;
PEcore_Event_Mouse_Button  = ^Ecore_Event_Mouse_Button;
PEcore_Event_Mouse_IO  = ^Ecore_Event_Mouse_IO;
PEcore_Event_Mouse_Move  = ^Ecore_Event_Mouse_Move;
PEcore_Event_Mouse_Wheel  = ^Ecore_Event_Mouse_Wheel;
PEcore_Event_Press  = ^Ecore_Event_Press;
PEcore_Window  = ^Ecore_Window;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ECORE_INPUT_H}
{$define _ECORE_INPUT_H}
{$ifdef _WIN32}
{$include <stddef.h>}
{$else}
{$include <inttypes.h>}
{$endif}
{$include <Eina.h>}
{$include <Eo.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{ C++ extern C conditionnal removed }
{*
 * @defgroup Ecore_Input_Group Ecore Input
 * @ingroup Ecore_Group
 *
 *@
  }
  var
    ECORE_EVENT_KEY_DOWN : longint;cvar;external;
    ECORE_EVENT_KEY_UP : longint;cvar;external;
    ECORE_EVENT_MOUSE_BUTTON_DOWN : longint;cvar;external;
    ECORE_EVENT_MOUSE_BUTTON_UP : longint;cvar;external;
    ECORE_EVENT_MOUSE_MOVE : longint;cvar;external;
    ECORE_EVENT_MOUSE_WHEEL : longint;cvar;external;
    ECORE_EVENT_MOUSE_IN : longint;cvar;external;
    ECORE_EVENT_MOUSE_OUT : longint;cvar;external;
    ECORE_EVENT_AXIS_UPDATE : longint;cvar;external;
{*< @since 1.13  }
    ECORE_EVENT_MOUSE_BUTTON_CANCEL : longint;cvar;external;
{*< @since 1.15  }
    ECORE_EVENT_JOYSTICK : longint;cvar;external;
{*< @since 1.18  }

const
  ECORE_EVENT_MODIFIER_SHIFT = $0001;  
  ECORE_EVENT_MODIFIER_CTRL = $0002;  
  ECORE_EVENT_MODIFIER_ALT = $0004;  
  ECORE_EVENT_MODIFIER_WIN = $0008;  
  ECORE_EVENT_MODIFIER_SCROLL = $0010;  
  ECORE_EVENT_MODIFIER_NUM = $0020;  
  ECORE_EVENT_MODIFIER_CAPS = $0040;  
  ECORE_EVENT_LOCK_SCROLL = $0080;  
  ECORE_EVENT_LOCK_NUM = $0100;  
  ECORE_EVENT_LOCK_CAPS = $0200;  
  ECORE_EVENT_LOCK_SHIFT = $0300;  
{*< @since 1.7  }
  ECORE_EVENT_MODIFIER_ALTGR = $0400;  
{$ifndef _ECORE_WINDOW_PREDEF}
type
  PEcore_Window = ^TEcore_Window;
  TEcore_Window = Tuintptr_t;

const
  _ECORE_WINDOW_PREDEF = 1;  
{$endif}
type
{*< @since 1.13  }
{*< @since 1.13  }
{*< @since 1.18  }
{*
    * @typedef Ecore_Event_Modifier
    * An enum of modifier events.
     }
{*< @since 1.7  }

  PEcore_Event_Modifier = ^TEcore_Event_Modifier;
  TEcore_Event_Modifier =  Longint;
  Const
    ECORE_NONE = 0;
    ECORE_SHIFT = 1;
    ECORE_CTRL = 2;
    ECORE_ALT = 3;
    ECORE_WIN = 4;
    ECORE_SCROLL = 5;
    ECORE_CAPS = 6;
    ECORE_MODE = 7;
    ECORE_LAST = 8;
;
{*
    * @typedef Ecore_Event_Press
    * An enum of press events.
     }
type
  PEcore_Event_Press = ^TEcore_Event_Press;
  TEcore_Event_Press =  Longint;
  Const
    ECORE_DOWN = 0;
    ECORE_UP = 1;
    ECORE_CANCEL = 2;
;
{*
    * @typedef Ecore_Event_IO
    * An enum of Input/Output events.
     }
type
  PEcore_Event_IO = ^TEcore_Event_IO;
  TEcore_Event_IO =  Longint;
  Const
    ECORE_IN = 0;
    ECORE_OUT = 1;
;
{*
    * @typedef Ecore_Compose_State
    * An enum of Compose states.
     }
type
  PEcore_Compose_State = ^TEcore_Compose_State;
  TEcore_Compose_State =  Longint;
  Const
    ECORE_COMPOSE_NONE = 0;
    ECORE_COMPOSE_MIDDLE = 1;
    ECORE_COMPOSE_DONE = 2;
;
{*
    * @struct _Ecore_Event_Joystic_Button
    * Contains information about a joystick button event.
     }
type
  PEcore_Event_Joystick_Button = ^TEcore_Event_Joystick_Button;
  TEcore_Event_Joystick_Button =  Longint;
  Const
    ECORE_EVENT_JOYSTICK_BUTTON_NONE = 0;
    ECORE_EVENT_JOYSTICK_BUTTON_FACE_0 = 1;
    ECORE_EVENT_JOYSTICK_BUTTON_FACE_1 = 2;
    ECORE_EVENT_JOYSTICK_BUTTON_FACE_2 = 3;
    ECORE_EVENT_JOYSTICK_BUTTON_FACE_3 = 4;
    ECORE_EVENT_JOYSTICK_BUTTON_LEFT_SHOULDER = 5;
    ECORE_EVENT_JOYSTICK_BUTTON_RIGHT_SHOULDER = 6;
    ECORE_EVENT_JOYSTICK_BUTTON_SELECT = 7;
    ECORE_EVENT_JOYSTICK_BUTTON_START = 8;
    ECORE_EVENT_JOYSTICK_BUTTON_LEFT_ANALOG_STICK = 9;
    ECORE_EVENT_JOYSTICK_BUTTON_RIGHT_ANALOG_STICK = 10;
    ECORE_EVENT_JOYSTICK_BUTTON_META = 11;
    ECORE_EVENT_JOYSTICK_BUTTON_LAST = 12;
;
{*< @since 1.18  }
{*
    * @struct _Ecore_Event_Joystic_Axis
    * Contains information about a joystick axis event.
     }
type
  PEcore_Event_Joystick_Axis = ^TEcore_Event_Joystick_Axis;
  TEcore_Event_Joystick_Axis =  Longint;
  Const
    ECORE_EVENT_JOYSTICK_AXIS_NONE = 0;
    ECORE_EVENT_JOYSTICK_AXIS_HAT_X = 1;
    ECORE_EVENT_JOYSTICK_AXIS_HAT_Y = 2;
    ECORE_EVENT_JOYSTICK_AXIS_LEFT_SHOULDER = 3;
    ECORE_EVENT_JOYSTICK_AXIS_RIGHT_SHOULDER = 4;
    ECORE_EVENT_JOYSTICK_AXIS_LEFT_ANALOG_HOR = 5;
    ECORE_EVENT_JOYSTICK_AXIS_LEFT_ANALOG_VER = 6;
    ECORE_EVENT_JOYSTICK_AXIS_RIGHT_ANALOG_HOR = 7;
    ECORE_EVENT_JOYSTICK_AXIS_RIGHT_ANALOG_VER = 8;
    ECORE_EVENT_JOYSTICK_AXIS_LAST = 9;
;
{*< @since 1.18  }
{*
    * @struct _Ecore_Event_Joystic_Event_Type
    * Contains information about a joystick event type.
     }
type
  PEcore_Event_Joystick_Event = ^TEcore_Event_Joystick_Event;
  TEcore_Event_Joystick_Event =  Longint;
  Const
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_NONE = 0;
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_CONNECTED = 1;
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_DISCONNECTED = 2;
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_BUTTON = 3;
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_AXIS = 4;
    ECORE_EVENT_JOYSTICK_EVENT_TYPE_LAST = 5;
;
  TEcore_Event_Joystick_Event_Type = TEcore_Event_Joystick_Event;
  PEcore_Event_Joystick_Event_Type = ^TEcore_Event_Joystick_Event_Type;
{*< @since 1.18  }
{*
    * @struct _Ecore_Event_Key
    * Contains information about an Ecore keyboard event.
     }
(* Const before type ignored *)
{*< The key name  }
(* Const before type ignored *)
{*< The key symbol  }
(* Const before type ignored *)
(* Const before type ignored *)
{*< final string corresponding to the key symbol composed  }
{*< The main window where event happened  }
{*< The root window where event happened  }
{*< The child window where event happened  }
{*< Time when the event occurred  }
{*< The combination of modifiers key (SHIFT,CTRL,ALT,..) }
{*< same screen flag  }
{*< Key scan code numeric value @since 1.10  }
{*< User data associated with an Ecore_Event_Key @since 1.10  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
type
  PEcore_Event_Key = ^TEcore_Event_Key;
  TEcore_Event_Key = record
      keyname : Pchar;
      key : Pchar;
      _string : Pchar;
      compose : Pchar;
      window : TEcore_Window;
      root_window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      modifiers : dword;
      same_screen : longint;
      keycode : dword;
      data : pointer;
      dev : PEo;
    end;

{*
    * @struct _Ecore_Event_Mouse_Button
    * Contains information about an Ecore mouse button event.
     }
{*< The main window where event happened  }
{*< The root window where event happened  }
{*< The child window where event happened  }
{*< Time when the event occurred  }
{*< The combination of modifiers key (SHIFT,CTRL,ALT,..) }
{*< The button that was used  }
{*< Double click event  }
{*< Triple click event  }
{*< Same screen flag  }
{*< x coordinate relative to window where event happened  }
{*< y coordinate relative to window where event happened  }
{*< Coordinates relative to root window  }
{*< 0 if normal mouse, 1+ for other mouse-devices (eg multi-touch - other fingers)  }
{*< radius of press point - radius_x and y if its an ellipse (radius is the average of the 2)  }
{*< pressure - 1.0 == normal, > 1.0 == more, 0.0 == none  }
{*< angle relative to perpendicular (0.0 == perpendicular), in degrees  }
{*< same as x, y, but with sub-pixel precision, if available  }
{*< same as root.x, root.y, but with sub-pixel precision, if available  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Mouse_Button = ^TEcore_Event_Mouse_Button;
  TEcore_Event_Mouse_Button = record
      window : TEcore_Window;
      root_window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      modifiers : dword;
      buttons : dword;
      double_click : dword;
      triple_click : dword;
      same_screen : longint;
      x : longint;
      y : longint;
      root : record
          x : longint;
          y : longint;
        end;
      multi : record
          device : longint;
          radius : Tdouble;
          radius_x : Tdouble;
          radius_y : Tdouble;
          pressure : Tdouble;
          angle : Tdouble;
          x : Tdouble;
          y : Tdouble;
          root : record
              x : Tdouble;
              y : Tdouble;
            end;
        end;
      dev : PEo;
    end;

{*
    * @struct _Ecore_Event_Mouse_Wheel
    * Contains information about an Ecore mouse wheel event.
     }
{*< The main window where event happened  }
{*< The root window where event happened  }
{*< The child window where event happened  }
{*< Time when the event occurred  }
{*< The combination of modifiers key (SHIFT,CTRL,ALT,..) }
{*< Same screen flag  }
{*< Orientation of the wheel (horizontal/vertical)  }
{*< Value of the wheel event (+1/-1)  }
{*< x coordinate relative to window where event happened  }
{*< y coordinate relative to window where event happened  }
{*< Coordinates relative to root window  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Mouse_Wheel = ^TEcore_Event_Mouse_Wheel;
  TEcore_Event_Mouse_Wheel = record
      window : TEcore_Window;
      root_window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      modifiers : dword;
      same_screen : longint;
      direction : longint;
      z : longint;
      x : longint;
      y : longint;
      root : record
          x : longint;
          y : longint;
        end;
      dev : PEo;
    end;

{*
    * @struct _Ecore_Event_Mouse_Move
    * Contains information about an Ecore mouse move event.
     }
{*< The main window where event happened  }
{*< The root window where event happened  }
{*< The child window where event happened  }
{*< Time when the event occurred  }
{*< The combination of modifiers key (SHIFT,CTRL,ALT,..) }
{*< Same screen flag  }
{*< x coordinate relative to window where event happened  }
{*< y coordinate relative to window where event happened  }
{*< Coordinates relative to root window  }
{*< 0 if normal mouse, 1+ for other mouse-devices (eg multi-touch - other fingers)  }
{*< radius of press point - radius_x and y if its an ellipse (radius is the average of the 2)  }
{*< pressure - 1.0 == normal, > 1.0 == more, 0.0 == none  }
{*< angle relative to perpendicular (0.0 == perpendicular), in degrees  }
{*< same as x, y root.x, root.y, but with sub-pixel precision, if available  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Mouse_Move = ^TEcore_Event_Mouse_Move;
  TEcore_Event_Mouse_Move = record
      window : TEcore_Window;
      root_window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      modifiers : dword;
      same_screen : longint;
      x : longint;
      y : longint;
      root : record
          x : longint;
          y : longint;
        end;
      multi : record
          device : longint;
          radius : Tdouble;
          radius_x : Tdouble;
          radius_y : Tdouble;
          pressure : Tdouble;
          angle : Tdouble;
          x : Tdouble;
          y : Tdouble;
          root : record
              x : Tdouble;
              y : Tdouble;
            end;
        end;
      dev : PEo;
    end;

{*< Axis type is not known. Range: Unbounded. Unit: Undefined. @since 1.13  }
{*< Position along physical X axis; not window relative. Range: Unbounded. Unit: Undefined. @since 1.13  }
{*< Position along physical Y axis; not window relative. Range: Unbounded. Unit: Undefined. @since 1.13  }
{*< Force applied to tool tip. Range: [0.0, 1.0]. Unit: Unitless. @since 1.13  }
{*< Relative distance along physical Z axis. Range: [0.0, 1.0]. Unit: Unitless. @since 1.13  }
{*< Angle of tool about the Z axis from positive X axis. Range: [-PI, PI]. Unit: Radians. @since 1.13 }
{*< Angle of tool about plane of sensor from positive Z axis. Range: [0.0, PI]. Unit: Radians. @since 1.13  }
{*< Rotation of tool about its major axis from its "natural" position. Range: [-PI, PI] Unit: Radians. @since 1.13  }
{*< Length of contact ellipse along AZIMUTH. Range: Unbounded: Unit: Same as ECORE_AXIS_LABEL_X,Y. @since 1.13  }
{*< Length of contact ellipse perpendicular to AZIMUTH. Range: Unbounded. Unit: Same as ECORE_AXIS_LABEL_X,Y. @since 1.13  }
{*< Length of tool ellipse along AZIMUTH. Range: Unbounded. Unit: Same as ECORE_AXIS_LABEL_X,Y. @since 1.13  }
{*< Length of tool ellipse perpendicular to AZIMUTH. Range: Unbounded. Unit: Same as ECORE_AXIS_LABEL_X,Y. @since 1.13  }
{*< X coordinate mapped to the window. @since 1.19  }
{*< Y coordinate mapped to the window. @since 1.19  }
{*< X normalized to the [0, 1] range. @since 1.19  }
{*< Y normalized to the [0, 1] range. @since 1.19  }
{*< Size of palm contact. Range: Unbounded. Unit: undefined. May be a boolean or a distance value, depending on the underlying H/W. @since 1.20  }

  PEcore_Axis_Label = ^TEcore_Axis_Label;
  TEcore_Axis_Label =  Longint;
  Const
    ECORE_AXIS_LABEL_UNKNOWN = 0;
    ECORE_AXIS_LABEL_X = 1;
    ECORE_AXIS_LABEL_Y = 2;
    ECORE_AXIS_LABEL_PRESSURE = 3;
    ECORE_AXIS_LABEL_DISTANCE = 4;
    ECORE_AXIS_LABEL_AZIMUTH = 5;
    ECORE_AXIS_LABEL_TILT = 6;
    ECORE_AXIS_LABEL_TWIST = 7;
    ECORE_AXIS_LABEL_TOUCH_WIDTH_MAJOR = 8;
    ECORE_AXIS_LABEL_TOUCH_WIDTH_MINOR = 9;
    ECORE_AXIS_LABEL_TOOL_WIDTH_MAJOR = 10;
    ECORE_AXIS_LABEL_TOOL_WIDTH_MINOR = 11;
    ECORE_AXIS_LABEL_WINDOW_X = 12;
    ECORE_AXIS_LABEL_WINDOW_Y = 13;
    ECORE_AXIS_LABEL_NORMAL_X = 14;
    ECORE_AXIS_LABEL_NORMAL_Y = 15;
    ECORE_AXIS_LABEL_TOUCH_PALM = 16;
;
{*< @since 1.13  }
type
  PEcore_Axis = ^TEcore_Axis;
  TEcore_Axis = record
      _label : TEcore_Axis_Label;
      value : Tdouble;
    end;

{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Axis_Update = ^TEcore_Event_Axis_Update;
  TEcore_Event_Axis_Update = record
      window : TEcore_Window;
      root_window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      device : longint;
      toolid : longint;
      naxis : longint;
      axis : PEcore_Axis;
      dev : PEo;
    end;

{*
    * @struct _Ecore_Event_Mouse_IO
    * Contains information about an Ecore mouse input/output event.
     }
{*< The main window where event happened  }
{*< The child window where event happened  }
{*< Time when the event occurred  }
{*< The combination of modifiers key (SHIFT,CTRL,ALT,..) }
{*< x coordinate relative to window where event happened  }
{*< y coordinate relative to window where event happened  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Mouse_IO = ^TEcore_Event_Mouse_IO;
  TEcore_Event_Mouse_IO = record
      window : TEcore_Window;
      event_window : TEcore_Window;
      timestamp : dword;
      modifiers : dword;
      x : longint;
      y : longint;
      dev : PEo;
    end;

{*
    * @struct _Ecore_Event_Modifiers
    * Contains information about an Ecore event modifier.
     }
  PEcore_Event_Modifiers = ^TEcore_Event_Modifiers;
  TEcore_Event_Modifiers = record
      size : dword;
      array : array[0..(ECORE_LAST)-1] of dword;
    end;

{*
    * @struct _Ecore_Event_Joystick
    * Contains information about a joystick event.
     }
{ [-1.0 .. 1.0] -1.0 == up or left, 1.0 == down or right  }
{ [0.0 .. 1.0] 0.0 == fully unpressed, 1.0 == fully pressed  }
{*< The Efl_Input_Device that originated the event @since 1.19  }
  PEcore_Event_Joystick = ^TEcore_Event_Joystick;
  TEcore_Event_Joystick = record
      _type : TEcore_Event_Joystick_Event_Type;
      index : dword;
      timestamp : dword;
      uni : record
          case longint of
            0 : ( axis : record
                index : TEcore_Event_Joystick_Axis;
                value : Tdouble;
              end );
            1 : ( button : record
                index : TEcore_Event_Joystick_Button;
                value : Tdouble;
              end );
          end;
      dev : PEo;
    end;

{*
    * Initializes the Ecore Event system.
     }

function ecore_event_init:longint;cdecl;external;
{*
    * Shutdowns the Ecore Event system.
     }
function ecore_event_shutdown:longint;cdecl;external;
{*
    * Returns the Ecore modifier event integer associated to a
    * Ecore_Event_Modifier modifier event.
    *
    * @param modifier A Ecore_Event_Modifier event.
    * @return A event_modifier integer that matches with the provided modifier
    * event.
     }
function ecore_event_modifier_mask(modifier:TEcore_Event_Modifier):dword;cdecl;external;
{*
    * Update a Ecore_Event_Modifiers array with "key" modifier.
    *
    * @param key A string describing a modifier key.
    * @param modifiers A Ecore_Event_Modifiers structure.
    * @param inc The value to increment in the modifiers array.
    *
    * @return ECORE_NONE if the key does not match with an existing one, else
    * the corresponding Ecore_Event_Modifier.
     }
(* Const before type ignored *)
function ecore_event_update_modifier(key:Pchar; modifiers:PEcore_Event_Modifiers; inc:longint):TEcore_Event_Modifier;cdecl;external;
{*
    * Handles a sequence of key symbols to make a final compose string.
    *
    * The final compose string seqstr_ret is allocated in this function and
    * thus shall be freed when not needed anymore.
    *
    * @param seq The sequence of key symbols in a Eina_List.
    * @param seqstr_ret The final compose string.
    * @return The status of the composition.
     }
(* Const before type ignored *)
function ecore_compose_get(seq:PEina_List; seqstr_ret:PPchar):TEcore_Compose_State;cdecl;external;
{*
    * Set deadzone of joystick event for an axis.
    *
    * The axis type joystick event occurs without user's control if joystick is
    * too sensitive. The deadzone prevents unnecessary events.
    * The default value is 200. The event value for an axis is a signed integer
    * between -32767 and +32767.
    *
    * @param event_axis_deadzone The joystick event axis deadzone.
    * @since 1.19
     }
procedure ecore_input_joystick_event_axis_deadzone_set(event_axis_deadzone:longint);cdecl;external;
{*
    * Get deadzone of joystick event for an axis.
    *
    * @return deadzone of joystick event for an axis.
    * @since 1.19
     }
function ecore_input_joystick_event_axis_deadzone_get:longint;cdecl;external;
{*
    * Get name of joystick
    *
    * This function returns the name string of the joysitck. If @p index
    * does not exist, or on error, this function returns NULL.
    *
    * @param index The index of joystick.
    * @return name of joystick.
    * @since 1.20
     }
(* Const before type ignored *)
function ecore_input_joystick_name_get(index:longint):Pchar;cdecl;external;

implementation


end.
