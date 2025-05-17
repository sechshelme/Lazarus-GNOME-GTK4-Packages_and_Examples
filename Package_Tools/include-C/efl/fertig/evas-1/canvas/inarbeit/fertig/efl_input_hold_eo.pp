
unit efl_input_hold_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_input_hold_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_input_hold_eo.h
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
PEfl_Input_Hold  = ^Efl_Input_Hold;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_INPUT_HOLD_EO_H_}
{$define _EFL_INPUT_HOLD_EO_H_}
{$ifndef _EFL_INPUT_HOLD_EO_CLASS_TYPE}
{$define _EFL_INPUT_HOLD_EO_CLASS_TYPE}
type
  PEfl_Input_Hold = ^TEfl_Input_Hold;
  TEfl_Input_Hold = TEo;
{$endif}
{$ifndef _EFL_INPUT_HOLD_EO_TYPES}
{$define _EFL_INPUT_HOLD_EO_TYPES}
{$endif}
{* Event data sent when inputs are put on hold or resumed.
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Hold
  }

{ was #define dname def_expr }
function EFL_INPUT_HOLD_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_input_hold_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Property to show if inputs are now on hold.
 *
 * @param[in] obj The object.
 * @param[in] val @c true if inputs are on hold, @c false otherwise
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Hold
  }
procedure efl_input_hold_set(obj:PEo; val:TEina_Bool);cdecl;external;
{*
 * @brief Property to show if inputs are now on hold.
 *
 * @param[in] obj The object.
 *
 * @return @c true if inputs are on hold, @c false otherwise
 *
 * @since 1.23
 *
 * @ingroup Efl_Input_Hold
  }
(* Const before type ignored *)
function efl_input_hold_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_INPUT_HOLD_CLASS : longint; { return type might be wrong }
  begin
    EFL_INPUT_HOLD_CLASS:=efl_input_hold_class_get;
  end;


end.
