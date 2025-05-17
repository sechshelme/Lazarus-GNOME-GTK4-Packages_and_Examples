
unit efl_input_interface_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_interface_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_interface_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Input_Device  = ^Efl_Input_Device;
PEfl_Input_Interface  = ^Efl_Input_Interface;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_INTERFACE_EO_H_}
{$define _EFL_INPUT_INTERFACE_EO_H_}
{$ifndef _EFL_INPUT_INTERFACE_EO_CLASS_TYPE}
{$define _EFL_INPUT_INTERFACE_EO_CLASS_TYPE}
type
  PEfl_Input_Interface = ^TEfl_Input_Interface;
  TEfl_Input_Interface = TEo;
{$endif}
{$ifndef _EFL_INPUT_INTERFACE_EO_TYPES}
{$define _EFL_INPUT_INTERFACE_EO_TYPES}
{$endif}
{*
 * @brief An object implementing this interface can send pointer events.
 *
 * Windows and canvas objects may send input events.
 *
 * A "pointer" refers to the main pointing device, which could be a mouse,
 * trackpad, finger, pen, etc... In other words, the finger id in any pointer
 * event will always be 0.
 *
 * A "finger" refers to a single point of input, usually in an absolute
 * coordinates input device, and that can support more than one input position
 * at at time (think multi-touch screens). The first finger (id 0) is sent
 * along with a pointer event, so be careful to not handle those events twice.
 * Note that if the input device can support "hovering", it is entirely
 * possible to receive move events without down coming first.
 *
 * A "key" is a key press from a keyboard or equivalent type of input device.
 * Long, repeated, key presses will always happen like this:
 * down...up,down...up,down...up (not down...up or down...down...down...up).
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_INPUT_INTERFACE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_interface_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Whether input events from a given seat are enabled. If the filter
 * list is empty (no seat is disabled) this object will report mouse, keyboard
 * and focus events from any seat, otherwise those events will only be reported
 * if the event comes from a seat that is not in the list.
 *
 * @param[in] obj The object.
 * @param[in] seat The seat to act on.
 * @param[in] enable @c true to enable events for a seat or @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }
procedure efl_input_seat_event_filter_set(obj:PEo; seat:PEfl_Input_Device; enable:TEina_Bool);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Whether input events from a given seat are enabled. If the filter
 * list is empty (no seat is disabled) this object will report mouse, keyboard
 * and focus events from any seat, otherwise those events will only be reported
 * if the event comes from a seat that is not in the list.
 *
 * @param[in] obj The object.
 * @param[in] seat The seat to act on.
 *
 * @return @c true to enable events for a seat or @c false otherwise.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }
(* Const before type ignored *)

function efl_input_seat_event_filter_get(obj:PEo; seat:PEfl_Input_Device):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_MOVE : TEfl_Event_Description;cvar;external;
{* Main pointer move (current and previous positions are known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_MOVE : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_DOWN : TEfl_Event_Description;cvar;external;
{* Main pointer button pressed (button id is known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_DOWN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_UP : TEfl_Event_Description;cvar;external;
{* Main pointer button released (button id is known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_UP : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_CANCEL : TEfl_Event_Description;cvar;external;
{* Main pointer button press was cancelled (button id is known). This can
 * happen in rare cases when the window manager passes the focus to a more
 * urgent window, for instance. You probably don't need to listen to this
 * event, as it will be accompanied by an up event.
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_CANCEL : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_IN : TEfl_Event_Description;cvar;external;
{* Pointer entered a window or a widget.
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_IN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_OUT : TEfl_Event_Description;cvar;external;
{* Pointer left a window or a widget.
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_OUT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_WHEEL : TEfl_Event_Description;cvar;external;
{* Mouse wheel event.
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_WHEEL : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_POINTER_AXIS : TEfl_Event_Description;cvar;external;
{* Pen or other axis event update.
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_POINTER_AXIS : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_FINGER_MOVE : TEfl_Event_Description;cvar;external;
{* Finger moved (current and previous positions are known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_FINGER_MOVE : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_FINGER_DOWN : TEfl_Event_Description;cvar;external;
{* Finger pressed (finger id is known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_FINGER_DOWN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_FINGER_UP : TEfl_Event_Description;cvar;external;
{* Finger released (finger id is known).
 * @return Efl_Input_Pointer *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_FINGER_UP : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_KEY_DOWN : TEfl_Event_Description;cvar;external;
{* Keyboard key press.
 * @return Efl_Input_Key *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_KEY_DOWN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_KEY_UP : TEfl_Event_Description;cvar;external;
{* Keyboard key release.
 * @return Efl_Input_Key *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_KEY_UP : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_HOLD : TEfl_Event_Description;cvar;external;
{* All input events are on hold or resumed.
 * @return Efl_Input_Hold *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_HOLD : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_FOCUS_IN : TEfl_Event_Description;cvar;external;
{* A focus in event.
 * @return Efl_Input_Focus *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_FOCUS_IN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_EVENT_FOCUS_OUT : TEfl_Event_Description;cvar;external;
{* A focus out event.
 * @return Efl_Input_Focus *
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Interface
  }

{ was #define dname def_expr }
function EFL_EVENT_FOCUS_OUT : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_INTERFACE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_INPUT_INTERFACE_INTERFACE:=efl_input_interface_interface_get;
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_MOVE : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_MOVE:=@(_EFL_EVENT_POINTER_MOVE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_DOWN : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_DOWN:=@(_EFL_EVENT_POINTER_DOWN);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_UP : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_UP:=@(_EFL_EVENT_POINTER_UP);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_CANCEL : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_CANCEL:=@(_EFL_EVENT_POINTER_CANCEL);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_IN : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_IN:=@(_EFL_EVENT_POINTER_IN);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_OUT : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_OUT:=@(_EFL_EVENT_POINTER_OUT);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_WHEEL : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_WHEEL:=@(_EFL_EVENT_POINTER_WHEEL);
  end;

{ was #define dname def_expr }
function EFL_EVENT_POINTER_AXIS : longint; { return type might be wrong }
  begin
    EFL_EVENT_POINTER_AXIS:=@(_EFL_EVENT_POINTER_AXIS);
  end;

{ was #define dname def_expr }
function EFL_EVENT_FINGER_MOVE : longint; { return type might be wrong }
  begin
    EFL_EVENT_FINGER_MOVE:=@(_EFL_EVENT_FINGER_MOVE);
  end;

{ was #define dname def_expr }
function EFL_EVENT_FINGER_DOWN : longint; { return type might be wrong }
  begin
    EFL_EVENT_FINGER_DOWN:=@(_EFL_EVENT_FINGER_DOWN);
  end;

{ was #define dname def_expr }
function EFL_EVENT_FINGER_UP : longint; { return type might be wrong }
  begin
    EFL_EVENT_FINGER_UP:=@(_EFL_EVENT_FINGER_UP);
  end;

{ was #define dname def_expr }
function EFL_EVENT_KEY_DOWN : longint; { return type might be wrong }
  begin
    EFL_EVENT_KEY_DOWN:=@(_EFL_EVENT_KEY_DOWN);
  end;

{ was #define dname def_expr }
function EFL_EVENT_KEY_UP : longint; { return type might be wrong }
  begin
    EFL_EVENT_KEY_UP:=@(_EFL_EVENT_KEY_UP);
  end;

{ was #define dname def_expr }
function EFL_EVENT_HOLD : longint; { return type might be wrong }
  begin
    EFL_EVENT_HOLD:=@(_EFL_EVENT_HOLD);
  end;

{ was #define dname def_expr }
function EFL_EVENT_FOCUS_IN : longint; { return type might be wrong }
  begin
    EFL_EVENT_FOCUS_IN:=@(_EFL_EVENT_FOCUS_IN);
  end;

{ was #define dname def_expr }
function EFL_EVENT_FOCUS_OUT : longint; { return type might be wrong }
  begin
    EFL_EVENT_FOCUS_OUT:=@(_EFL_EVENT_FOCUS_OUT);
  end;


end.
