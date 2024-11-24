
unit pango_attributes;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_attributes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_attributes.h
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
Pgchar  = ^gchar;
PGSList  = ^GSList;
Plongint  = ^longint;
PPangoAttrClass  = ^PangoAttrClass;
PPangoAttrColor  = ^PangoAttrColor;
PPangoAttrFloat  = ^PangoAttrFloat;
PPangoAttrFontDesc  = ^PangoAttrFontDesc;
PPangoAttrFontFeatures  = ^PangoAttrFontFeatures;
PPangoAttribute  = ^PangoAttribute;
PPangoAttrInt  = ^PangoAttrInt;
PPangoAttrIterator  = ^PangoAttrIterator;
PPangoAttrLanguage  = ^PangoAttrLanguage;
PPangoAttrList  = ^PangoAttrList;
PPangoAttrShape  = ^PangoAttrShape;
PPangoAttrSize  = ^PangoAttrSize;
PPangoAttrString  = ^PangoAttrString;
PPangoAttrType  = ^PangoAttrType;
PPangoBaselineShift  = ^PangoBaselineShift;
PPangoFontDescription  = ^PangoFontDescription;
PPangoFontScale  = ^PangoFontScale;
PPangoLanguage  = ^PangoLanguage;
PPangoOverline  = ^PangoOverline;
PPangoRectangle  = ^PangoRectangle;
PPangoShowFlags  = ^PangoShowFlags;
PPangoTextTransform  = ^PangoTextTransform;
PPangoUnderline  = ^PangoUnderline;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-attributes.h: Attributed text
 *
 * Copyright (C) 2000 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_ATTRIBUTES_H__}
{$define __PANGO_ATTRIBUTES_H__}
{$include <pango/pango-font.h>}
{$include <pango/pango-color.h>}
{$include <glib-object.h>}
type
{*
 * PangoAttrType:
 * @PANGO_ATTR_INVALID: does not happen
 * @PANGO_ATTR_LANGUAGE: language ([struct@Pango.AttrLanguage])
 * @PANGO_ATTR_FAMILY: font family name list ([struct@Pango.AttrString])
 * @PANGO_ATTR_STYLE: font slant style ([struct@Pango.AttrInt])
 * @PANGO_ATTR_WEIGHT: font weight ([struct@Pango.AttrInt])
 * @PANGO_ATTR_VARIANT: font variant (normal or small caps) ([struct@Pango.AttrInt])
 * @PANGO_ATTR_STRETCH: font stretch ([struct@Pango.AttrInt])
 * @PANGO_ATTR_SIZE: font size in points scaled by %PANGO_SCALE ([struct@Pango.AttrInt])
 * @PANGO_ATTR_FONT_DESC: font description ([struct@Pango.AttrFontDesc])
 * @PANGO_ATTR_FOREGROUND: foreground color ([struct@Pango.AttrColor])
 * @PANGO_ATTR_BACKGROUND: background color ([struct@Pango.AttrColor])
 * @PANGO_ATTR_UNDERLINE: whether the text has an underline ([struct@Pango.AttrInt])
 * @PANGO_ATTR_STRIKETHROUGH: whether the text is struck-through ([struct@Pango.AttrInt])
 * @PANGO_ATTR_RISE: baseline displacement ([struct@Pango.AttrInt])
 * @PANGO_ATTR_SHAPE: shape ([struct@Pango.AttrShape])
 * @PANGO_ATTR_SCALE: font size scale factor ([struct@Pango.AttrFloat])
 * @PANGO_ATTR_FALLBACK: whether fallback is enabled ([struct@Pango.AttrInt])
 * @PANGO_ATTR_LETTER_SPACING: letter spacing ([struct@PangoAttrInt])
 * @PANGO_ATTR_UNDERLINE_COLOR: underline color ([struct@Pango.AttrColor])
 * @PANGO_ATTR_STRIKETHROUGH_COLOR: strikethrough color ([struct@Pango.AttrColor])
 * @PANGO_ATTR_ABSOLUTE_SIZE: font size in pixels scaled by %PANGO_SCALE ([struct@Pango.AttrInt])
 * @PANGO_ATTR_GRAVITY: base text gravity ([struct@Pango.AttrInt])
 * @PANGO_ATTR_GRAVITY_HINT: gravity hint ([struct@Pango.AttrInt])
 * @PANGO_ATTR_FONT_FEATURES: OpenType font features ([struct@Pango.AttrFontFeatures]). Since 1.38
 * @PANGO_ATTR_FOREGROUND_ALPHA: foreground alpha ([struct@Pango.AttrInt]). Since 1.38
 * @PANGO_ATTR_BACKGROUND_ALPHA: background alpha ([struct@Pango.AttrInt]). Since 1.38
 * @PANGO_ATTR_ALLOW_BREAKS: whether breaks are allowed ([struct@Pango.AttrInt]). Since 1.44
 * @PANGO_ATTR_SHOW: how to render invisible characters ([struct@Pango.AttrInt]). Since 1.44
 * @PANGO_ATTR_INSERT_HYPHENS: whether to insert hyphens at intra-word line breaks ([struct@Pango.AttrInt]). Since 1.44
 * @PANGO_ATTR_OVERLINE: whether the text has an overline ([struct@Pango.AttrInt]). Since 1.46
 * @PANGO_ATTR_OVERLINE_COLOR: overline color ([struct@Pango.AttrColor]). Since 1.46
 * @PANGO_ATTR_LINE_HEIGHT: line height factor ([struct@Pango.AttrFloat]). Since: 1.50
 * @PANGO_ATTR_ABSOLUTE_LINE_HEIGHT: line height ([struct@Pango.AttrInt]). Since: 1.50
 * @PANGO_ATTR_WORD: override segmentation to classify the range of the attribute as a single word ([struct@Pango.AttrInt]). Since 1.50
 * @PANGO_ATTR_SENTENCE: override segmentation to classify the range of the attribute as a single sentence ([struct@Pango.AttrInt]). Since 1.50
 * @PANGO_ATTR_BASELINE_SHIFT: baseline displacement ([struct@Pango.AttrInt]). Since 1.50
 * @PANGO_ATTR_FONT_SCALE: font-relative size change ([struct@Pango.AttrInt]). Since 1.50
 *
 * The `PangoAttrType` distinguishes between different types of attributes.
 *
 * Along with the predefined values, it is possible to allocate additional
 * values for custom attributes using [func@AttrType.register]. The predefined
 * values are given below. The type of structure used to store the attribute is
 * listed in parentheses after the description.
  }
{ 0 is an invalid attribute type  }
{ PangoAttrLanguage  }
{ PangoAttrString  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrSize  }
{ PangoAttrFontDesc  }
{ PangoAttrColor  }
{ PangoAttrColor  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrShape  }
{ PangoAttrFloat  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrColor  }
{ PangoAttrColor  }
{ PangoAttrSize  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrFontFeatures  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrColor  }
{ PangoAttrFloat  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrInt  }
{ PangoAttrSize  }
{ PangoAttrInt  }

  PPangoAttrType = ^TPangoAttrType;
  TPangoAttrType =  Longint;
  Const
    PANGO_ATTR_INVALID = 0;
    PANGO_ATTR_LANGUAGE = 1;
    PANGO_ATTR_FAMILY = 2;
    PANGO_ATTR_STYLE = 3;
    PANGO_ATTR_WEIGHT = 4;
    PANGO_ATTR_VARIANT = 5;
    PANGO_ATTR_STRETCH = 6;
    PANGO_ATTR_SIZE = 7;
    PANGO_ATTR_FONT_DESC = 8;
    PANGO_ATTR_FOREGROUND = 9;
    PANGO_ATTR_BACKGROUND = 10;
    PANGO_ATTR_UNDERLINE = 11;
    PANGO_ATTR_STRIKETHROUGH = 12;
    PANGO_ATTR_RISE = 13;
    PANGO_ATTR_SHAPE = 14;
    PANGO_ATTR_SCALE = 15;
    PANGO_ATTR_FALLBACK = 16;
    PANGO_ATTR_LETTER_SPACING = 17;
    PANGO_ATTR_UNDERLINE_COLOR = 18;
    PANGO_ATTR_STRIKETHROUGH_COLOR = 19;
    PANGO_ATTR_ABSOLUTE_SIZE = 20;
    PANGO_ATTR_GRAVITY = 21;
    PANGO_ATTR_GRAVITY_HINT = 22;
    PANGO_ATTR_FONT_FEATURES = 23;
    PANGO_ATTR_FOREGROUND_ALPHA = 24;
    PANGO_ATTR_BACKGROUND_ALPHA = 25;
    PANGO_ATTR_ALLOW_BREAKS = 26;
    PANGO_ATTR_SHOW = 27;
    PANGO_ATTR_INSERT_HYPHENS = 28;
    PANGO_ATTR_OVERLINE = 29;
    PANGO_ATTR_OVERLINE_COLOR = 30;
    PANGO_ATTR_LINE_HEIGHT = 31;
    PANGO_ATTR_ABSOLUTE_LINE_HEIGHT = 32;
    PANGO_ATTR_TEXT_TRANSFORM = 33;
    PANGO_ATTR_WORD = 34;
    PANGO_ATTR_SENTENCE = 35;
    PANGO_ATTR_BASELINE_SHIFT = 36;
    PANGO_ATTR_FONT_SCALE = 37;
;
{*
 * PangoUnderline:
 * @PANGO_UNDERLINE_NONE: no underline should be drawn
 * @PANGO_UNDERLINE_SINGLE: a single underline should be drawn
 * @PANGO_UNDERLINE_DOUBLE: a double underline should be drawn
 * @PANGO_UNDERLINE_LOW: a single underline should be drawn at a
 *   position beneath the ink extents of the text being
 *   underlined. This should be used only for underlining
 *   single characters, such as for keyboard accelerators.
 *   %PANGO_UNDERLINE_SINGLE should be used for extended
 *   portions of text.
 * @PANGO_UNDERLINE_ERROR: an underline indicating an error should
 *   be drawn below. The exact style of rendering is up to the
 *   `PangoRenderer` in use, but typical styles include wavy
 *   or dotted lines.
 *   This underline is typically used to indicate an error such
 *   as a possible mispelling; in some cases a contrasting color
 *   may automatically be used. This type of underlining is
 *   available since Pango 1.4.
 * @PANGO_UNDERLINE_SINGLE_LINE: Like @PANGO_UNDERLINE_SINGLE, but
 *   drawn continuously across multiple runs. This type
 *   of underlining is available since Pango 1.46.
 * @PANGO_UNDERLINE_DOUBLE_LINE: Like @PANGO_UNDERLINE_DOUBLE, but
 *   drawn continuously across multiple runs. This type
 *   of underlining is available since Pango 1.46.
 * @PANGO_UNDERLINE_ERROR_LINE: Like @PANGO_UNDERLINE_ERROR, but
 *   drawn continuously across multiple runs. This type
 *   of underlining is available since Pango 1.46.
 *
 * The `PangoUnderline` enumeration is used to specify whether text
 * should be underlined, and if so, the type of underlining.
  }
type
  PPangoUnderline = ^TPangoUnderline;
  TPangoUnderline =  Longint;
  Const
    PANGO_UNDERLINE_NONE = 0;
    PANGO_UNDERLINE_SINGLE = 1;
    PANGO_UNDERLINE_DOUBLE = 2;
    PANGO_UNDERLINE_LOW = 3;
    PANGO_UNDERLINE_ERROR = 4;
    PANGO_UNDERLINE_SINGLE_LINE = 5;
    PANGO_UNDERLINE_DOUBLE_LINE = 6;
    PANGO_UNDERLINE_ERROR_LINE = 7;
;
{*
 * PangoOverline:
 * @PANGO_OVERLINE_NONE: no overline should be drawn
 * @PANGO_OVERLINE_SINGLE: Draw a single line above the ink
 *   extents of the text being underlined.
 *
 * The `PangoOverline` enumeration is used to specify whether text
 * should be overlined, and if so, the type of line.
 *
 * Since: 1.46
  }
type
  PPangoOverline = ^TPangoOverline;
  TPangoOverline =  Longint;
  Const
    PANGO_OVERLINE_NONE = 0;
    PANGO_OVERLINE_SINGLE = 1;
;
{*
 * PangoShowFlags:
 * @PANGO_SHOW_NONE: No special treatment for invisible characters
 * @PANGO_SHOW_SPACES: Render spaces, tabs and newlines visibly
 * @PANGO_SHOW_LINE_BREAKS: Render line breaks visibly
 * @PANGO_SHOW_IGNORABLES: Render default-ignorable Unicode
 *   characters visibly
 *
 * These flags affect how Pango treats characters that are normally
 * not visible in the output.
 *
 * Since: 1.44
  }
type
  PPangoShowFlags = ^TPangoShowFlags;
  TPangoShowFlags =  Longint;
  Const
    PANGO_SHOW_NONE = 0;
    PANGO_SHOW_SPACES = 1 shl 0;
    PANGO_SHOW_LINE_BREAKS = 1 shl 1;
    PANGO_SHOW_IGNORABLES = 1 shl 2;
;
{*
 * PangoTextTransform:
 * @PANGO_TEXT_TRANSFORM_NONE: Leave text unchanged
 * @PANGO_TEXT_TRANSFORM_LOWERCASE: Display letters and numbers as lowercase
 * @PANGO_TEXT_TRANSFORM_UPPERCASE: Display letters and numbers as uppercase
 * @PANGO_TEXT_TRANSFORM_CAPITALIZE: Display the first character of a word
 *   in titlecase
 *
 * An enumeration that affects how Pango treats characters during shaping.
 *
 * Since: 1.50
  }
type
  PPangoTextTransform = ^TPangoTextTransform;
  TPangoTextTransform =  Longint;
  Const
    PANGO_TEXT_TRANSFORM_NONE = 0;
    PANGO_TEXT_TRANSFORM_LOWERCASE = 1;
    PANGO_TEXT_TRANSFORM_UPPERCASE = 2;
    PANGO_TEXT_TRANSFORM_CAPITALIZE = 3;
;
{*
 * PangoBaselineShift:
 * @PANGO_BASELINE_SHIFT_NONE: Leave the baseline unchanged
 * @PANGO_BASELINE_SHIFT_SUPERSCRIPT: Shift the baseline to the superscript position,
 *   relative to the previous run
 * @PANGO_BASELINE_SHIFT_SUBSCRIPT: Shift the baseline to the subscript position,
 *   relative to the previous run
 *
 * An enumeration that affects baseline shifts between runs.
 *
 * Since: 1.50
  }
type
  PPangoBaselineShift = ^TPangoBaselineShift;
  TPangoBaselineShift =  Longint;
  Const
    PANGO_BASELINE_SHIFT_NONE = 0;
    PANGO_BASELINE_SHIFT_SUPERSCRIPT = 1;
    PANGO_BASELINE_SHIFT_SUBSCRIPT = 2;
;
{*
 * PangoFontScale:
 * @PANGO_FONT_SCALE_NONE: Leave the font size unchanged
 * @PANGO_FONT_SCALE_SUPERSCRIPT: Change the font to a size suitable for superscripts
 * @PANGO_FONT_SCALE_SUBSCRIPT: Change the font to a size suitable for subscripts
 * @PANGO_FONT_SCALE_SMALL_CAPS: Change the font to a size suitable for Small Caps
 *
 * An enumeration that affects font sizes for superscript
 * and subscript positioning and for (emulated) Small Caps.
 *
 * Since: 1.50
  }
type
  PPangoFontScale = ^TPangoFontScale;
  TPangoFontScale =  Longint;
  Const
    PANGO_FONT_SCALE_NONE = 0;
    PANGO_FONT_SCALE_SUPERSCRIPT = 1;
    PANGO_FONT_SCALE_SUBSCRIPT = 2;
    PANGO_FONT_SCALE_SMALL_CAPS = 3;
;
{*
 * PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING:
 *
 * Value for @start_index in `PangoAttribute` that indicates
 * the beginning of the text.
 *
 * Since: 1.24
  }

{ was #define dname def_expr }
function PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING : Tguint;  

{*
 * PANGO_ATTR_INDEX_TO_TEXT_END: (value 4294967295)
 *
 * Value for @end_index in `PangoAttribute` that indicates
 * the end of the text.
 *
 * Since: 1.24
  }
{ was #define dname def_expr }
function PANGO_ATTR_INDEX_TO_TEXT_END : Tguint;  

{*
 * PangoAttribute:
 * @klass: the class structure holding information about the type of the attribute
 * @start_index: the start index of the range (in bytes).
 * @end_index: end index of the range (in bytes). The character at this index
 *   is not included in the range.
 *
 * The `PangoAttribute` structure represents the common portions of all
 * attributes.
 *
 * Particular types of attributes include this structure as their initial
 * portion. The common portion of the attribute holds the range to which
 * the value in the type-specific part of the attribute applies and should
 * be initialized using [method@Pango.Attribute.init]. By default, an attribute
 * will have an all-inclusive range of [0,%G_MAXUINT].
  }
(* Const before type ignored *)
type
  PPangoAttribute = ^TPangoAttribute;
  TPangoAttribute = record
      klass : PPangoAttrClass;
      start_index : Tguint;
      end_index : Tguint;
    end;

{*
 * PangoAttrFilterFunc:
 * @attribute: a Pango attribute
 * @user_data: user data passed to the function
 *
 * Type of a function filtering a list of attributes.
 *
 * Return value: %TRUE if the attribute should be selected for
 *   filtering, %FALSE otherwise.
  }

  TPangoAttrFilterFunc = function (attribute:PPangoAttribute; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * PangoAttrDataCopyFunc:
 * @user_data: user data to copy
 *
 * Type of a function that can duplicate user data for an attribute.
 *
 * Return value: new copy of @user_data.
 * }

  TPangoAttrDataCopyFunc = function (user_data:Tgconstpointer):Tgpointer;cdecl;
{*
 * PangoAttrClass:
 * @type: the type ID for this attribute
 * @copy: function to duplicate an attribute of this type
 *   (see [method@Pango.Attribute.copy])
 * @destroy: function to free an attribute of this type
 *   (see [method@Pango.Attribute.destroy])
 * @equal: function to check two attributes of this type for equality
 *   (see [method@Pango.Attribute.equal])
 *
 * The `PangoAttrClass` structure stores the type and operations for
 * a particular type of attribute.
 *
 * The functions in this structure should not be called directly. Instead,
 * one should use the wrapper functions provided for `PangoAttribute`.
  }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PPangoAttrClass = ^TPangoAttrClass;
  TPangoAttrClass = record
      _type : TPangoAttrType;cdecl;
      copy : function (attr:PPangoAttribute):PPangoAttribute;cdecl;
      destroy : procedure (attr:PPangoAttribute);cdecl;
      equal : function (attr1:PPangoAttribute; attr2:PPangoAttribute):Tgboolean;cdecl;
    end;

{*
 * PangoAttrString:
 * @attr: the common portion of the attribute
 * @value: the string which is the value of the attribute
 *
 * The `PangoAttrString` structure is used to represent attributes with
 * a string value.
  }
  PPangoAttrString = ^TPangoAttrString;
  TPangoAttrString = record
      attr : TPangoAttribute;
      value : Pchar;
    end;

{*
 * PangoAttrLanguage:
 * @attr: the common portion of the attribute
 * @value: the `PangoLanguage` which is the value of the attribute
 *
 * The `PangoAttrLanguage` structure is used to represent attributes that
 * are languages.
  }
  PPangoAttrLanguage = ^TPangoAttrLanguage;
  TPangoAttrLanguage = record
      attr : TPangoAttribute;
      value : PPangoLanguage;
    end;

{*
 * PangoAttrInt:
 * @attr: the common portion of the attribute
 * @value: the value of the attribute
 *
 * The `PangoAttrInt` structure is used to represent attributes with
 * an integer or enumeration value.
  }
  PPangoAttrInt = ^TPangoAttrInt;
  TPangoAttrInt = record
      attr : TPangoAttribute;
      value : longint;
    end;

{*
 * PangoAttrFloat:
 * @attr: the common portion of the attribute
 * @value: the value of the attribute
 *
 * The `PangoAttrFloat` structure is used to represent attributes with
 * a float or double value.
  }
  PPangoAttrFloat = ^TPangoAttrFloat;
  TPangoAttrFloat = record
      attr : TPangoAttribute;
      value : Tdouble;
    end;

{*
 * PangoAttrColor:
 * @attr: the common portion of the attribute
 * @color: the `PangoColor` which is the value of the attribute
 *
 * The `PangoAttrColor` structure is used to represent attributes that
 * are colors.
  }
  PPangoAttrColor = ^TPangoAttrColor;
  TPangoAttrColor = record
      attr : TPangoAttribute;
      color : TPangoColor;
    end;

{*
 * PangoAttrSize:
 * @attr: the common portion of the attribute
 * @size: size of font, in units of 1/%PANGO_SCALE of a point (for
 *   %PANGO_ATTR_SIZE) or of a device unit (for %PANGO_ATTR_ABSOLUTE_SIZE)
 * @absolute: whether the font size is in device units or points.
 *   This field is only present for compatibility with Pango-1.8.0
 *   (%PANGO_ATTR_ABSOLUTE_SIZE was added in 1.8.1); and always will
 *   be %FALSE for %PANGO_ATTR_SIZE and %TRUE for %PANGO_ATTR_ABSOLUTE_SIZE.
 *
 * The `PangoAttrSize` structure is used to represent attributes which
 * set font size.
  }
  PPangoAttrSize = ^TPangoAttrSize;
  TPangoAttrSize = record
      attr : TPangoAttribute;
      size : longint;
      flag0 : word;
    end;


const
  bm_TPangoAttrSize_absolute = $1;
  bp_TPangoAttrSize_absolute = 0;

function absolute(var a : TPangoAttrSize) : Tguint;
procedure set_absolute(var a : TPangoAttrSize; __absolute : Tguint);
{*
 * PangoAttrShape:
 * @attr: the common portion of the attribute
 * @ink_rect: the ink rectangle to restrict to
 * @logical_rect: the logical rectangle to restrict to
 * @data: user data set (see [func@Pango.AttrShape.new_with_data])
 * @copy_func: copy function for the user data
 * @destroy_func: destroy function for the user data
 *
 * The `PangoAttrShape` structure is used to represent attributes which
 * impose shape restrictions.
  }
type
  PPangoAttrShape = ^TPangoAttrShape;
  TPangoAttrShape = record
      attr : TPangoAttribute;
      ink_rect : TPangoRectangle;
      logical_rect : TPangoRectangle;
      data : Tgpointer;
      copy_func : TPangoAttrDataCopyFunc;
      destroy_func : TGDestroyNotify;
    end;

{*
 * PangoAttrFontDesc:
 * @attr: the common portion of the attribute
 * @desc: the font description which is the value of this attribute
 *
 * The `PangoAttrFontDesc` structure is used to store an attribute that
 * sets all aspects of the font description at once.
  }
  PPangoAttrFontDesc = ^TPangoAttrFontDesc;
  TPangoAttrFontDesc = record
      attr : TPangoAttribute;
      desc : PPangoFontDescription;
    end;

{*
 * PangoAttrFontFeatures:
 * @attr: the common portion of the attribute
 * @features: the features, as a string in CSS syntax
 *
 * The `PangoAttrFontFeatures` structure is used to represent OpenType
 * font features as an attribute.
 *
 * Since: 1.38
  }
  PPangoAttrFontFeatures = ^TPangoAttrFontFeatures;
  TPangoAttrFontFeatures = record
      attr : TPangoAttribute;
      features : Pgchar;
    end;


function pango_attribute_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_attr_type_register(name:Pchar):TPangoAttrType;cdecl;external;
(* Const before type ignored *)
function pango_attr_type_get_name(_type:TPangoAttrType):Pchar;cdecl;external;
(* Const before type ignored *)
procedure pango_attribute_init(attr:PPangoAttribute; klass:PPangoAttrClass);cdecl;external;
(* Const before type ignored *)
function pango_attribute_copy(attr:PPangoAttribute):PPangoAttribute;cdecl;external;
procedure pango_attribute_destroy(attr:PPangoAttribute);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pango_attribute_equal(attr1:PPangoAttribute; attr2:PPangoAttribute):Tgboolean;cdecl;external;
function pango_attr_language_new(language:PPangoLanguage):PPangoAttribute;cdecl;external;
(* Const before type ignored *)
function pango_attr_family_new(family:Pchar):PPangoAttribute;cdecl;external;
function pango_attr_foreground_new(red:Tguint16; green:Tguint16; blue:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_background_new(red:Tguint16; green:Tguint16; blue:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_size_new(size:longint):PPangoAttribute;cdecl;external;
function pango_attr_size_new_absolute(size:longint):PPangoAttribute;cdecl;external;
function pango_attr_style_new(style:TPangoStyle):PPangoAttribute;cdecl;external;
function pango_attr_weight_new(weight:TPangoWeight):PPangoAttribute;cdecl;external;
function pango_attr_variant_new(variant:TPangoVariant):PPangoAttribute;cdecl;external;
function pango_attr_stretch_new(stretch:TPangoStretch):PPangoAttribute;cdecl;external;
(* Const before type ignored *)
function pango_attr_font_desc_new(desc:PPangoFontDescription):PPangoAttribute;cdecl;external;
function pango_attr_underline_new(underline:TPangoUnderline):PPangoAttribute;cdecl;external;
function pango_attr_underline_color_new(red:Tguint16; green:Tguint16; blue:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_strikethrough_new(strikethrough:Tgboolean):PPangoAttribute;cdecl;external;
function pango_attr_strikethrough_color_new(red:Tguint16; green:Tguint16; blue:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_rise_new(rise:longint):PPangoAttribute;cdecl;external;
function pango_attr_baseline_shift_new(shift:longint):PPangoAttribute;cdecl;external;
function pango_attr_font_scale_new(scale:TPangoFontScale):PPangoAttribute;cdecl;external;
function pango_attr_scale_new(scale_factor:Tdouble):PPangoAttribute;cdecl;external;
function pango_attr_fallback_new(enable_fallback:Tgboolean):PPangoAttribute;cdecl;external;
function pango_attr_letter_spacing_new(letter_spacing:longint):PPangoAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pango_attr_shape_new(ink_rect:PPangoRectangle; logical_rect:PPangoRectangle):PPangoAttribute;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pango_attr_shape_new_with_data(ink_rect:PPangoRectangle; logical_rect:PPangoRectangle; data:Tgpointer; copy_func:TPangoAttrDataCopyFunc; destroy_func:TGDestroyNotify):PPangoAttribute;cdecl;external;
function pango_attr_gravity_new(gravity:TPangoGravity):PPangoAttribute;cdecl;external;
function pango_attr_gravity_hint_new(hint:TPangoGravityHint):PPangoAttribute;cdecl;external;
(* Const before type ignored *)
function pango_attr_font_features_new(features:Pchar):PPangoAttribute;cdecl;external;
function pango_attr_foreground_alpha_new(alpha:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_background_alpha_new(alpha:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_allow_breaks_new(allow_breaks:Tgboolean):PPangoAttribute;cdecl;external;
function pango_attr_word_new:PPangoAttribute;cdecl;external;
function pango_attr_sentence_new:PPangoAttribute;cdecl;external;
function pango_attr_insert_hyphens_new(insert_hyphens:Tgboolean):PPangoAttribute;cdecl;external;
function pango_attr_overline_new(overline:TPangoOverline):PPangoAttribute;cdecl;external;
function pango_attr_overline_color_new(red:Tguint16; green:Tguint16; blue:Tguint16):PPangoAttribute;cdecl;external;
function pango_attr_show_new(flags:TPangoShowFlags):PPangoAttribute;cdecl;external;
function pango_attr_line_height_new(factor:Tdouble):PPangoAttribute;cdecl;external;
function pango_attr_line_height_new_absolute(height:longint):PPangoAttribute;cdecl;external;
function pango_attr_text_transform_new(transform:TPangoTextTransform):PPangoAttribute;cdecl;external;
function pango_attribute_as_string(attr:PPangoAttribute):PPangoAttrString;cdecl;external;
function pango_attribute_as_language(attr:PPangoAttribute):PPangoAttrLanguage;cdecl;external;
function pango_attribute_as_int(attr:PPangoAttribute):PPangoAttrInt;cdecl;external;
function pango_attribute_as_size(attr:PPangoAttribute):PPangoAttrSize;cdecl;external;
function pango_attribute_as_float(attr:PPangoAttribute):PPangoAttrFloat;cdecl;external;
function pango_attribute_as_color(attr:PPangoAttribute):PPangoAttrColor;cdecl;external;
function pango_attribute_as_font_desc(attr:PPangoAttribute):PPangoAttrFontDesc;cdecl;external;
function pango_attribute_as_shape(attr:PPangoAttribute):PPangoAttrShape;cdecl;external;
function pango_attribute_as_font_features(attr:PPangoAttribute):PPangoAttrFontFeatures;cdecl;external;
{ Attribute lists  }
type

{ was #define dname def_expr }
function PANGO_TYPE_ATTR_LIST : longint; { return type might be wrong }

{*
 * PangoAttrIterator:
 *
 * A `PangoAttrIterator` is used to iterate through a `PangoAttrList`.
 *
 * A new iterator is created with [method@Pango.AttrList.get_iterator].
 * Once the iterator is created, it can be advanced through the style
 * changes in the text using [method@Pango.AttrIterator.next]. At each
 * style change, the range of the current style segment and the attributes
 * currently in effect can be queried.
  }
{*
 * PangoAttrList:
 *
 * A `PangoAttrList` represents a list of attributes that apply to a section
 * of text.
 *
 * The attributes in a `PangoAttrList` are, in general, allowed to overlap in
 * an arbitrary fashion. However, if the attributes are manipulated only through
 * [method@Pango.AttrList.change], the overlap between properties will meet
 * stricter criteria.
 *
 * Since the `PangoAttrList` structure is stored as a linear list, it is not
 * suitable for storing attributes for large amounts of text. In general, you
 * should not use a single `PangoAttrList` for more than one paragraph of text.
  }
function pango_attr_list_get_type:TGType;cdecl;external;
function pango_attr_list_new:PPangoAttrList;cdecl;external;
function pango_attr_list_ref(list:PPangoAttrList):PPangoAttrList;cdecl;external;
procedure pango_attr_list_unref(list:PPangoAttrList);cdecl;external;
function pango_attr_list_copy(list:PPangoAttrList):PPangoAttrList;cdecl;external;
procedure pango_attr_list_insert(list:PPangoAttrList; attr:PPangoAttribute);cdecl;external;
procedure pango_attr_list_insert_before(list:PPangoAttrList; attr:PPangoAttribute);cdecl;external;
procedure pango_attr_list_change(list:PPangoAttrList; attr:PPangoAttribute);cdecl;external;
procedure pango_attr_list_splice(list:PPangoAttrList; other:PPangoAttrList; pos:longint; len:longint);cdecl;external;
procedure pango_attr_list_update(list:PPangoAttrList; pos:longint; remove:longint; add:longint);cdecl;external;
function pango_attr_list_filter(list:PPangoAttrList; func:TPangoAttrFilterFunc; data:Tgpointer):PPangoAttrList;cdecl;external;
function pango_attr_list_get_attributes(list:PPangoAttrList):PGSList;cdecl;external;
function pango_attr_list_equal(list:PPangoAttrList; other_list:PPangoAttrList):Tgboolean;cdecl;external;
function pango_attr_list_to_string(list:PPangoAttrList):Pchar;cdecl;external;
(* Const before type ignored *)
function pango_attr_list_from_string(text:Pchar):PPangoAttrList;cdecl;external;
function pango_attr_iterator_get_type:TGType;cdecl;external;
function pango_attr_list_get_iterator(list:PPangoAttrList):PPangoAttrIterator;cdecl;external;
procedure pango_attr_iterator_range(iterator:PPangoAttrIterator; start:Plongint; end:Plongint);cdecl;external;
function pango_attr_iterator_next(iterator:PPangoAttrIterator):Tgboolean;cdecl;external;
function pango_attr_iterator_copy(iterator:PPangoAttrIterator):PPangoAttrIterator;cdecl;external;
procedure pango_attr_iterator_destroy(iterator:PPangoAttrIterator);cdecl;external;
function pango_attr_iterator_get(iterator:PPangoAttrIterator; _type:TPangoAttrType):PPangoAttribute;cdecl;external;
procedure pango_attr_iterator_get_font(iterator:PPangoAttrIterator; desc:PPangoFontDescription; language:PPPangoLanguage; extra_attrs:PPGSList);cdecl;external;
function pango_attr_iterator_get_attrs(iterator:PPangoAttrIterator):PGSList;cdecl;external;
{$endif}
{ __PANGO_ATTRIBUTES_H__  }

implementation

{ was #define dname def_expr }
function PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING : Tguint;
  begin
    PANGO_ATTR_INDEX_FROM_TEXT_BEGINNING:=Tguint(0);
  end;

{ was #define dname def_expr }
function PANGO_ATTR_INDEX_TO_TEXT_END : Tguint;
  begin
    PANGO_ATTR_INDEX_TO_TEXT_END:=Tguint(G_MAXUINT+0);
  end;

function absolute(var a : TPangoAttrSize) : Tguint;
begin
  absolute:=(a.flag0 and bm_TPangoAttrSize_absolute) shr bp_TPangoAttrSize_absolute;
end;

procedure set_absolute(var a : TPangoAttrSize; __absolute : Tguint);
begin
  a.flag0:=a.flag0 or ((__absolute shl bp_TPangoAttrSize_absolute) and bm_TPangoAttrSize_absolute);
end;

{ was #define dname def_expr }
function PANGO_TYPE_ATTR_LIST : longint; { return type might be wrong }
  begin
    PANGO_TYPE_ATTR_LIST:=pango_attr_list_get_type;
  end;


end.
