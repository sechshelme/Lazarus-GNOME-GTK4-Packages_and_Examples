
unit poppler_structure_element;
interface

{
  Automatically converted by H2Pas 1.0.0 from poppler_structure_element.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    poppler_structure_element.h
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
Pgchar  = ^gchar;
Pgdouble  = ^gdouble;
Pguint  = ^guint;
PPopplerColor  = ^PopplerColor;
PPopplerDocument  = ^PopplerDocument;
PPopplerRectangle  = ^PopplerRectangle;
PPopplerStructureBlockAlign  = ^PopplerStructureBlockAlign;
PPopplerStructureBorderStyle  = ^PopplerStructureBorderStyle;
PPopplerStructureElement  = ^PopplerStructureElement;
PPopplerStructureElementIter  = ^PopplerStructureElementIter;
PPopplerStructureElementKind  = ^PopplerStructureElementKind;
PPopplerStructureFormRole  = ^PopplerStructureFormRole;
PPopplerStructureFormState  = ^PopplerStructureFormState;
PPopplerStructureGetTextFlags  = ^PopplerStructureGetTextFlags;
PPopplerStructureGlyphOrientation  = ^PopplerStructureGlyphOrientation;
PPopplerStructureInlineAlign  = ^PopplerStructureInlineAlign;
PPopplerStructureListNumbering  = ^PopplerStructureListNumbering;
PPopplerStructurePlacement  = ^PopplerStructurePlacement;
PPopplerStructureRubyAlign  = ^PopplerStructureRubyAlign;
PPopplerStructureRubyPosition  = ^PopplerStructureRubyPosition;
PPopplerStructureTableScope  = ^PopplerStructureTableScope;
PPopplerStructureTextAlign  = ^PopplerStructureTextAlign;
PPopplerStructureTextDecoration  = ^PopplerStructureTextDecoration;
PPopplerStructureWritingMode  = ^PopplerStructureWritingMode;
PPopplerTextSpan  = ^PopplerTextSpan;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ poppler-structure-element.h: glib interface to poppler
 *
 * Copyright (C) 2013 Igalia S.L.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street - Fifth Floor, Boston, MA 02110-1301, USA.
  }
{$ifndef __POPPLER_STRUCTURE_ELEMENT_H__}
{$define __POPPLER_STRUCTURE_ELEMENT_H__}
{$include <glib-object.h>}
{$include "poppler.h"}

{ was #define dname def_expr }
function POPPLER_TYPE_STRUCTURE_ELEMENT : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_STRUCTURE_ELEMENT(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_STRUCTURE_ELEMENT(obj : longint) : longint;

{*
 * PopplerStructureElementKind:
  }
type
  PPopplerStructureElementKind = ^TPopplerStructureElementKind;
  TPopplerStructureElementKind =  Longint;
  Const
    POPPLER_STRUCTURE_ELEMENT_CONTENT = 0;
    POPPLER_STRUCTURE_ELEMENT_OBJECT_REFERENCE = 1;
    POPPLER_STRUCTURE_ELEMENT_DOCUMENT = 2;
    POPPLER_STRUCTURE_ELEMENT_PART = 3;
    POPPLER_STRUCTURE_ELEMENT_ARTICLE = 4;
    POPPLER_STRUCTURE_ELEMENT_SECTION = 5;
    POPPLER_STRUCTURE_ELEMENT_DIV = 6;
    POPPLER_STRUCTURE_ELEMENT_SPAN = 7;
    POPPLER_STRUCTURE_ELEMENT_QUOTE = 8;
    POPPLER_STRUCTURE_ELEMENT_NOTE = 9;
    POPPLER_STRUCTURE_ELEMENT_REFERENCE = 10;
    POPPLER_STRUCTURE_ELEMENT_BIBENTRY = 11;
    POPPLER_STRUCTURE_ELEMENT_CODE = 12;
    POPPLER_STRUCTURE_ELEMENT_LINK = 13;
    POPPLER_STRUCTURE_ELEMENT_ANNOT = 14;
    POPPLER_STRUCTURE_ELEMENT_BLOCKQUOTE = 15;
    POPPLER_STRUCTURE_ELEMENT_CAPTION = 16;
    POPPLER_STRUCTURE_ELEMENT_NONSTRUCT = 17;
    POPPLER_STRUCTURE_ELEMENT_TOC = 18;
    POPPLER_STRUCTURE_ELEMENT_TOC_ITEM = 19;
    POPPLER_STRUCTURE_ELEMENT_INDEX = 20;
    POPPLER_STRUCTURE_ELEMENT_PRIVATE = 21;
    POPPLER_STRUCTURE_ELEMENT_PARAGRAPH = 22;
    POPPLER_STRUCTURE_ELEMENT_HEADING = 23;
    POPPLER_STRUCTURE_ELEMENT_HEADING_1 = 24;
    POPPLER_STRUCTURE_ELEMENT_HEADING_2 = 25;
    POPPLER_STRUCTURE_ELEMENT_HEADING_3 = 26;
    POPPLER_STRUCTURE_ELEMENT_HEADING_4 = 27;
    POPPLER_STRUCTURE_ELEMENT_HEADING_5 = 28;
    POPPLER_STRUCTURE_ELEMENT_HEADING_6 = 29;
    POPPLER_STRUCTURE_ELEMENT_LIST = 30;
    POPPLER_STRUCTURE_ELEMENT_LIST_ITEM = 31;
    POPPLER_STRUCTURE_ELEMENT_LIST_LABEL = 32;
    POPPLER_STRUCTURE_ELEMENT_LIST_BODY = 33;
    POPPLER_STRUCTURE_ELEMENT_TABLE = 34;
    POPPLER_STRUCTURE_ELEMENT_TABLE_ROW = 35;
    POPPLER_STRUCTURE_ELEMENT_TABLE_HEADING = 36;
    POPPLER_STRUCTURE_ELEMENT_TABLE_DATA = 37;
    POPPLER_STRUCTURE_ELEMENT_TABLE_HEADER = 38;
    POPPLER_STRUCTURE_ELEMENT_TABLE_FOOTER = 39;
    POPPLER_STRUCTURE_ELEMENT_TABLE_BODY = 40;
    POPPLER_STRUCTURE_ELEMENT_RUBY = 41;
    POPPLER_STRUCTURE_ELEMENT_RUBY_BASE_TEXT = 42;
    POPPLER_STRUCTURE_ELEMENT_RUBY_ANNOT_TEXT = 43;
    POPPLER_STRUCTURE_ELEMENT_RUBY_PUNCTUATION = 44;
    POPPLER_STRUCTURE_ELEMENT_WARICHU = 45;
    POPPLER_STRUCTURE_ELEMENT_WARICHU_TEXT = 46;
    POPPLER_STRUCTURE_ELEMENT_WARICHU_PUNCTUATION = 47;
    POPPLER_STRUCTURE_ELEMENT_FIGURE = 48;
    POPPLER_STRUCTURE_ELEMENT_FORMULA = 49;
    POPPLER_STRUCTURE_ELEMENT_FORM = 50;
;
{*
 * PopplerStructureGetTextFlags:
 * @POPPLER_STRUCTURE_GET_TEXT_NONE: No flags.
 * @POPPLER_STRUCTURE_GET_TEXT_RECURSIVE: For non-leaf, non-content
 *    elements, recursively obtain the text from all the elements
 *    enclosed in the subtree.
  }
type
  PPopplerStructureGetTextFlags = ^TPopplerStructureGetTextFlags;
  TPopplerStructureGetTextFlags =  Longint;
  Const
    POPPLER_STRUCTURE_GET_TEXT_NONE = 0;
    POPPLER_STRUCTURE_GET_TEXT_RECURSIVE = 1 shl 0;
;
{*
 * PopplerStructurePlacement:
  }
type
  PPopplerStructurePlacement = ^TPopplerStructurePlacement;
  TPopplerStructurePlacement =  Longint;
  Const
    POPPLER_STRUCTURE_PLACEMENT_BLOCK = 0;
    POPPLER_STRUCTURE_PLACEMENT_INLINE = 1;
    POPPLER_STRUCTURE_PLACEMENT_BEFORE = 2;
    POPPLER_STRUCTURE_PLACEMENT_START = 3;
    POPPLER_STRUCTURE_PLACEMENT_END = 4;
;
{*
 * PopplerStructureWritingMode:
  }
type
  PPopplerStructureWritingMode = ^TPopplerStructureWritingMode;
  TPopplerStructureWritingMode =  Longint;
  Const
    POPPLER_STRUCTURE_WRITING_MODE_LR_TB = 0;
    POPPLER_STRUCTURE_WRITING_MODE_RL_TB = 1;
    POPPLER_STRUCTURE_WRITING_MODE_TB_RL = 2;
;
{*
 * PopplerStructureBorderStyle:
  }
type
  PPopplerStructureBorderStyle = ^TPopplerStructureBorderStyle;
  TPopplerStructureBorderStyle =  Longint;
  Const
    POPPLER_STRUCTURE_BORDER_STYLE_NONE = 0;
    POPPLER_STRUCTURE_BORDER_STYLE_HIDDEN = 1;
    POPPLER_STRUCTURE_BORDER_STYLE_DOTTED = 2;
    POPPLER_STRUCTURE_BORDER_STYLE_DASHED = 3;
    POPPLER_STRUCTURE_BORDER_STYLE_SOLID = 4;
    POPPLER_STRUCTURE_BORDER_STYLE_DOUBLE = 5;
    POPPLER_STRUCTURE_BORDER_STYLE_GROOVE = 6;
    POPPLER_STRUCTURE_BORDER_STYLE_INSET = 7;
    POPPLER_STRUCTURE_BORDER_STYLE_OUTSET = 8;
;
{*
 * PopplerStructureTextAlign:
  }
type
  PPopplerStructureTextAlign = ^TPopplerStructureTextAlign;
  TPopplerStructureTextAlign =  Longint;
  Const
    POPPLER_STRUCTURE_TEXT_ALIGN_START = 0;
    POPPLER_STRUCTURE_TEXT_ALIGN_CENTER = 1;
    POPPLER_STRUCTURE_TEXT_ALIGN_END = 2;
    POPPLER_STRUCTURE_TEXT_ALIGN_JUSTIFY = 3;
;
{*
 * PopplerStructureBlockAlign:
  }
type
  PPopplerStructureBlockAlign = ^TPopplerStructureBlockAlign;
  TPopplerStructureBlockAlign =  Longint;
  Const
    POPPLER_STRUCTURE_BLOCK_ALIGN_BEFORE = 0;
    POPPLER_STRUCTURE_BLOCK_ALIGN_MIDDLE = 1;
    POPPLER_STRUCTURE_BLOCK_ALIGN_AFTER = 2;
    POPPLER_STRUCTURE_BLOCK_ALIGN_JUSTIFY = 3;
;
{*
 * PopplerStructureInlineAlign:
  }
type
  PPopplerStructureInlineAlign = ^TPopplerStructureInlineAlign;
  TPopplerStructureInlineAlign =  Longint;
  Const
    POPPLER_STRUCTURE_INLINE_ALIGN_START = 0;
    POPPLER_STRUCTURE_INLINE_ALIGN_CENTER = 1;
    POPPLER_STRUCTURE_INLINE_ALIGN_END = 2;
;
{*
 * PopplerStructureTextDecoration:
  }
type
  PPopplerStructureTextDecoration = ^TPopplerStructureTextDecoration;
  TPopplerStructureTextDecoration =  Longint;
  Const
    POPPLER_STRUCTURE_TEXT_DECORATION_NONE = 0;
    POPPLER_STRUCTURE_TEXT_DECORATION_UNDERLINE = 1;
    POPPLER_STRUCTURE_TEXT_DECORATION_OVERLINE = 2;
    POPPLER_STRUCTURE_TEXT_DECORATION_LINETHROUGH = 3;
;
{*
 * PopplerStructureRubyAlign:
  }
type
  PPopplerStructureRubyAlign = ^TPopplerStructureRubyAlign;
  TPopplerStructureRubyAlign =  Longint;
  Const
    POPPLER_STRUCTURE_RUBY_ALIGN_START = 0;
    POPPLER_STRUCTURE_RUBY_ALIGN_CENTER = 1;
    POPPLER_STRUCTURE_RUBY_ALIGN_END = 2;
    POPPLER_STRUCTURE_RUBY_ALIGN_JUSTIFY = 3;
    POPPLER_STRUCTURE_RUBY_ALIGN_DISTRIBUTE = 4;
;
{*
 * PopplerStructureRubyPosition:
  }
type
  PPopplerStructureRubyPosition = ^TPopplerStructureRubyPosition;
  TPopplerStructureRubyPosition =  Longint;
  Const
    POPPLER_STRUCTURE_RUBY_POSITION_BEFORE = 0;
    POPPLER_STRUCTURE_RUBY_POSITION_AFTER = 1;
    POPPLER_STRUCTURE_RUBY_POSITION_WARICHU = 2;
    POPPLER_STRUCTURE_RUBY_POSITION_INLINE = 3;
;
{*
 * PopplerStructureGlyphOrientation:
  }
type
  PPopplerStructureGlyphOrientation = ^TPopplerStructureGlyphOrientation;
  TPopplerStructureGlyphOrientation =  Longint;
  Const
    POPPLER_STRUCTURE_GLYPH_ORIENTATION_AUTO = 0;
    POPPLER_STRUCTURE_GLYPH_ORIENTATION_0 = POPPLER_STRUCTURE_GLYPH_ORIENTATION_AUTO;
    POPPLER_STRUCTURE_GLYPH_ORIENTATION_90 = (POPPLER_STRUCTURE_GLYPH_ORIENTATION_AUTO)+1;
    POPPLER_STRUCTURE_GLYPH_ORIENTATION_180 = (POPPLER_STRUCTURE_GLYPH_ORIENTATION_AUTO)+2;
    POPPLER_STRUCTURE_GLYPH_ORIENTATION_270 = (POPPLER_STRUCTURE_GLYPH_ORIENTATION_AUTO)+3;
;
{*
 * PopplerStructureListNumbering:
  }
type
  PPopplerStructureListNumbering = ^TPopplerStructureListNumbering;
  TPopplerStructureListNumbering =  Longint;
  Const
    POPPLER_STRUCTURE_LIST_NUMBERING_NONE = 0;
    POPPLER_STRUCTURE_LIST_NUMBERING_DISC = 1;
    POPPLER_STRUCTURE_LIST_NUMBERING_CIRCLE = 2;
    POPPLER_STRUCTURE_LIST_NUMBERING_SQUARE = 3;
    POPPLER_STRUCTURE_LIST_NUMBERING_DECIMAL = 4;
    POPPLER_STRUCTURE_LIST_NUMBERING_UPPER_ROMAN = 5;
    POPPLER_STRUCTURE_LIST_NUMBERING_LOWER_ROMAN = 6;
    POPPLER_STRUCTURE_LIST_NUMBERING_UPPER_ALPHA = 7;
    POPPLER_STRUCTURE_LIST_NUMBERING_LOWER_ALPHA = 8;
;
{*
 * PopplerStructureFormRole:
  }
type
  PPopplerStructureFormRole = ^TPopplerStructureFormRole;
  TPopplerStructureFormRole =  Longint;
  Const
    POPPLER_STRUCTURE_FORM_ROLE_UNDEFINED = 0;
    POPPLER_STRUCTURE_FORM_ROLE_RADIO_BUTTON = 1;
    POPPLER_STRUCTURE_FORM_ROLE_PUSH_BUTTON = 2;
    POPPLER_STRUCTURE_FORM_ROLE_TEXT_VALUE = 3;
    POPPLER_STRUCTURE_FORM_ROLE_CHECKBOX = 4;
;
{*
 * PopplerStructureFormState:
  }
type
  PPopplerStructureFormState = ^TPopplerStructureFormState;
  TPopplerStructureFormState =  Longint;
  Const
    POPPLER_STRUCTURE_FORM_STATE_ON = 0;
    POPPLER_STRUCTURE_FORM_STATE_OFF = 1;
    POPPLER_STRUCTURE_FORM_STATE_NEUTRAL = 2;
;
{*
 * PopplerStructureTableScope:
  }
type
  PPopplerStructureTableScope = ^TPopplerStructureTableScope;
  TPopplerStructureTableScope =  Longint;
  Const
    POPPLER_STRUCTURE_TABLE_SCOPE_ROW = 0;
    POPPLER_STRUCTURE_TABLE_SCOPE_COLUMN = 1;
    POPPLER_STRUCTURE_TABLE_SCOPE_BOTH = 2;
;

function poppler_structure_element_get_type:TGType;cdecl;external;
function poppler_structure_element_get_kind(poppler_structure_element:PPopplerStructureElement):TPopplerStructureElementKind;cdecl;external;
function poppler_structure_element_get_page(poppler_structure_element:PPopplerStructureElement):Tgint;cdecl;external;
function poppler_structure_element_is_content(poppler_structure_element:PPopplerStructureElement):Tgboolean;cdecl;external;
function poppler_structure_element_is_inline(poppler_structure_element:PPopplerStructureElement):Tgboolean;cdecl;external;
function poppler_structure_element_is_block(poppler_structure_element:PPopplerStructureElement):Tgboolean;cdecl;external;
function poppler_structure_element_is_grouping(poppler_structure_element:PPopplerStructureElement):Tgboolean;cdecl;external;
function poppler_structure_element_get_id(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_title(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_abbreviation(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_language(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_text(poppler_structure_element:PPopplerStructureElement; flags:TPopplerStructureGetTextFlags):Pgchar;cdecl;external;
function poppler_structure_element_get_alt_text(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_actual_text(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_text_spans(poppler_structure_element:PPopplerStructureElement; n_text_spans:Pguint):^PPopplerTextSpan;cdecl;external;
function poppler_structure_element_get_placement(poppler_structure_element:PPopplerStructureElement):TPopplerStructurePlacement;cdecl;external;
function poppler_structure_element_get_writing_mode(poppler_structure_element:PPopplerStructureElement):TPopplerStructureWritingMode;cdecl;external;
function poppler_structure_element_get_background_color(poppler_structure_element:PPopplerStructureElement; color:PPopplerColor):Tgboolean;cdecl;external;
function poppler_structure_element_get_border_color(poppler_structure_element:PPopplerStructureElement; colors:PPopplerColor):Tgboolean;cdecl;external;
procedure poppler_structure_element_get_border_style(poppler_structure_element:PPopplerStructureElement; border_styles:PPopplerStructureBorderStyle);cdecl;external;
function poppler_structure_element_get_border_thickness(poppler_structure_element:PPopplerStructureElement; border_thicknesses:Pgdouble):Tgboolean;cdecl;external;
procedure poppler_structure_element_get_padding(poppler_structure_element:PPopplerStructureElement; paddings:Pgdouble);cdecl;external;
function poppler_structure_element_get_color(poppler_structure_element:PPopplerStructureElement; color:PPopplerColor):Tgboolean;cdecl;external;
function poppler_structure_element_get_space_before(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_space_after(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_start_indent(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_end_indent(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_text_indent(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_text_align(poppler_structure_element:PPopplerStructureElement):TPopplerStructureTextAlign;cdecl;external;
function poppler_structure_element_get_bounding_box(poppler_structure_element:PPopplerStructureElement; bounding_box:PPopplerRectangle):Tgboolean;cdecl;external;
function poppler_structure_element_get_width(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_height(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_block_align(poppler_structure_element:PPopplerStructureElement):TPopplerStructureBlockAlign;cdecl;external;
function poppler_structure_element_get_inline_align(poppler_structure_element:PPopplerStructureElement):TPopplerStructureInlineAlign;cdecl;external;
procedure poppler_structure_element_get_table_border_style(poppler_structure_element:PPopplerStructureElement; border_styles:PPopplerStructureBorderStyle);cdecl;external;
procedure poppler_structure_element_get_table_padding(poppler_structure_element:PPopplerStructureElement; paddings:Pgdouble);cdecl;external;
function poppler_structure_element_get_baseline_shift(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_line_height(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_text_decoration_color(poppler_structure_element:PPopplerStructureElement; color:PPopplerColor):Tgboolean;cdecl;external;
function poppler_structure_element_get_text_decoration_thickness(poppler_structure_element:PPopplerStructureElement):Tgdouble;cdecl;external;
function poppler_structure_element_get_text_decoration_type(poppler_structure_element:PPopplerStructureElement):TPopplerStructureTextDecoration;cdecl;external;
function poppler_structure_element_get_ruby_align(poppler_structure_element:PPopplerStructureElement):TPopplerStructureRubyAlign;cdecl;external;
function poppler_structure_element_get_ruby_position(poppler_structure_element:PPopplerStructureElement):TPopplerStructureRubyPosition;cdecl;external;
function poppler_structure_element_get_glyph_orientation(poppler_structure_element:PPopplerStructureElement):TPopplerStructureGlyphOrientation;cdecl;external;
function poppler_structure_element_get_column_count(poppler_structure_element:PPopplerStructureElement):Tguint;cdecl;external;
function poppler_structure_element_get_column_gaps(poppler_structure_element:PPopplerStructureElement; n_values:Pguint):Pgdouble;cdecl;external;
function poppler_structure_element_get_column_widths(poppler_structure_element:PPopplerStructureElement; n_values:Pguint):Pgdouble;cdecl;external;
function poppler_structure_element_get_list_numbering(poppler_structure_element:PPopplerStructureElement):TPopplerStructureListNumbering;cdecl;external;
function poppler_structure_element_get_form_role(poppler_structure_element:PPopplerStructureElement):TPopplerStructureFormRole;cdecl;external;
function poppler_structure_element_get_form_state(poppler_structure_element:PPopplerStructureElement):TPopplerStructureFormState;cdecl;external;
function poppler_structure_element_get_form_description(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
function poppler_structure_element_get_table_row_span(poppler_structure_element:PPopplerStructureElement):Tguint;cdecl;external;
function poppler_structure_element_get_table_column_span(poppler_structure_element:PPopplerStructureElement):Tguint;cdecl;external;
function poppler_structure_element_get_table_headers(poppler_structure_element:PPopplerStructureElement):^Pgchar;cdecl;external;
function poppler_structure_element_get_table_scope(poppler_structure_element:PPopplerStructureElement):TPopplerStructureTableScope;cdecl;external;
function poppler_structure_element_get_table_summary(poppler_structure_element:PPopplerStructureElement):Pgchar;cdecl;external;
{ was #define dname def_expr }
function POPPLER_TYPE_STRUCTURE_ELEMENT_ITER : longint; { return type might be wrong }

function poppler_structure_element_iter_get_type:TGType;cdecl;external;
function poppler_structure_element_iter_new(poppler_document:PPopplerDocument):PPopplerStructureElementIter;cdecl;external;
function poppler_structure_element_iter_get_child(parent:PPopplerStructureElementIter):PPopplerStructureElementIter;cdecl;external;
function poppler_structure_element_iter_copy(iter:PPopplerStructureElementIter):PPopplerStructureElementIter;cdecl;external;
function poppler_structure_element_iter_get_element(iter:PPopplerStructureElementIter):PPopplerStructureElement;cdecl;external;
function poppler_structure_element_iter_next(iter:PPopplerStructureElementIter):Tgboolean;cdecl;external;
procedure poppler_structure_element_iter_free(iter:PPopplerStructureElementIter);cdecl;external;
{ was #define dname def_expr }
function POPPLER_TYPE_TEXT_SPAN : longint; { return type might be wrong }

function poppler_text_span_get_type:TGType;cdecl;external;
function poppler_text_span_copy(poppler_text_span:PPopplerTextSpan):PPopplerTextSpan;cdecl;external;
procedure poppler_text_span_free(poppler_text_span:PPopplerTextSpan);cdecl;external;
function poppler_text_span_is_fixed_width_font(poppler_text_span:PPopplerTextSpan):Tgboolean;cdecl;external;
function poppler_text_span_is_serif_font(poppler_text_span:PPopplerTextSpan):Tgboolean;cdecl;external;
function poppler_text_span_is_bold_font(poppler_text_span:PPopplerTextSpan):Tgboolean;cdecl;external;
procedure poppler_text_span_get_color(poppler_text_span:PPopplerTextSpan; color:PPopplerColor);cdecl;external;
(* Const before type ignored *)
function poppler_text_span_get_text(poppler_text_span:PPopplerTextSpan):Pgchar;cdecl;external;
(* Const before type ignored *)
function poppler_text_span_get_font_name(poppler_text_span:PPopplerTextSpan):Pgchar;cdecl;external;
{$endif}
{ !__POPPLER_STRUCTURE_ELEMENT_H__  }

implementation

{ was #define dname def_expr }
function POPPLER_TYPE_STRUCTURE_ELEMENT : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_STRUCTURE_ELEMENT:=poppler_structure_element_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_STRUCTURE_ELEMENT(obj : longint) : longint;
begin
  POPPLER_STRUCTURE_ELEMENT:=G_TYPE_CHECK_INSTANCE_CAST(obj,POPPLER_TYPE_STRUCTURE_ELEMENT,PopplerStructureElement);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function POPPLER_IS_STRUCTURE_ELEMENT(obj : longint) : longint;
begin
  POPPLER_IS_STRUCTURE_ELEMENT:=G_TYPE_CHECK_INSTANCE_TYPE(obj,POPPLER_TYPE_STRUCTURE_ELEMENT);
end;

{ was #define dname def_expr }
function POPPLER_TYPE_STRUCTURE_ELEMENT_ITER : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_STRUCTURE_ELEMENT_ITER:=poppler_structure_element_iter_get_type;
  end;

{ was #define dname def_expr }
function POPPLER_TYPE_TEXT_SPAN : longint; { return type might be wrong }
  begin
    POPPLER_TYPE_TEXT_SPAN:=poppler_text_span_get_type;
  end;


end.
