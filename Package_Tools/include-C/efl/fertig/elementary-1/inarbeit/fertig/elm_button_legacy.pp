
unit elm_button_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_button_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_button_legacy.h
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
PElm_Button  = ^Elm_Button;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Button = ^TElm_Button;
  TElm_Button = TEo;
{*
 * Add a new button to the parent's canvas
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Button
  }

function elm_button_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief The initial timeout before the autorepeat event is generated
 *
 * Sets the timeout, in seconds, since the button is pressed until the first
 * @c repeated signal is emitted. If @c t is 0.0 or less, there won't be any
 * delay and the event will be fired the moment the button is pressed.
 *
 * See also @ref elm_button_autorepeat_set,
 * @ref elm_button_autorepeat_gap_timeout_set.
 *
 * @param[in] t Timeout in seconds
 *
 * @ingroup Elm_Button
  }
procedure elm_button_autorepeat_initial_timeout_set(obj:PEvas_Object; t:Tdouble);cdecl;external;
{*
 * @brief The initial timeout before the autorepeat event is generated
 *
 * Sets the timeout, in seconds, since the button is pressed until the first
 * @c repeated signal is emitted. If @c t is 0.0 or less, there won't be any
 * delay and the event will be fired the moment the button is pressed.
 *
 * See also @ref elm_button_autorepeat_set,
 * @ref elm_button_autorepeat_gap_timeout_set.
 *
 * @return Timeout in seconds
 *
 * @ingroup Elm_Button
  }
(* Const before type ignored *)
function elm_button_autorepeat_initial_timeout_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief The interval between each generated autorepeat event
 *
 * After the first @c repeated event is fired, all subsequent ones will follow
 * after a delay of @c t seconds for each.
 *
 * See also @ref elm_button_autorepeat_initial_timeout_set.
 *
 * @param[in] t Interval in seconds
 *
 * @ingroup Elm_Button
  }
procedure elm_button_autorepeat_gap_timeout_set(obj:PEvas_Object; t:Tdouble);cdecl;external;
{*
 * @brief The interval between each generated autorepeat event
 *
 * After the first @c repeated event is fired, all subsequent ones will follow
 * after a delay of @c t seconds for each.
 *
 * See also @ref elm_button_autorepeat_initial_timeout_set.
 *
 * @return Interval in seconds
 *
 * @ingroup Elm_Button
  }
(* Const before type ignored *)
function elm_button_autorepeat_gap_timeout_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*
 * @brief Turn on/off the autorepeat event generated when the button is kept
 * pressed
 *
 * When off, no autorepeat is performed and buttons emit a normal @c clicked
 * signal when they are clicked.
 *
 * When on, keeping a button pressed will continuously emit a @c repeated
 * signal until the button is released. The time it takes until it starts
 * emitting the signal is given by @ref elm_button_autorepeat_initial_timeout_set,
 * and the time between each new emission by
 * @ref elm_button_autorepeat_gap_timeout_set.
 *
 * @param[in] on A bool to turn on/off the event
 *
 * @ingroup Elm_Button
  }
procedure elm_button_autorepeat_set(obj:PEvas_Object; on:TEina_Bool);cdecl;external;
{*
 * @brief Turn on/off the autorepeat event generated when the button is kept
 * pressed
 *
 * When off, no autorepeat is performed and buttons emit a normal @c clicked
 * signal when they are clicked.
 *
 * When on, keeping a button pressed will continuously emit a @c repeated
 * signal until the button is released. The time it takes until it starts
 * emitting the signal is given by @ref elm_button_autorepeat_initial_timeout_set,
 * and the time between each new emission by
 * @ref elm_button_autorepeat_gap_timeout_set.
 *
 * @return A bool to turn on/off the event
 *
 * @ingroup Elm_Button
  }
(* Const before type ignored *)
function elm_button_autorepeat_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{$include "efl_ui_button_eo.legacy.h"}

implementation


end.
