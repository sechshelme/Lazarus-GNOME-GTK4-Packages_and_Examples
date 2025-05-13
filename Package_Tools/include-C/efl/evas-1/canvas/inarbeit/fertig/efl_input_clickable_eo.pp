
unit efl_input_clickable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_clickable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_clickable_eo.h
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
PEfl_Input_Clickable  = ^Efl_Input_Clickable;
PEfl_Input_Clickable_Clicked  = ^Efl_Input_Clickable_Clicked;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_CLICKABLE_EO_H_}
{$define _EFL_INPUT_CLICKABLE_EO_H_}
{$ifndef _EFL_INPUT_CLICKABLE_EO_CLASS_TYPE}
{$define _EFL_INPUT_CLICKABLE_EO_CLASS_TYPE}
type
  PEfl_Input_Clickable = ^TEfl_Input_Clickable;
  TEfl_Input_Clickable = TEo;
{$endif}
{$ifndef _EFL_INPUT_CLICKABLE_EO_TYPES}
{$define _EFL_INPUT_CLICKABLE_EO_TYPES}
{* A struct that expresses a click in elementary.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable_Clicked
  }
{*< The amount of how often the clicked event was
                          * repeated in a certain amount of time
                          *
                          * @since 1.23  }
{*< The Button that is pressed
                        *
                        * @since 1.23  }
type
  PEfl_Input_Clickable_Clicked = ^TEfl_Input_Clickable_Clicked;
  TEfl_Input_Clickable_Clicked = record
      repeated : dword;
      button : dword;
    end;
{$endif}
{* Efl input clickable interface.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_CLICKABLE_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_clickable_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_INPUT_CLICKABLE_PROTECTED}
{*
 * @brief Change internal states that a button got pressed.
 *
 * When the button is already pressed, this is silently ignored.
 *
 * @param[in] obj The object.
 * @param[in] button The number of the button. FIXME ensure to have the right
 * interval of possible input
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }
procedure efl_input_clickable_press(obj:PEo; button:dword);cdecl;external;
{$endif}
{$ifdef EFL_INPUT_CLICKABLE_PROTECTED}
{*
 * @brief Change internal states that a button got unpressed.
 *
 * When the button is not pressed, this is silently ignored.
 *
 * @param[in] obj The object.
 * @param[in] button The number of the button. FIXME ensure to have the right
 * interval of possible input
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

procedure efl_input_clickable_unpress(obj:PEo; button:dword);cdecl;external;
{$endif}
{$ifdef EFL_INPUT_CLICKABLE_PROTECTED}
{*
 * @brief This aborts the internal state after a press call.
 *
 * This will stop the timer for longpress and set the state of the clickable
 * mixin back into the unpressed state.
 *
 * @param[in] obj The object.
 * @param[in] button
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

procedure efl_input_clickable_button_state_reset(obj:PEo; button:dword);cdecl;external;
{$endif}
{$ifdef EFL_INPUT_CLICKABLE_PROTECTED}
{*
 * @brief This aborts ongoing longpress event.
 *
 * That is, this will stop the timer for longpress.
 *
 * @param[in] obj The object.
 * @param[in] button
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

procedure efl_input_clickable_longpress_abort(obj:PEo; button:dword);cdecl;external;
{$endif}
{* This returns true if the given object is currently in event emission
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }
(* Const before type ignored *)

function efl_input_clickable_interaction_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_INPUT_EVENT_CLICKED : TEfl_Event_Description;cvar;external;
{* Called when object is in sequence pressed and unpressed by the primary
 * button
 * @return Efl_Input_Clickable_Clicked
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_EVENT_CLICKED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_INPUT_EVENT_CLICKED_ANY : TEfl_Event_Description;cvar;external;
{* Called when object is in sequence pressed and unpressed by any button. The
 * button that triggered the event can be found in the event information.
 * @return Efl_Input_Clickable_Clicked
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_EVENT_CLICKED_ANY : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_INPUT_EVENT_PRESSED : TEfl_Event_Description;cvar;external;
{* Called when the object is pressed, event_info is the button that got
 * pressed
 * @return int
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_EVENT_PRESSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_INPUT_EVENT_UNPRESSED : TEfl_Event_Description;cvar;external;
{* Called when the object is no longer pressed, event_info is the button that
 * got pressed
 * @return int
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_EVENT_UNPRESSED : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_INPUT_EVENT_LONGPRESSED : TEfl_Event_Description;cvar;external;
{* Called when the object receives a long press, event_info is the button that
 * got pressed
 * @return int
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Clickable
  }

{ was #define dname def_expr }
function EFL_INPUT_EVENT_LONGPRESSED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_CLICKABLE_MIXIN : longint; { return type might be wrong }
  begin
    EFL_INPUT_CLICKABLE_MIXIN:=efl_input_clickable_mixin_get;
  end;

{ was #define dname def_expr }
function EFL_INPUT_EVENT_CLICKED : longint; { return type might be wrong }
  begin
    EFL_INPUT_EVENT_CLICKED:=@(_EFL_INPUT_EVENT_CLICKED);
  end;

{ was #define dname def_expr }
function EFL_INPUT_EVENT_CLICKED_ANY : longint; { return type might be wrong }
  begin
    EFL_INPUT_EVENT_CLICKED_ANY:=@(_EFL_INPUT_EVENT_CLICKED_ANY);
  end;

{ was #define dname def_expr }
function EFL_INPUT_EVENT_PRESSED : longint; { return type might be wrong }
  begin
    EFL_INPUT_EVENT_PRESSED:=@(_EFL_INPUT_EVENT_PRESSED);
  end;

{ was #define dname def_expr }
function EFL_INPUT_EVENT_UNPRESSED : longint; { return type might be wrong }
  begin
    EFL_INPUT_EVENT_UNPRESSED:=@(_EFL_INPUT_EVENT_UNPRESSED);
  end;

{ was #define dname def_expr }
function EFL_INPUT_EVENT_LONGPRESSED : longint; { return type might be wrong }
  begin
    EFL_INPUT_EVENT_LONGPRESSED:=@(_EFL_INPUT_EVENT_LONGPRESSED);
  end;


end.
