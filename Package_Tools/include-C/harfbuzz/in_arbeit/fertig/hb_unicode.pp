
unit hb_unicode;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_unicode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_unicode.h
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
Phb_codepoint_t  = ^hb_codepoint_t;
Phb_unicode_combining_class_t  = ^hb_unicode_combining_class_t;
Phb_unicode_funcs_t  = ^hb_unicode_funcs_t;
Phb_unicode_general_category_t  = ^hb_unicode_general_category_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2009  Red Hat, Inc.
 * Copyright © 2011  Codethink Limited
 * Copyright © 2011,2012  Google, Inc.
 *
 *  This is part of HarfBuzz, a text shaping library.
 *
 * Permission is hereby granted, without written agreement and without
 * license or royalty fees, to use, copy, modify, and distribute this
 * software and its documentation for any purpose, provided that the
 * above copyright notice and the following two paragraphs appear in
 * all copies of this software.
 *
 * IN NO EVENT SHALL THE COPYRIGHT HOLDER BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES
 * ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN
 * IF THE COPYRIGHT HOLDER HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * THE COPYRIGHT HOLDER SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING,
 * BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE.  THE SOFTWARE PROVIDED HEREUNDER IS
 * ON AN "AS IS" BASIS, AND THE COPYRIGHT HOLDER HAS NO OBLIGATION TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * Red Hat Author(s): Behdad Esfahbod
 * Codethink Author(s): Ryan Lortie
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_UNICODE_H}
{$define HB_UNICODE_H}
{$include "hb-common.h"}
{*
 * HB_UNICODE_MAX:
 *
 * Maximum valid Unicode code point.
 *
 * Since: 1.9.0
 * }

const
  HB_UNICODE_MAX = $10FFFF;  
{*
 * hb_unicode_general_category_t:
 * @HB_UNICODE_GENERAL_CATEGORY_CONTROL:              [Cc]
 * @HB_UNICODE_GENERAL_CATEGORY_FORMAT:		      [Cf]
 * @HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED:	      [Cn]
 * @HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE:	      [Co]
 * @HB_UNICODE_GENERAL_CATEGORY_SURROGATE:	      [Cs]
 * @HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER:     [Ll]
 * @HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER:      [Lm]
 * @HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER:	      [Lo]
 * @HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER:     [Lt]
 * @HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER:     [Lu]
 * @HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK:	      [Mc]
 * @HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK:	      [Me]
 * @HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK:     [Mn]
 * @HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER:	      [Nd]
 * @HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER:	      [Nl]
 * @HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER:	      [No]
 * @HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION:  [Pc]
 * @HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION:     [Pd]
 * @HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION:    [Pe]
 * @HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION:    [Pf]
 * @HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION:  [Pi]
 * @HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION:    [Po]
 * @HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION:     [Ps]
 * @HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL:      [Sc]
 * @HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL:      [Sk]
 * @HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL:	      [Sm]
 * @HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL:	      [So]
 * @HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR:	      [Zl]
 * @HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR:  [Zp]
 * @HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR:      [Zs]
 *
 * Data type for the "General_Category" (gc) property from
 * the Unicode Character Database.
 * }
{ Unicode Character Database property: General_Category (gc)  }
{ Cc  }
{ Cf  }
{ Cn  }
{ Co  }
{ Cs  }
{ Ll  }
{ Lm  }
{ Lo  }
{ Lt  }
{ Lu  }
{ Mc  }
{ Me  }
{ Mn  }
{ Nd  }
{ Nl  }
{ No  }
{ Pc  }
{ Pd  }
{ Pe  }
{ Pf  }
{ Pi  }
{ Po  }
{ Ps  }
{ Sc  }
{ Sk  }
{ Sm  }
{ So  }
{ Zl  }
{ Zp  }
{ Zs  }
type
  Phb_unicode_general_category_t = ^Thb_unicode_general_category_t;
  Thb_unicode_general_category_t =  Longint;
  Const
    HB_UNICODE_GENERAL_CATEGORY_CONTROL = 0;
    HB_UNICODE_GENERAL_CATEGORY_FORMAT = 1;
    HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED = 2;
    HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE = 3;
    HB_UNICODE_GENERAL_CATEGORY_SURROGATE = 4;
    HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER = 5;
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER = 6;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER = 7;
    HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER = 8;
    HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER = 9;
    HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK = 10;
    HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK = 11;
    HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK = 12;
    HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER = 13;
    HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER = 14;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER = 15;
    HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION = 16;
    HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION = 17;
    HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION = 18;
    HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION = 19;
    HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION = 20;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION = 21;
    HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION = 22;
    HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL = 23;
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL = 24;
    HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL = 25;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL = 26;
    HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR = 27;
    HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR = 28;
    HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR = 29;
;
{*
 * hb_unicode_combining_class_t:
 * @HB_UNICODE_COMBINING_CLASS_NOT_REORDERED: Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
 * @HB_UNICODE_COMBINING_CLASS_OVERLAY: Marks which overlay a base letter or symbol
 * @HB_UNICODE_COMBINING_CLASS_NUKTA: Diacritic nukta marks in Brahmi-derived scripts
 * @HB_UNICODE_COMBINING_CLASS_KANA_VOICING: Hiragana/Katakana voicing marks
 * @HB_UNICODE_COMBINING_CLASS_VIRAMA: Viramas
 * @HB_UNICODE_COMBINING_CLASS_CCC10: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC11: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC12: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC13: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC14: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC15: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC16: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC17: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC18: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC19: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC20: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC21: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC22: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC23: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC24: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC25: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC26: [Hebrew]
 * @HB_UNICODE_COMBINING_CLASS_CCC27: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC28: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC29: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC30: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC31: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC32: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC33: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC34: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC35: [Arabic]
 * @HB_UNICODE_COMBINING_CLASS_CCC36: [Syriac]
 * @HB_UNICODE_COMBINING_CLASS_CCC84: [Telugu]
 * @HB_UNICODE_COMBINING_CLASS_CCC91: [Telugu]
 * @HB_UNICODE_COMBINING_CLASS_CCC103: [Thai]
 * @HB_UNICODE_COMBINING_CLASS_CCC107: [Thai]
 * @HB_UNICODE_COMBINING_CLASS_CCC118: [Lao]
 * @HB_UNICODE_COMBINING_CLASS_CCC122: [Lao]
 * @HB_UNICODE_COMBINING_CLASS_CCC129: [Tibetan]
 * @HB_UNICODE_COMBINING_CLASS_CCC130: [Tibetan]
 * @HB_UNICODE_COMBINING_CLASS_CCC132: [Tibetan] Since: 7.2.0
 * @HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT: Marks attached at the bottom left
 * @HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW: Marks attached directly below
 * @HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE: Marks attached directly above
 * @HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT: Marks attached at the top right
 * @HB_UNICODE_COMBINING_CLASS_BELOW_LEFT: Distinct marks at the bottom left
 * @HB_UNICODE_COMBINING_CLASS_BELOW: Distinct marks directly below
 * @HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT: Distinct marks at the bottom right
 * @HB_UNICODE_COMBINING_CLASS_LEFT: Distinct marks to the left
 * @HB_UNICODE_COMBINING_CLASS_RIGHT: Distinct marks to the right
 * @HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT: Distinct marks at the top left
 * @HB_UNICODE_COMBINING_CLASS_ABOVE: Distinct marks directly above
 * @HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT: Distinct marks at the top right
 * @HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW: Distinct marks subtending two bases
 * @HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE: Distinct marks extending above two bases
 * @HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT: Greek iota subscript only
 * @HB_UNICODE_COMBINING_CLASS_INVALID: Invalid combining class
 *
 * Data type for the Canonical_Combining_Class (ccc) property
 * from the Unicode Character Database.
 *
 * <note>Note: newer versions of Unicode may add new values.
 * Client programs should be ready to handle any value in the 0..254 range
 * being returned from hb_unicode_combining_class().</note>
 *
 * }
{ Hebrew  }
{ Arabic  }
{ Syriac  }
{ Telugu  }
{ Thai  }
{ Lao  }
{ Tibetan  }
type
  Phb_unicode_combining_class_t = ^Thb_unicode_combining_class_t;
  Thb_unicode_combining_class_t =  Longint;
  Const
    HB_UNICODE_COMBINING_CLASS_NOT_REORDERED = 0;
    HB_UNICODE_COMBINING_CLASS_OVERLAY = 1;
    HB_UNICODE_COMBINING_CLASS_NUKTA = 7;
    HB_UNICODE_COMBINING_CLASS_KANA_VOICING = 8;
    HB_UNICODE_COMBINING_CLASS_VIRAMA = 9;
    HB_UNICODE_COMBINING_CLASS_CCC10 = 10;
    HB_UNICODE_COMBINING_CLASS_CCC11 = 11;
    HB_UNICODE_COMBINING_CLASS_CCC12 = 12;
    HB_UNICODE_COMBINING_CLASS_CCC13 = 13;
    HB_UNICODE_COMBINING_CLASS_CCC14 = 14;
    HB_UNICODE_COMBINING_CLASS_CCC15 = 15;
    HB_UNICODE_COMBINING_CLASS_CCC16 = 16;
    HB_UNICODE_COMBINING_CLASS_CCC17 = 17;
    HB_UNICODE_COMBINING_CLASS_CCC18 = 18;
    HB_UNICODE_COMBINING_CLASS_CCC19 = 19;
    HB_UNICODE_COMBINING_CLASS_CCC20 = 20;
    HB_UNICODE_COMBINING_CLASS_CCC21 = 21;
    HB_UNICODE_COMBINING_CLASS_CCC22 = 22;
    HB_UNICODE_COMBINING_CLASS_CCC23 = 23;
    HB_UNICODE_COMBINING_CLASS_CCC24 = 24;
    HB_UNICODE_COMBINING_CLASS_CCC25 = 25;
    HB_UNICODE_COMBINING_CLASS_CCC26 = 26;
    HB_UNICODE_COMBINING_CLASS_CCC27 = 27;
    HB_UNICODE_COMBINING_CLASS_CCC28 = 28;
    HB_UNICODE_COMBINING_CLASS_CCC29 = 29;
    HB_UNICODE_COMBINING_CLASS_CCC30 = 30;
    HB_UNICODE_COMBINING_CLASS_CCC31 = 31;
    HB_UNICODE_COMBINING_CLASS_CCC32 = 32;
    HB_UNICODE_COMBINING_CLASS_CCC33 = 33;
    HB_UNICODE_COMBINING_CLASS_CCC34 = 34;
    HB_UNICODE_COMBINING_CLASS_CCC35 = 35;
    HB_UNICODE_COMBINING_CLASS_CCC36 = 36;
    HB_UNICODE_COMBINING_CLASS_CCC84 = 84;
    HB_UNICODE_COMBINING_CLASS_CCC91 = 91;
    HB_UNICODE_COMBINING_CLASS_CCC103 = 103;
    HB_UNICODE_COMBINING_CLASS_CCC107 = 107;
    HB_UNICODE_COMBINING_CLASS_CCC118 = 118;
    HB_UNICODE_COMBINING_CLASS_CCC122 = 122;
    HB_UNICODE_COMBINING_CLASS_CCC129 = 129;
    HB_UNICODE_COMBINING_CLASS_CCC130 = 130;
    HB_UNICODE_COMBINING_CLASS_CCC132 = 132;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT = 200;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW = 202;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE = 214;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT = 216;
    HB_UNICODE_COMBINING_CLASS_BELOW_LEFT = 218;
    HB_UNICODE_COMBINING_CLASS_BELOW = 220;
    HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT = 222;
    HB_UNICODE_COMBINING_CLASS_LEFT = 224;
    HB_UNICODE_COMBINING_CLASS_RIGHT = 226;
    HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT = 228;
    HB_UNICODE_COMBINING_CLASS_ABOVE = 230;
    HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT = 232;
    HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW = 233;
    HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE = 234;
    HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT = 240;
    HB_UNICODE_COMBINING_CLASS_INVALID = 255;
;
{
 * hb_unicode_funcs_t
  }
{*
 * hb_unicode_funcs_t:
 *
 * Data type containing a set of virtual methods used for
 * accessing various Unicode character properties.
 *
 * HarfBuzz provides a default function for each of the
 * methods in #hb_unicode_funcs_t. Client programs can implement
 * their own replacements for the individual Unicode functions, as
 * needed, and replace the default by calling the setter for a
 * method.
 * }
type
{
 * just give me the best implementation you've got there.
  }

function hb_unicode_funcs_get_default:Phb_unicode_funcs_t;cdecl;external;
function hb_unicode_funcs_create(parent:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;external;
function hb_unicode_funcs_get_empty:Phb_unicode_funcs_t;cdecl;external;
function hb_unicode_funcs_reference(ufuncs:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;external;
procedure hb_unicode_funcs_destroy(ufuncs:Phb_unicode_funcs_t);cdecl;external;
function hb_unicode_funcs_set_user_data(ufuncs:Phb_unicode_funcs_t; key:Phb_user_data_key_t; data:pointer; destroy:Thb_destroy_func_t; replace:Thb_bool_t):Thb_bool_t;cdecl;external;
(* Const before type ignored *)
function hb_unicode_funcs_get_user_data(ufuncs:Phb_unicode_funcs_t; key:Phb_user_data_key_t):pointer;cdecl;external;
procedure hb_unicode_funcs_make_immutable(ufuncs:Phb_unicode_funcs_t);cdecl;external;
function hb_unicode_funcs_is_immutable(ufuncs:Phb_unicode_funcs_t):Thb_bool_t;cdecl;external;
function hb_unicode_funcs_get_parent(ufuncs:Phb_unicode_funcs_t):Phb_unicode_funcs_t;cdecl;external;
{
 * funcs
  }
{ typedefs  }
{*
 * hb_unicode_combining_class_func_t:
 * @ufuncs: A Unicode-functions structure
 * @unicode: The code point to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should retrieve the Canonical Combining Class (ccc)
 * property for a specified Unicode code point. 
 *
 * Return value: The #hb_unicode_combining_class_t of @unicode
 * 
 * }
type

  Thb_unicode_combining_class_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t; user_data:pointer):Thb_unicode_combining_class_t;cdecl;
{*
 * hb_unicode_general_category_func_t:
 * @ufuncs: A Unicode-functions structure
 * @unicode: The code point to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should retrieve the General Category property for
 * a specified Unicode code point.
 * 
 * Return value: The #hb_unicode_general_category_t of @unicode
 *
 * }

  Thb_unicode_general_category_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t; user_data:pointer):Thb_unicode_general_category_t;cdecl;
{*
 * hb_unicode_mirroring_func_t:
 * @ufuncs: A Unicode-functions structure
 * @unicode: The code point to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should retrieve the Bi-Directional Mirroring Glyph
 * code point for a specified Unicode code point.
 *
 * <note>Note: If a code point does not have a specified
 * Bi-Directional Mirroring Glyph defined, the method should
 * return the original code point.</note>
 * 
 * Return value: The #hb_codepoint_t of the Mirroring Glyph for @unicode
 *
 * }

  Thb_unicode_mirroring_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t; user_data:pointer):Thb_codepoint_t;cdecl;
{*
 * hb_unicode_script_func_t:
 * @ufuncs: A Unicode-functions structure
 * @unicode: The code point to query
 * @user_data: User data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should retrieve the Script property for a 
 * specified Unicode code point.
 *
 * Return value: The #hb_script_t of @unicode
 * 
 * }

  Thb_unicode_script_func_t = function (ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t; user_data:pointer):Thb_script_t;cdecl;
{*
 * hb_unicode_compose_func_t:
 * @ufuncs: A Unicode-functions structure
 * @a: The first code point to compose
 * @b: The second code point to compose
 * @ab: (out): The composed code point
 * @user_data: user data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should compose a sequence of two input Unicode code
 * points by canonical equivalence, returning the composed code
 * point in a #hb_codepoint_t output parameter (if successful).
 * The method must return an #hb_bool_t indicating the success
 * of the composition.
 * 
 * Return value: `true` is @a,@b composed, `false` otherwise
 *
 * }

  Thb_unicode_compose_func_t = function (ufuncs:Phb_unicode_funcs_t; a:Thb_codepoint_t; b:Thb_codepoint_t; ab:Phb_codepoint_t; user_data:pointer):Thb_bool_t;cdecl;
{*
 * hb_unicode_decompose_func_t:
 * @ufuncs: A Unicode-functions structure
 * @ab: The code point to decompose
 * @a: (out): The first decomposed code point
 * @b: (out): The second decomposed code point
 * @user_data: user data pointer passed by the caller
 *
 * A virtual method for the #hb_unicode_funcs_t structure.
 *
 * This method should decompose an input Unicode code point,
 * returning the two decomposed code points in #hb_codepoint_t
 * output parameters (if successful). The method must return an
 * #hb_bool_t indicating the success of the composition.
 * 
 * Return value: `true` if @ab decomposed, `false` otherwise
 *
 * }

  Thb_unicode_decompose_func_t = function (ufuncs:Phb_unicode_funcs_t; ab:Thb_codepoint_t; a:Phb_codepoint_t; b:Phb_codepoint_t; user_data:pointer):Thb_bool_t;cdecl;
{ func setters  }
{*
 * hb_unicode_funcs_set_combining_class_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_combining_class_func_t.
 *
 * Since: 0.9.2
 * }

procedure hb_unicode_funcs_set_combining_class_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_combining_class_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_unicode_funcs_set_general_category_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_general_category_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_unicode_funcs_set_general_category_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_general_category_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_unicode_funcs_set_mirroring_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_mirroring_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_unicode_funcs_set_mirroring_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_mirroring_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_unicode_funcs_set_script_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_script_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_unicode_funcs_set_script_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_script_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_unicode_funcs_set_compose_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_compose_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_unicode_funcs_set_compose_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_compose_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{*
 * hb_unicode_funcs_set_decompose_func:
 * @ufuncs: A Unicode-functions structure
 * @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
 * @user_data: Data to pass to @func
 * @destroy: (nullable): The function to call when @user_data is not needed anymore
 *
 * Sets the implementation function for #hb_unicode_decompose_func_t.
 *
 * Since: 0.9.2
 * }
procedure hb_unicode_funcs_set_decompose_func(ufuncs:Phb_unicode_funcs_t; func:Thb_unicode_decompose_func_t; user_data:pointer; destroy:Thb_destroy_func_t);cdecl;external;
{ accessors  }
{*
 * hb_unicode_combining_class:
 * @ufuncs: The Unicode-functions structure
 * @unicode: The code point to query
 *
 * Retrieves the Canonical Combining Class (ccc) property
 * of code point @unicode.
 *
 * Return value: The #hb_unicode_combining_class_t of @unicode
 *
 * Since: 0.9.2
 * }
function hb_unicode_combining_class(ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t):Thb_unicode_combining_class_t;cdecl;external;
{*
 * hb_unicode_general_category:
 * @ufuncs: The Unicode-functions structure
 * @unicode: The code point to query
 *
 * Retrieves the General Category (gc) property
 * of code point @unicode.
 *
 * Return value: The #hb_unicode_general_category_t of @unicode
 *
 * Since: 0.9.2
 * }
function hb_unicode_general_category(ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t):Thb_unicode_general_category_t;cdecl;external;
{*
 * hb_unicode_mirroring:
 * @ufuncs: The Unicode-functions structure
 * @unicode: The code point to query
 *
 * Retrieves the Bi-directional Mirroring Glyph code
 * point defined for code point @unicode.
 *
 * Return value: The #hb_codepoint_t of the Mirroring Glyph for @unicode
 *
 * Since: 0.9.2
 * }
function hb_unicode_mirroring(ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t):Thb_codepoint_t;cdecl;external;
{*
 * hb_unicode_script:
 * @ufuncs: The Unicode-functions structure
 * @unicode: The code point to query
 *
 * Retrieves the #hb_script_t script to which code
 * point @unicode belongs.
 *
 * Return value: The #hb_script_t of @unicode
 *
 * Since: 0.9.2
 * }
function hb_unicode_script(ufuncs:Phb_unicode_funcs_t; unicode:Thb_codepoint_t):Thb_script_t;cdecl;external;
function hb_unicode_compose(ufuncs:Phb_unicode_funcs_t; a:Thb_codepoint_t; b:Thb_codepoint_t; ab:Phb_codepoint_t):Thb_bool_t;cdecl;external;
function hb_unicode_decompose(ufuncs:Phb_unicode_funcs_t; ab:Thb_codepoint_t; a:Phb_codepoint_t; b:Phb_codepoint_t):Thb_bool_t;cdecl;external;
{$endif}
{ HB_UNICODE_H  }

implementation


end.
