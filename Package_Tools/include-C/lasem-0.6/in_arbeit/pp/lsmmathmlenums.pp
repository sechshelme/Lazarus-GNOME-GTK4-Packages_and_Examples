
unit lsmmathmlenums;
interface

{
  Automatically converted by H2Pas 1.0.0 from lsmmathmlenums.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    lsmmathmlenums.h
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
PLsmMathmlColumnAlign  = ^LsmMathmlColumnAlign;
PLsmMathmlCssType  = ^LsmMathmlCssType;
PLsmMathmlDisplay  = ^LsmMathmlDisplay;
PLsmMathmlFontStyle  = ^LsmMathmlFontStyle;
PLsmMathmlFontWeight  = ^LsmMathmlFontWeight;
PLsmMathmlForm  = ^LsmMathmlForm;
PLsmMathmlLine  = ^LsmMathmlLine;
PLsmMathmlLinebreak  = ^LsmMathmlLinebreak;
PLsmMathmlMode  = ^LsmMathmlMode;
PLsmMathmlNotation  = ^LsmMathmlNotation;
PLsmMathmlRowAlign  = ^LsmMathmlRowAlign;
PLsmMathmlScriptLevelSign  = ^LsmMathmlScriptLevelSign;
PLsmMathmlSpaceName  = ^LsmMathmlSpaceName;
PLsmMathmlUnit  = ^LsmMathmlUnit;
PLsmMathmlVariant  = ^LsmMathmlVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Lasem
 *
 * Copyright © 2007-2008 Emmanuel Pacaud
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1335, USA.
 *
 * Author:
 * 	Emmanuel Pacaud <emmanuel@gnome.org>
  }
{$ifndef LSM_MATHML_ENUMS_H}
{$define LSM_MATHML_ENUMS_H}
{$include <glib-object.h>}
type
  PLsmMathmlCssType = ^TLsmMathmlCssType;
  TLsmMathmlCssType =  Longint;
  Const
    LSM_MATHML_CSS_TYPE_USER = 0;
    LSM_MATHML_CSS_TYPE_AUTHOR = 1;
    LSM_MATHML_CSS_TYPE_AUTHOR_IMPORTANT = 2;
    LSM_MATHML_CSS_TYPE_USER_IMPORTANT = 3;
;
type
  PLsmMathmlMode = ^TLsmMathmlMode;
  TLsmMathmlMode =  Longint;
  Const
    LSM_MATHML_MODE_ERROR = -(1);
    LSM_MATHML_MODE_DISPLAY = (-(1))+1;
    LSM_MATHML_MODE_INLINE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_mathml_mode_to_string(mode:TLsmMathmlMode):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_mode_from_string(_string:Pchar):TLsmMathmlMode;cdecl;external;
type
  PLsmMathmlDisplay = ^TLsmMathmlDisplay;
  TLsmMathmlDisplay =  Longint;
  Const
    LSM_MATHML_DISPLAY_ERROR = -(1);
    LSM_MATHML_DISPLAY_BLOCK = (-(1))+1;
    LSM_MATHML_DISPLAY_INLINE = (-(1))+2;
;
(* Const before type ignored *)

function lsm_mathml_display_to_string(display:TLsmMathmlDisplay):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_display_from_string(_string:Pchar):TLsmMathmlDisplay;cdecl;external;
type
  PLsmMathmlSpaceName = ^TLsmMathmlSpaceName;
  TLsmMathmlSpaceName =  Longint;
  Const
    LSM_MATHML_SPACE_NAME_ERROR = -(1);
    LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_VERY_THIN = (-(1))+1;
    LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_THIN = (-(1))+2;
    LSM_MATHML_SPACE_NAME_NEGATIVE_THIN = (-(1))+3;
    LSM_MATHML_SPACE_NAME_NEGATIVE_MEDIUM = (-(1))+4;
    LSM_MATHML_SPACE_NAME_NEGATIVE_THICK = (-(1))+5;
    LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_THICK = (-(1))+6;
    LSM_MATHML_SPACE_NAME_NEGATIVE_VERY_VERY_THICK = (-(1))+7;
    LSM_MATHML_SPACE_NAME_VERY_VERY_THIN = (-(1))+8;
    LSM_MATHML_SPACE_NAME_VERY_THIN = (-(1))+9;
    LSM_MATHML_SPACE_NAME_THIN = (-(1))+10;
    LSM_MATHML_SPACE_NAME_MEDIUM = (-(1))+11;
    LSM_MATHML_SPACE_NAME_THICK = (-(1))+12;
    LSM_MATHML_SPACE_NAME_VERY_THICK = (-(1))+13;
    LSM_MATHML_SPACE_NAME_VERY_VERY_THICK = (-(1))+14;
    LSM_MATHML_SPACE_NAME_INFINITY = (-(1))+15;
;
(* Const before type ignored *)

function lsm_mathml_space_name_to_string(name:TLsmMathmlSpaceName):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_space_name_from_string(_string:Pchar):TLsmMathmlSpaceName;cdecl;external;
type
  PLsmMathmlUnit = ^TLsmMathmlUnit;
  TLsmMathmlUnit =  Longint;
  Const
    LSM_MATHML_UNIT_ERROR = -(1);
    LSM_MATHML_UNIT_NONE = (-(1))+1;
    LSM_MATHML_UNIT_EM = (-(1))+2;
    LSM_MATHML_UNIT_EX = (-(1))+3;
    LSM_MATHML_UNIT_IN = (-(1))+4;
    LSM_MATHML_UNIT_CM = (-(1))+5;
    LSM_MATHML_UNIT_MM = (-(1))+6;
    LSM_MATHML_UNIT_PT = (-(1))+7;
    LSM_MATHML_UNIT_PX = (-(1))+8;
    LSM_MATHML_UNIT_PC = (-(1))+9;
    LSM_MATHML_UNIT_PERCENT = (-(1))+10;
;
(* Const before type ignored *)

function lsm_mathml_unit_to_string(unit:TLsmMathmlUnit):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_unit_from_string(_string:Pchar):TLsmMathmlUnit;cdecl;external;
type
  PLsmMathmlFontStyle = ^TLsmMathmlFontStyle;
  TLsmMathmlFontStyle =  Longint;
  Const
    LSM_MATHML_FONT_STYLE_ERROR = -(1);
    LSM_MATHML_FONT_STYLE_NORMAL = (-(1))+1;
    LSM_MATHML_FONT_STYLE_ITALIC = (-(1))+2;
;
(* Const before type ignored *)

function lsm_mathml_font_style_to_string(font_style:TLsmMathmlFontStyle):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_font_style_from_string(_string:Pchar):TLsmMathmlFontStyle;cdecl;external;
type
  PLsmMathmlFontWeight = ^TLsmMathmlFontWeight;
  TLsmMathmlFontWeight =  Longint;
  Const
    LSM_MATHML_FONT_WEIGHT_ERROR = -(1);
    LSM_MATHML_FONT_WEIGHT_NORMAL = (-(1))+1;
    LSM_MATHML_FONT_WEIGHT_BOLD = (-(1))+2;
;
(* Const before type ignored *)

function lsm_mathml_font_weight_to_string(font_weight:TLsmMathmlFontWeight):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_font_weight_from_string(_string:Pchar):TLsmMathmlFontWeight;cdecl;external;
{ Keep in sync with lsm_mathml_pango_options in lsm_mathml_view  }
type
  PLsmMathmlVariant = ^TLsmMathmlVariant;
  TLsmMathmlVariant =  Longint;
  Const
    LSM_MATHML_VARIANT_ERROR = -(1);
    LSM_MATHML_VARIANT_NORMAL = (-(1))+1;
    LSM_MATHML_VARIANT_BOLD = (-(1))+2;
    LSM_MATHML_VARIANT_ITALIC = (-(1))+3;
    LSM_MATHML_VARIANT_BOLD_ITALIC = (-(1))+4;
    LSM_MATHML_VARIANT_DOUBLE_STRUCK = (-(1))+5;
    LSM_MATHML_VARIANT_FRAKTUR_BOLD = (-(1))+6;
    LSM_MATHML_VARIANT_SCRIPT = (-(1))+7;
    LSM_MATHML_VARIANT_SCRIPT_BOLD = (-(1))+8;
    LSM_MATHML_VARIANT_FRAKTUR = (-(1))+9;
    LSM_MATHML_VARIANT_SANS_SERIF = (-(1))+10;
    LSM_MATHML_VARIANT_SANS_SERIF_BOLD = (-(1))+11;
    LSM_MATHML_VARIANT_SANS_SERIF_ITALIC = (-(1))+12;
    LSM_MATHML_VARIANT_SANS_SERIF_BOLD_ITALIC = (-(1))+13;
    LSM_MATHML_VARIANT_MONOSPACE = (-(1))+14;
;
(* Const before type ignored *)

function lsm_mathml_variant_to_string(variant:TLsmMathmlVariant):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_variant_from_string(_string:Pchar):TLsmMathmlVariant;cdecl;external;
procedure lsm_mathml_variant_set_font_style(variant:PLsmMathmlVariant; style:TLsmMathmlFontStyle);cdecl;external;
procedure lsm_mathml_variant_set_font_weight(variant:PLsmMathmlVariant; weight:TLsmMathmlFontWeight);cdecl;external;
type
  PLsmMathmlForm = ^TLsmMathmlForm;
  TLsmMathmlForm =  Longint;
  Const
    LSM_MATHML_FORM_ERROR = -(1);
    LSM_MATHML_FORM_PREFIX = (-(1))+1;
    LSM_MATHML_FORM_POSTFIX = (-(1))+2;
    LSM_MATHML_FORM_INFIX = (-(1))+3;
;
(* Const before type ignored *)

function lsm_mathml_form_to_string(form:TLsmMathmlForm):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_form_from_string(_string:Pchar):TLsmMathmlForm;cdecl;external;
type
  PLsmMathmlRowAlign = ^TLsmMathmlRowAlign;
  TLsmMathmlRowAlign =  Longint;
  Const
    LSM_MATHML_ROW_ALIGN_ERROR = -(1);
    LSM_MATHML_ROW_ALIGN_BASELINE = (-(1))+1;
    LSM_MATHML_ROW_ALIGN_TOP = (-(1))+2;
    LSM_MATHML_ROW_ALIGN_BOTTOM = (-(1))+3;
    LSM_MATHML_ROW_ALIGN_CENTER = (-(1))+4;
    LSM_MATHML_ROW_ALIGN_AXIS = (-(1))+5;
;
(* Const before type ignored *)

function lsm_mathml_row_align_to_string(row_align:TLsmMathmlRowAlign):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_row_align_from_string(_string:Pchar):TLsmMathmlRowAlign;cdecl;external;
type
  PLsmMathmlColumnAlign = ^TLsmMathmlColumnAlign;
  TLsmMathmlColumnAlign =  Longint;
  Const
    LSM_MATHML_COLUMN_ALIGN_ERROR = -(1);
    LSM_MATHML_COLUMN_ALIGN_CENTER = (-(1))+1;
    LSM_MATHML_COLUMN_ALIGN_LEFT = (-(1))+2;
    LSM_MATHML_COLUMN_ALIGN_RIGHT = (-(1))+3;
;
(* Const before type ignored *)

function lsm_mathml_column_align_to_string(column_align:TLsmMathmlColumnAlign):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_column_align_from_string(_string:Pchar):TLsmMathmlColumnAlign;cdecl;external;
type
  PLsmMathmlLine = ^TLsmMathmlLine;
  TLsmMathmlLine =  Longint;
  Const
    LSM_MATHML_LINE_ERROR = -(1);
    LSM_MATHML_LINE_NONE = (-(1))+1;
    LSM_MATHML_LINE_SOLID = (-(1))+2;
    LSM_MATHML_LINE_DASHED = (-(1))+3;
;
(* Const before type ignored *)

function lsm_mathml_line_to_string(line:TLsmMathmlLine):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_line_from_string(_string:Pchar):TLsmMathmlLine;cdecl;external;
type
  PLsmMathmlScriptLevelSign = ^TLsmMathmlScriptLevelSign;
  TLsmMathmlScriptLevelSign =  Longint;
  Const
    LSM_MATHML_SCRIPT_LEVEL_SIGN_ERROR = -(1);
    LSM_MATHML_SCRIPT_LEVEL_SIGN_NONE = (-(1))+1;
    LSM_MATHML_SCRIPT_LEVEL_SIGN_PLUS = (-(1))+2;
    LSM_MATHML_SCRIPT_LEVEL_SIGN_MINUS = (-(1))+3;
;
type
  PLsmMathmlNotation = ^TLsmMathmlNotation;
  TLsmMathmlNotation =  Longint;
  Const
    LSM_MATHML_NOTATION_ERROR = -(1);
    LSM_MATHML_NOTATION_LONGDIV = (-(1))+1;
    LSM_MATHML_NOTATION_ACTUARIAL = (-(1))+2;
    LSM_MATHML_NOTATION_RADICAL = (-(1))+3;
    LSM_MATHML_NOTATION_BOX = (-(1))+4;
    LSM_MATHML_NOTATION_ROUNDED_BOX = (-(1))+5;
    LSM_MATHML_NOTATION_CIRCLE = (-(1))+6;
    LSM_MATHML_NOTATION_LEFT = (-(1))+7;
    LSM_MATHML_NOTATION_RIGHT = (-(1))+8;
    LSM_MATHML_NOTATION_TOP = (-(1))+9;
    LSM_MATHML_NOTATION_BOTTOM = (-(1))+10;
    LSM_MATHML_NOTATION_UP_DIAGONAL_STRIKE = (-(1))+11;
    LSM_MATHML_NOTATION_DOWN_DIAGONAL_STRIKE = (-(1))+12;
    LSM_MATHML_NOTATION_VERTICAL_STRIKE = (-(1))+13;
    LSM_MATHML_NOTATION_HORIZONTAL_STRIKE = (-(1))+14;
    LSM_MATHML_NOTATION_MADRUWB = (-(1))+15;
    LSM_MATHML_NOTATION_UP_DIAGONAL_ARROW = (-(1))+16;
    LSM_MATHML_NOTATION_LAST = (-(1))+17;
;
(* Const before type ignored *)

function lsm_mathml_notation_to_string(notation:TLsmMathmlNotation):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_notation_from_string(_string:Pchar):TLsmMathmlNotation;cdecl;external;
type
  PLsmMathmlLinebreak = ^TLsmMathmlLinebreak;
  TLsmMathmlLinebreak =  Longint;
  Const
    LSM_MATHML_LINEBREAK_ERROR = -(1);
    LSM_MATHML_LINEBREAK_AUTO = (-(1))+1;
    LSM_MATHML_LINEBREAK_NEWLINE = (-(1))+2;
    LSM_MATHML_LINEBREAK_NOBREAK = (-(1))+3;
    LSM_MATHML_LINEBREAK_GOODBREAK = (-(1))+4;
    LSM_MATHML_LINEBREAK_BADBREAK = (-(1))+5;
;
(* Const before type ignored *)

function lsm_mathml_linebreak_to_string(linebreak:TLsmMathmlLinebreak):Pchar;cdecl;external;
(* Const before type ignored *)
function lsm_mathml_linebreak_from_string(_string:Pchar):TLsmMathmlLinebreak;cdecl;external;
{$endif}

implementation


end.
