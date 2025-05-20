
unit efl_text_markup_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_markup_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_markup_eo.h
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
PEfl_Text_Markup  = ^Efl_Text_Markup;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_MARKUP_EO_H_}
{$define _EFL_TEXT_MARKUP_EO_H_}
{$ifndef _EFL_TEXT_MARKUP_EO_CLASS_TYPE}
{$define _EFL_TEXT_MARKUP_EO_CLASS_TYPE}
type
  PEfl_Text_Markup = ^TEfl_Text_Markup;
  TEfl_Text_Markup = TEo;
{$endif}
{$ifndef _EFL_TEXT_MARKUP_EO_TYPES}
{$define _EFL_TEXT_MARKUP_EO_TYPES}
{$endif}
{* Markup data that populates the text object's style and format
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Markup
  }

{ was #define dname def_expr }
function EFL_TEXT_MARKUP_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_markup_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Markup property
 *
 * @param[in] obj The object.
 * @param[in] markup The markup-text representation set to this text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Markup
  }
(* Const before type ignored *)
procedure efl_text_markup_set(obj:PEo; markup:Pchar);cdecl;external;
{*
 * @brief Markup property
 *
 * @param[in] obj The object.
 *
 * @return The markup-text representation set to this text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Markup
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_markup_get(obj:PEo):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_MARKUP_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_MARKUP_INTERFACE:=efl_text_markup_interface_get;
  end;


end.
