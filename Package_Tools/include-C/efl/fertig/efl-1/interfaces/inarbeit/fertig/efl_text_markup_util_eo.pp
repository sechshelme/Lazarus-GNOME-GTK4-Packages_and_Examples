
unit efl_text_markup_util_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_markup_util_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_markup_util_eo.h
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
PEfl_Text_Markup_Util  = ^Efl_Text_Markup_Util;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_MARKUP_UTIL_EO_H_}
{$define _EFL_TEXT_MARKUP_UTIL_EO_H_}
{$ifndef _EFL_TEXT_MARKUP_UTIL_EO_CLASS_TYPE}
{$define _EFL_TEXT_MARKUP_UTIL_EO_CLASS_TYPE}
type
  PEfl_Text_Markup_Util = ^TEfl_Text_Markup_Util;
  TEfl_Text_Markup_Util = TEo;
{$endif}
{$ifndef _EFL_TEXT_MARKUP_UTIL_EO_TYPES}
{$define _EFL_TEXT_MARKUP_UTIL_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Utility class for markup, such as conversions
 *
 * @ingroup Efl_Text_Markup_Util
  }

{ was #define dname def_expr }
function EFL_TEXT_MARKUP_UTIL_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_markup_util_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Converts a given (UTF-8) text to a markup-compatible string. This is
 * used mainly to set a plain text with @ref efl_text_markup_set.
 *
 * @param[in] text The text (UTF-8) to convert to markup.
 *
 * @return The markup representation of given text.
 *
 * @ingroup Efl_Text_Markup_Util
  }
(* Const before type ignored *)
function efl_text_markup_util_text_to_markup(text:Pchar):Pchar;cdecl;external;
{*
 * @brief Converts a markup string to a (UTF-8) plain text. This is used mainly
 * to set a markup text with the @ref efl_text_set.
 *
 * @param[in] text The markup-text to convert to text (UTF-8).
 *
 * @return The text representation of given markup string.
 *
 * @ingroup Efl_Text_Markup_Util
  }
(* Const before type ignored *)
function efl_text_markup_util_markup_to_text(text:Pchar):Pchar;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_MARKUP_UTIL_CLASS : longint; { return type might be wrong }
  begin
    EFL_TEXT_MARKUP_UTIL_CLASS:=efl_text_markup_util_class_get;
  end;


end.
