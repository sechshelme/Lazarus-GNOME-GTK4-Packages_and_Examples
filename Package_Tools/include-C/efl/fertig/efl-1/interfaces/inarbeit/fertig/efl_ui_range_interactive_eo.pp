
unit efl_ui_range_interactive_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_range_interactive_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_range_interactive_eo.h
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
PEfl_Ui_Range_Interactive  = ^Efl_Ui_Range_Interactive;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_RANGE_INTERACTIVE_EO_H_}
{$define _EFL_UI_RANGE_INTERACTIVE_EO_H_}
{$ifndef _EFL_UI_RANGE_INTERACTIVE_EO_CLASS_TYPE}
{$define _EFL_UI_RANGE_INTERACTIVE_EO_CLASS_TYPE}
type
  PEfl_Ui_Range_Interactive = ^TEfl_Ui_Range_Interactive;
  TEfl_Ui_Range_Interactive = TEo;
{$endif}
{$ifndef _EFL_UI_RANGE_INTERACTIVE_EO_TYPES}
{$define _EFL_UI_RANGE_INTERACTIVE_EO_TYPES}
{$endif}
{*
 * @brief Interface that extends the normal displaying properties with usage
 * properties.
 *
 * The properties defined here are used to manipulate the way a user interacts
 * with a displayed range.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Interactive
  }

{ was #define dname def_expr }
function EFL_UI_RANGE_INTERACTIVE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_range_interactive_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the step used to increment or decrement values for given
 * widget.
 *
 * This value will be incremented or decremented to the displayed value.
 *
 * By default step value is equal to 1.
 *
 * @warning The step value should be bigger than 0.
 *
 * @param[in] obj The object.
 * @param[in] step The step value.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Interactive
  }
procedure efl_ui_range_step_set(obj:PEo; step:Tdouble);cdecl;external;
{*
 * @brief Control the step used to increment or decrement values for given
 * widget.
 *
 * This value will be incremented or decremented to the displayed value.
 *
 * By default step value is equal to 1.
 *
 * @warning The step value should be bigger than 0.
 *
 * @param[in] obj The object.
 *
 * @return The step value.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Interactive
  }
(* Const before type ignored *)
function efl_ui_range_step_get(obj:PEo):Tdouble;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_RANGE_EVENT_STEADY : TEfl_Event_Description;cvar;external;
{* Called when the widget's value has changed and has remained unchanged for
 * 0.2s. This allows filtering out unwanted "noise" from the widget if you are
 * only interested in its final position. Use this event instead of
 * @[Efl.Ui.Range_Display.changed] if you are going to perform a costly
 * operation on its handler.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Range_Interactive
  }

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_STEADY : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_RANGE_INTERACTIVE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_INTERACTIVE_INTERFACE:=efl_ui_range_interactive_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_RANGE_EVENT_STEADY : longint; { return type might be wrong }
  begin
    EFL_UI_RANGE_EVENT_STEADY:=@(_EFL_UI_RANGE_EVENT_STEADY);
  end;


end.
