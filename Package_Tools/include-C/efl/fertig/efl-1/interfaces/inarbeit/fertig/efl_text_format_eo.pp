
unit efl_text_format_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_text_format_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_text_format_eo.h
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
PEfl_Text_Format  = ^Efl_Text_Format;
PEfl_Text_Format_Horizontal_Alignment_Auto_Type  = ^Efl_Text_Format_Horizontal_Alignment_Auto_Type;
PEfl_Text_Format_Wrap  = ^Efl_Text_Format_Wrap;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_TEXT_FORMAT_EO_H_}
{$define _EFL_TEXT_FORMAT_EO_H_}
{$ifndef _EFL_TEXT_FORMAT_EO_CLASS_TYPE}
{$define _EFL_TEXT_FORMAT_EO_CLASS_TYPE}
type
  PEfl_Text_Format = ^TEfl_Text_Format;
  TEfl_Text_Format = TEo;
{$endif}
{$ifndef _EFL_TEXT_FORMAT_EO_TYPES}
{$define _EFL_TEXT_FORMAT_EO_TYPES}
{* Wrapping policy for the text.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format_Wrap
  }
{*< No wrapping.
                                  *
                                  * @since 1.24  }
{*< Wrap at character boundaries.
                              *
                              * @since 1.24  }
{*< Wrap at word boundaries.
                              *
                              * @since 1.24  }
{*< Wrap at word boundaries if possible, at any
                               * character if not.
                               *
                               * @since 1.24  }
{*< Hyphenate if possible, otherwise try
                                    * word boundaries or at any character.
                                    *
                                    * @since 1.24  }
type
  PEfl_Text_Format_Wrap = ^TEfl_Text_Format_Wrap;
  TEfl_Text_Format_Wrap =  Longint;
  Const
    EFL_TEXT_FORMAT_WRAP_NONE = 0;
    EFL_TEXT_FORMAT_WRAP_CHAR = 1;
    EFL_TEXT_FORMAT_WRAP_WORD = 2;
    EFL_TEXT_FORMAT_WRAP_MIXED = 3;
    EFL_TEXT_FORMAT_WRAP_HYPHENATION = 4;
;
{* Automatic horizontal alignment setting for the text (Left-To-Right or
 * Right-To-Left).
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format_Horizontal_Alignment_Auto_Type
  }
{*< No
                                                            * auto-alignment
                                                            * rule: Horizontal
                                                            * Alignment is
                                                            * decided by
                                                            * @ref efl_text_horizontal_align_get
                                                            *
                                                            * @since 1.24  }
{*< Respects LTR/RTL
                                                        * (bidirectional)
                                                        * characters found
                                                        * inside the text
                                                        * content.
                                                        *
                                                        * @since 1.24  }
{*< Respects the
                                                          * system's language
                                                          * settings.
                                                          *
                                                          * @since 1.24  }
{*< Text is placed at
                                                           * opposite side of
                                                           * LTR/RTL
                                                           * (bidirectional)
                                                           * settings.
                                                           *
                                                           * @since 1.24  }
type
  PEfl_Text_Format_Horizontal_Alignment_Auto_Type = ^TEfl_Text_Format_Horizontal_Alignment_Auto_Type;
  TEfl_Text_Format_Horizontal_Alignment_Auto_Type =  Longint;
  Const
    EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE = 0;
    EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_AUTO = 1;
    EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_LOCALE = 2;
    EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_OPPOSITE = 3;
;
{$endif}
{*
 * @brief The look and layout of the text.
 *
 * The text format can affect the geometry of the text object, as well as how
 * characters are presented.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }

{ was #define dname def_expr }
function EFL_TEXT_FORMAT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_text_format_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Controls automatic addition of ellipsis "..." to replace text which
 * cannot be shown. The value must be a number indicating the position of the
 * ellipsis inside the visible text. <tt>0.0</tt> means the beginning of
 * the text, <tt>1.0</tt> means the end of the text, and values in between
 * mean the proportional position inside the text. Any value smaller than 0 or
 * greater than 1 disables ellipsis.
 *
 * @param[in] obj The object.
 * @param[in] value Position of the ellipsis inside the text, from
 * <tt>0.0</tt> to <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_ellipsis_set(obj:PEo; value:Tdouble);cdecl;external;
{*
 * @brief Controls automatic addition of ellipsis "..." to replace text which
 * cannot be shown. The value must be a number indicating the position of the
 * ellipsis inside the visible text. <tt>0.0</tt> means the beginning of
 * the text, <tt>1.0</tt> means the end of the text, and values in between
 * mean the proportional position inside the text. Any value smaller than 0 or
 * greater than 1 disables ellipsis.
 *
 * @param[in] obj The object.
 *
 * @return Position of the ellipsis inside the text, from <tt>0.0</tt> to
 * <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_ellipsis_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Wrapping policy for the text.
 *
 * When text does not fit the widget in a single line, it can be automatically
 * wrapped at character or word boundaries, for example.
 *
 * Requires @ref efl_text_multiline_get to be @c true.
 *
 * @param[in] obj The object.
 * @param[in] wrap Wrapping policy.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_wrap_set(obj:PEo; wrap:TEfl_Text_Format_Wrap);cdecl;external;
{*
 * @brief Wrapping policy for the text.
 *
 * When text does not fit the widget in a single line, it can be automatically
 * wrapped at character or word boundaries, for example.
 *
 * Requires @ref efl_text_multiline_get to be @c true.
 *
 * @param[in] obj The object.
 *
 * @return Wrapping policy.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_wrap_get(obj:PEo):TEfl_Text_Format_Wrap;cdecl;external;
{*
 * @brief Enables text to span multiple lines.
 *
 * When @c false, new-line characters are ignored and no text wrapping occurs.
 *
 * @param[in] obj The object.
 * @param[in] enabled @c true if multiple lines should be rendered.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_multiline_set(obj:PEo; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Enables text to span multiple lines.
 *
 * When @c false, new-line characters are ignored and no text wrapping occurs.
 *
 * @param[in] obj The object.
 *
 * @return @c true if multiple lines should be rendered.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_multiline_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Specifies when the text's horizontal alignment should be set
 * automatically.
 *
 * @param[in] obj The object.
 * @param[in] value Automatic horizontal alignment type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_horizontal_align_auto_type_set(obj:PEo; value:TEfl_Text_Format_Horizontal_Alignment_Auto_Type);cdecl;external;
{*
 * @brief Specifies when the text's horizontal alignment should be set
 * automatically.
 *
 * @param[in] obj The object.
 *
 * @return Automatic horizontal alignment type.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_horizontal_align_auto_type_get(obj:PEo):TEfl_Text_Format_Horizontal_Alignment_Auto_Type;cdecl;external;
{*
 * @brief Manual horizontal alignment of text. <tt>0.0</tt> means "left"
 * and <tt>1.0</tt> means "right". Setting this value also sets
 * @ref efl_text_horizontal_align_auto_type_get to
 * @ref EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE. This value is
 * ignored when @ref efl_text_horizontal_align_auto_type_get is set to anything
 * other than @ref EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE.
 *
 * @param[in] obj The object.
 * @param[in] value Alignment value between <tt>0.0</tt> and
 * <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_horizontal_align_set(obj:PEo; value:Tdouble);cdecl;external;
{*
 * @brief Manual horizontal alignment of text. <tt>0.0</tt> means "left"
 * and <tt>1.0</tt> means "right". Setting this value also sets
 * @ref efl_text_horizontal_align_auto_type_get to
 * @ref EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE. This value is
 * ignored when @ref efl_text_horizontal_align_auto_type_get is set to anything
 * other than @ref EFL_TEXT_FORMAT_HORIZONTAL_ALIGNMENT_AUTO_TYPE_NONE.
 *
 * @param[in] obj The object.
 *
 * @return Alignment value between <tt>0.0</tt> and <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_horizontal_align_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Vertical alignment of text. <tt>0.0</tt> means "top" and
 * <tt>1.0</tt> means "bottom"
 *
 * @param[in] obj The object.
 * @param[in] value Alignment value between <tt>0.0</tt> and
 * <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_vertical_align_set(obj:PEo; value:Tdouble);cdecl;external;
{*
 * @brief Vertical alignment of text. <tt>0.0</tt> means "top" and
 * <tt>1.0</tt> means "bottom"
 *
 * @param[in] obj The object.
 *
 * @return Alignment value between <tt>0.0</tt> and <tt>1.0</tt>.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_vertical_align_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Minimal line gap (top and bottom) for each line in the text.
 *
 * @c value is absolute size.
 *
 * @param[in] obj The object.
 * @param[in] value Line gap value, in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_line_gap_set(obj:PEo; value:Tdouble);cdecl;external;
{*
 * @brief Minimal line gap (top and bottom) for each line in the text.
 *
 * @c value is absolute size.
 *
 * @param[in] obj The object.
 *
 * @return Line gap value, in pixels.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_line_gap_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Relative line gap (top and bottom) for each line in the text.
 *
 * The original line gap value is multiplied by @c value.
 *
 * @param[in] obj The object.
 * @param[in] value Relative line gap value. <tt>1.0</tt> means original
 * size.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_line_rel_gap_set(obj:PEo; value:Tdouble);cdecl;external;
{*
 * @brief Relative line gap (top and bottom) for each line in the text.
 *
 * The original line gap value is multiplied by @c value.
 *
 * @param[in] obj The object.
 *
 * @return Relative line gap value. <tt>1.0</tt> means original size.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_line_rel_gap_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Size (in pixels) of the tab character.
 *
 * @param[in] obj The object.
 * @param[in] value Size in pixels, greater than 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_tab_stops_set(obj:PEo; value:longint);cdecl;external;
{*
 * @brief Size (in pixels) of the tab character.
 *
 * @param[in] obj The object.
 *
 * @return Size in pixels, greater than 1.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_tab_stops_get(obj:PEo):longint;cdecl;external;
{*
 * @brief Enabling this causes all characters to be replaced by
 * @ref efl_text_replacement_char_get.
 *
 * This is useful for password input boxes.
 *
 * @param[in] obj The object.
 * @param[in] enabled @c true if the text is a password.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
procedure efl_text_password_set(obj:PEo; enabled:TEina_Bool);cdecl;external;
{*
 * @brief Enabling this causes all characters to be replaced by
 * @ref efl_text_replacement_char_get.
 *
 * This is useful for password input boxes.
 *
 * @param[in] obj The object.
 *
 * @return @c true if the text is a password.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
function efl_text_password_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The character used to replace characters that can't be displayed.
 *
 * Only used to replace characters if @ref efl_text_password_get is enabled.
 *
 * @param[in] obj The object.
 * @param[in] repch Replacement character.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
procedure efl_text_replacement_char_set(obj:PEo; repch:Pchar);cdecl;external;
{*
 * @brief The character used to replace characters that can't be displayed.
 *
 * Only used to replace characters if @ref efl_text_password_get is enabled.
 *
 * @param[in] obj The object.
 *
 * @return Replacement character.
 *
 * @since 1.24
 *
 * @ingroup Efl_Text_Format
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_text_replacement_char_get(obj:PEo):Pchar;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_TEXT_FORMAT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_TEXT_FORMAT_INTERFACE:=efl_text_format_interface_get;
  end;


end.
