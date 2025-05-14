
unit efl_text_formatter_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_formatter_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_formatter_eo.h
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
PEfl_Text_Cursor_Object  = ^Efl_Text_Cursor_Object;
PEfl_Text_Formatter  = ^Efl_Text_Formatter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_FORMATTER_EO_H_}
{$define _EFL_TEXT_FORMATTER_EO_H_}
{$ifndef _EFL_TEXT_FORMATTER_EO_CLASS_TYPE}
{$define _EFL_TEXT_FORMATTER_EO_CLASS_TYPE}
type
  PEfl_Text_Formatter = ^TEfl_Text_Formatter;
  TEfl_Text_Formatter = TEo;
{$endif}
{$ifndef _EFL_TEXT_FORMATTER_EO_TYPES}
{$define _EFL_TEXT_FORMATTER_EO_TYPES}
{$endif}
{*
 * @brief Text Formatter API to manage text formatting(attributes). Use it to
 * insert and remove style attributes (font, size, color, ...) using
 * @ref Efl_Text_Cursor_Object on EFL Widgets.
 *
 * Attributes can be assigned to character ranges, selected using two
 * @ref Efl_Text_Cursor_Object instances. Cursor instances are already bound to
 * a text object so there's no need to provide it to this class. Style is
 * specified using format strings as described in
 * @ref efl_canvas_textblock_style_apply.
 *
 * There is no need to instantiate this class. Use directly the
 * @ref efl_text_formatter_attribute_insert and
 * @ref efl_text_formatter_attribute_clear static methods.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Formatter
  }

{ was #define dname def_expr }
function EFL_TEXT_FORMATTER_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_formatter_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Inserts an attribute format in a specified range [$start, @c end -
 * 1].
 *
 * The @c format will be applied to the given range. The passed cursors must
 * belong to same text object, otherwise insertion will be ignored.
 *
 * @param[in] start Start of range.
 * @param[in] end End of range.
 * @param[in] format Format string. Uses same format as @c style in
 * @ref efl_canvas_textblock_style_apply.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Formatter
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_text_formatter_attribute_insert(start:PEfl_Text_Cursor_Object; end:PEfl_Text_Cursor_Object; format:Pchar);cdecl;external;
{*
 * @brief Clear (remove) attributes in the specified range [$start, @c end -
 * 1].
 *
 * @param[in] start Start of range.
 * @param[in] end End of range.
 *
 * @return Number of removed attributes.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Formatter
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_formatter_attribute_clear(start:PEfl_Text_Cursor_Object; end:PEfl_Text_Cursor_Object):dword;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_FORMATTER_CLASS : longint; { return type might be wrong }
  begin
    EFL_TEXT_FORMATTER_CLASS:=efl_text_formatter_class_get;
  end;


end.
