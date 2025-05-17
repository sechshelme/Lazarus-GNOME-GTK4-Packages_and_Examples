
unit efl_input_state_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_state_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_state_eo.h
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
PEfl_Input_State  = ^Efl_Input_State;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_STATE_EO_H_}
{$define _EFL_INPUT_STATE_EO_H_}
{$ifndef _EFL_INPUT_STATE_EO_CLASS_TYPE}
{$define _EFL_INPUT_STATE_EO_CLASS_TYPE}
type
  PEfl_Input_State = ^TEfl_Input_State;
  TEfl_Input_State = TEo;
{$endif}
{$ifndef _EFL_INPUT_STATE_EO_TYPES}
{$define _EFL_INPUT_STATE_EO_TYPES}
{$endif}
{* Efl input state interface.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_State
  }

{ was #define dname def_expr }
function EFL_INPUT_STATE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_state_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Indicates whether a key modifier is on, such as Ctrl, Shift, ...
 *
 * @param[in] obj The object.
 * @param[in] mod The modifier key to test.
 * @param[in] seat The seat device, may be @c null
 *
 * @return @c true if the key modifier is pressed.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_State
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_input_modifier_enabled_get(obj:PEo; mod:TEfl_Input_Modifier; seat:PEfl_Input_Device):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Indicates whether a key lock is on, such as NumLock, CapsLock, ...
 *
 * @param[in] obj The object.
 * @param[in] lock The lock key to test.
 * @param[in] seat The seat device, may be @c null
 *
 * @return @c true if the key lock is on.
 *
 * @since 1.22
 *
 * @ingroup Efl_Input_State
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_input_lock_enabled_get(obj:PEo; lock:TEfl_Input_Lock; seat:PEfl_Input_Device):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_STATE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_INPUT_STATE_INTERFACE:=efl_input_state_interface_get;
  end;


end.
