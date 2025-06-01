
unit elm_check_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_check_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_check_legacy.h
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
PEina_Bool  = ^Eina_Bool;
PElm_Check  = ^Elm_Check;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Check = ^TElm_Check;
  TElm_Check = TEo;
{*
 * @brief Add a new Check object
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Check
  }

function elm_check_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Get the state of the check object
 *
 * @param obj The check object
 *
 * @ingroup Elm_Check
  }
(* Const before type ignored *)
function elm_check_state_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the on/off state of the check object
 *
 * This sets the state of the check. If set with
 * @.state_pointer.set, the state of that variable is also
 * changed. Calling this doesn't cause the "changed" signal to
 * be emitted.
 *
 * @param obj The check object
 * @param state The state to use (1 == on, 0 == off)
 *
 * @ingroup Elm_Check
  }
procedure elm_check_state_set(obj:PEvas_Object; state:TEina_Bool);cdecl;external;
{*
 * @brief Set a convenience pointer to a boolean to change
 *
 * This sets a pointer to a boolean, that, in addition to the check
 * objects state will also be modified directly. To stop setting the
 * object pointed to simply use null as the "statep" parameter.
 * If "statep" is not null, then when this is called, the check
 * objects state will also be modified to reflect the value of the
 * boolean "statep" points to, just like calling @.state.set.
 *
 * @param obj The check object
 * @param statep pointer to the boolean to modify
 *
 * @ingroup Elm_Check
  }
procedure elm_check_state_pointer_set(obj:PEvas_Object; statep:PEina_Bool);cdecl;external;
{$include "efl_ui_check_eo.legacy.h"}

implementation


end.
