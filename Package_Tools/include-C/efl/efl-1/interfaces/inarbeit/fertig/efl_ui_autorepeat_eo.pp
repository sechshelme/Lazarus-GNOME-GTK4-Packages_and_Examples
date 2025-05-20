
unit efl_ui_autorepeat_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_autorepeat_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_autorepeat_eo.h
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
PEfl_Ui_Autorepeat  = ^Efl_Ui_Autorepeat;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_AUTOREPEAT_EO_H_}
{$define _EFL_UI_AUTOREPEAT_EO_H_}
{$ifndef _EFL_UI_AUTOREPEAT_EO_CLASS_TYPE}
{$define _EFL_UI_AUTOREPEAT_EO_CLASS_TYPE}
type
  PEfl_Ui_Autorepeat = ^TEfl_Ui_Autorepeat;
  TEfl_Ui_Autorepeat = TEo;
{$endif}
{$ifndef _EFL_UI_AUTOREPEAT_EO_TYPES}
{$define _EFL_UI_AUTOREPEAT_EO_TYPES}
{$endif}
{*
 * @brief Interface for autorepeating clicks.
 *
 * This interface abstracts functions for enabling / disabling this feature.
 * When enabled, keeping a button pressed will continuously emit the
 * @c repeated event until the button is released. The time it takes until it
 * starts emitting the event is given by
 * @ref efl_ui_autorepeat_initial_timeout_get, and the time between each new
 * emission by @ref efl_ui_autorepeat_gap_timeout_get.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }

{ was #define dname def_expr }
function EFL_UI_AUTOREPEAT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_autorepeat_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The initial timeout before the autorepeat event is generated.
 *
 * Sets the timeout, in seconds, since the button is pressed until the first
 * @c repeated signal is emitted. If @c t is 0.0 or less, there won't be any
 * delay and the event will be fired the moment the button is pressed.
 *
 * See also @ref efl_ui_autorepeat_enabled_get and
 * @ref efl_ui_autorepeat_gap_timeout_get.
 *
 * @param[in] obj The object.
 * @param[in] t Timeout in seconds.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
procedure efl_ui_autorepeat_initial_timeout_set(obj:PEo; t:Tdouble);cdecl;external;
{*
 * @brief The initial timeout before the autorepeat event is generated.
 *
 * Sets the timeout, in seconds, since the button is pressed until the first
 * @c repeated signal is emitted. If @c t is 0.0 or less, there won't be any
 * delay and the event will be fired the moment the button is pressed.
 *
 * See also @ref efl_ui_autorepeat_enabled_get and
 * @ref efl_ui_autorepeat_gap_timeout_get.
 *
 * @param[in] obj The object.
 *
 * @return Timeout in seconds.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
(* Const before type ignored *)
function efl_ui_autorepeat_initial_timeout_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief The interval between each generated autorepeat event.
 *
 * After the first @c repeated event is fired, all subsequent ones will follow
 * after a delay of @c t seconds for each.
 *
 * See also @ref efl_ui_autorepeat_initial_timeout_get.
 *
 * @param[in] obj The object.
 * @param[in] t Time interval in seconds.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
procedure efl_ui_autorepeat_gap_timeout_set(obj:PEo; t:Tdouble);cdecl;external;
{*
 * @brief The interval between each generated autorepeat event.
 *
 * After the first @c repeated event is fired, all subsequent ones will follow
 * after a delay of @c t seconds for each.
 *
 * See also @ref efl_ui_autorepeat_initial_timeout_get.
 *
 * @param[in] obj The object.
 *
 * @return Time interval in seconds.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
(* Const before type ignored *)
function efl_ui_autorepeat_gap_timeout_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Turn on/off the autorepeat event generated when a button is kept
 * pressed.
 *
 * When off, no autorepeat is performed and buttons emit a normal @c clicked
 * event when they are clicked.
 *
 * @param[in] obj The object.
 * @param[in] on A bool to turn on/off the repeat event generation.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
procedure efl_ui_autorepeat_enabled_set(obj:PEo; on:TEina_Bool);cdecl;external;
{*
 * @brief Turn on/off the autorepeat event generated when a button is kept
 * pressed.
 *
 * When off, no autorepeat is performed and buttons emit a normal @c clicked
 * event when they are clicked.
 *
 * @param[in] obj The object.
 *
 * @return A bool to turn on/off the repeat event generation.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }
(* Const before type ignored *)
function efl_ui_autorepeat_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_AUTOREPEAT_EVENT_REPEATED : TEfl_Event_Description;cvar;external;
{* Called when a repeated event is emitted
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Autorepeat
  }

{ was #define dname def_expr }
function EFL_UI_AUTOREPEAT_EVENT_REPEATED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_AUTOREPEAT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_AUTOREPEAT_INTERFACE:=efl_ui_autorepeat_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_AUTOREPEAT_EVENT_REPEATED : longint; { return type might be wrong }
  begin
    EFL_UI_AUTOREPEAT_EVENT_REPEATED:=@(_EFL_UI_AUTOREPEAT_EVENT_REPEATED);
  end;


end.
