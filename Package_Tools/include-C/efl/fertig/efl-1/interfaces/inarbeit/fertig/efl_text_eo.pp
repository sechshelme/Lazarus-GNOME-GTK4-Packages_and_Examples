
unit efl_text_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Text  = ^Efl_Text;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_EO_H_}
{$define _EFL_TEXT_EO_H_}
{$ifndef _EFL_TEXT_EO_CLASS_TYPE}
{$define _EFL_TEXT_EO_CLASS_TYPE}
type
  PEfl_Text = ^TEfl_Text;
  TEfl_Text = TEo;
{$endif}
{$ifndef _EFL_TEXT_EO_TYPES}
{$define _EFL_TEXT_EO_TYPES}
{$endif}
{* Efl text interface
 *
 * @since 1.22
 *
 * @ingroup Efl_Text
  }

{ was #define dname def_expr }
function EFL_TEXT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The text string to be displayed by the given text object.
 *
 * Do not release (free) the returned value.
 *
 * @param[in] obj The object.
 * @param[in] text Text string to display.
 *
 * @since 1.22
 *
 * @ingroup Efl_Text
  }
(* Const before type ignored *)
procedure efl_text_set(obj:PEo; text:Pchar);cdecl;external;
{*
 * @brief The text string to be displayed by the given text object.
 *
 * Do not release (free) the returned value.
 *
 * @param[in] obj The object.
 *
 * @return Text string to display.
 *
 * @since 1.22
 *
 * @ingroup Efl_Text
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_get(obj:PEo):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_INTERFACE:=efl_text_interface_get;
  end;


end.
