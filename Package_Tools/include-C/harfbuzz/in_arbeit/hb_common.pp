
unit hb_common;
interface

{
  Automatically converted by H2Pas 1.0.0 from hb_common.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    hb_common.h
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
Phb_bool_t  = ^hb_bool_t;
Phb_codepoint_t  = ^hb_codepoint_t;
Phb_color_t  = ^hb_color_t;
Phb_direction_t  = ^hb_direction_t;
Phb_feature_t  = ^hb_feature_t;
Phb_glyph_extents_t  = ^hb_glyph_extents_t;
Phb_language_impl_t  = ^hb_language_impl_t;
Phb_language_t  = ^hb_language_t;
Phb_mask_t  = ^hb_mask_t;
Phb_position_t  = ^hb_position_t;
Phb_script_t  = ^hb_script_t;
Phb_tag_t  = ^hb_tag_t;
Phb_user_data_key_t  = ^hb_user_data_key_t;
Phb_var_int_t  = ^hb_var_int_t;
Phb_var_num_t  = ^hb_var_num_t;
Phb_variation_t  = ^hb_variation_t;
Pint16_t  = ^int16_t;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
Pint8_t  = ^int8_t;
Puint16_t  = ^uint16_t;
Puint32_t  = ^uint32_t;
Puint64_t  = ^uint64_t;
Puint8_t  = ^uint8_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2007,2008,2009  Red Hat, Inc.
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
 * Google Author(s): Behdad Esfahbod
  }
{$if !defined(HB_H_IN) && !defined(HB_NO_SINGLE_HEADER_ERROR)}
{$error "Include <hb.h> instead."}
{$endif}
{$ifndef HB_COMMON_H}
{$define HB_COMMON_H}
type
  Pint8_t = ^Tint8_t;
  Tint8_t = shortint;

  Puint8_t = ^Tuint8_t;
  Tuint8_t = byte;

  Pint16_t = ^Tint16_t;
  Tint16_t = smallint;

  Puint16_t = ^Tuint16_t;
  Tuint16_t = word;

  Pint32_t = ^Tint32_t;
  Tint32_t = longint;

  Puint32_t = ^Tuint32_t;
  Tuint32_t = dword;

  Pint64_t = ^Tint64_t;
  Tint64_t = int64;

  Puint64_t = ^Tuint64_t;
  Tuint64_t = qword;
{*
 * hb_bool_t:
 * 
 * Data type for booleans.
 *
 * }

  Phb_bool_t = ^Thb_bool_t;
  Thb_bool_t = longint;
{*
 * hb_codepoint_t:
 * 
 * Data type for holding Unicode codepoints. Also
 * used to hold glyph IDs.
 *
 * }

  Phb_codepoint_t = ^Thb_codepoint_t;
  Thb_codepoint_t = Tuint32_t;
{*
 * HB_CODEPOINT_INVALID:
 *
 * Unused #hb_codepoint_t value.
 *
 * Since: 8.0.0
  }

{ was #define dname def_expr }
function HB_CODEPOINT_INVALID : Thb_codepoint_t;  

{*
 * hb_position_t:
 * 
 * Data type for holding a single coordinate value.
 * Contour points and other multi-dimensional data are
 * stored as tuples of #hb_position_t's.
 *
 * }
type
  Phb_position_t = ^Thb_position_t;
  Thb_position_t = Tint32_t;
{*
 * hb_mask_t:
 * 
 * Data type for bitmasks.
 *
 * }

  Phb_mask_t = ^Thb_mask_t;
  Thb_mask_t = Tuint32_t;

  Phb_var_int_t = ^Thb_var_int_t;
  Thb_var_int_t = record
      case longint of
        0 : ( u32 : Tuint32_t );
        1 : ( i32 : Tint32_t );
        2 : ( u16 : array[0..1] of Tuint16_t );
        3 : ( i16 : array[0..1] of Tint16_t );
        4 : ( u8 : array[0..3] of Tuint8_t );
        5 : ( i8 : array[0..3] of Tint8_t );
      end;

  Phb_var_num_t = ^Thb_var_num_t;
  Thb_var_num_t = record
      case longint of
        0 : ( f : single );
        1 : ( u32 : Tuint32_t );
        2 : ( i32 : Tint32_t );
        3 : ( u16 : array[0..1] of Tuint16_t );
        4 : ( i16 : array[0..1] of Tint16_t );
        5 : ( u8 : array[0..3] of Tuint8_t );
        6 : ( i8 : array[0..3] of Tint8_t );
      end;
{ hb_tag_t  }
{*
 * hb_tag_t:
 *
 * Data type for tag identifiers. Tags are four
 * byte integers, each byte representing a character.
 *
 * Tags are used to identify tables, design-variation axes,
 * scripts, languages, font features, and baselines with
 * human-readable names.
 *
 * }

  Phb_tag_t = ^Thb_tag_t;
  Thb_tag_t = Tuint32_t;
{*
 * HB_TAG:
 * @c1: 1st character of the tag
 * @c2: 2nd character of the tag
 * @c3: 3rd character of the tag
 * @c4: 4th character of the tag
 *
 * Constructs an #hb_tag_t from four character literals.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function HB_TAG(c1,c2,c3,c4 : longint) : Thb_tag_t;

{*
 * HB_UNTAG:
 * @tag: an #hb_tag_t
 *
 * Extracts four character literals from an #hb_tag_t.
 *
 * Since: 0.6.0
 *
 * }
{ xxxxxxxxxxxxxxxxxxxxxxxxx }
{ #define HB_UNTAG(tag) (uint8_t)(((tag)>>24)&0xFF), (uint8_t)(((tag)>>16)&0xFF), (uint8_t)(((tag)>>8)&0xFF), (uint8_t)((tag)&0xFF) }
{*
 * HB_TAG_NONE:
 *
 * Unset #hb_tag_t.
  }
{ was #define dname def_expr }
function HB_TAG_NONE : longint; { return type might be wrong }

{*
 * HB_TAG_MAX:
 *
 * Maximum possible unsigned #hb_tag_t.
 *
 * Since: 0.9.26
  }
{ was #define dname def_expr }
function HB_TAG_MAX : longint; { return type might be wrong }

{*
 * HB_TAG_MAX_SIGNED:
 *
 * Maximum possible signed #hb_tag_t.
 *
 * Since: 0.9.33
  }
{ was #define dname def_expr }
function HB_TAG_MAX_SIGNED : longint; { return type might be wrong }

{ len=-1 means str is NUL-terminated.  }
(* Const before type ignored *)
function hb_tag_from_string(str:Pchar; len:longint):Thb_tag_t;cdecl;external;
{ buf should have 4 bytes.  }
procedure hb_tag_to_string(tag:Thb_tag_t; buf:Pchar);cdecl;external;
{*
 * hb_direction_t:
 * @HB_DIRECTION_INVALID: Initial, unset direction.
 * @HB_DIRECTION_LTR: Text is set horizontally from left to right.
 * @HB_DIRECTION_RTL: Text is set horizontally from right to left.
 * @HB_DIRECTION_TTB: Text is set vertically from top to bottom.
 * @HB_DIRECTION_BTT: Text is set vertically from bottom to top.
 *
 * The direction of a text segment or buffer.
 * 
 * A segment can also be tested for horizontal or vertical
 * orientation (irrespective of specific direction) with 
 * HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
 *
  }
type
  Phb_direction_t = ^Thb_direction_t;
  Thb_direction_t =  Longint;
  Const
    HB_DIRECTION_INVALID = 0;
    HB_DIRECTION_LTR = 4;
    HB_DIRECTION_RTL = 5;
    HB_DIRECTION_TTB = 6;
    HB_DIRECTION_BTT = 7;
;
{ len=-1 means str is NUL-terminated  }
(* Const before type ignored *)

function hb_direction_from_string(str:Pchar; len:longint):Thb_direction_t;cdecl;external;
(* Const before type ignored *)
function hb_direction_to_string(direction:Thb_direction_t):Pchar;cdecl;external;
{*
 * HB_DIRECTION_IS_VALID:
 * @dir: #hb_direction_t to test
 *
 * Tests whether a text direction is valid.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_VALID(dir : longint) : longint;

{ Direction must be valid for the following  }
{*
 * HB_DIRECTION_IS_HORIZONTAL:
 * @dir: #hb_direction_t to test
 *
 * Tests whether a text direction is horizontal. Requires
 * that the direction be valid.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_HORIZONTAL(dir : longint) : longint;

{*
 * HB_DIRECTION_IS_VERTICAL:
 * @dir: #hb_direction_t to test
 *
 * Tests whether a text direction is vertical. Requires
 * that the direction be valid.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_VERTICAL(dir : longint) : longint;

{*
 * HB_DIRECTION_IS_FORWARD:
 * @dir: #hb_direction_t to test
 *
 * Tests whether a text direction moves forward (from left to right, or from
 * top to bottom). Requires that the direction be valid.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_FORWARD(dir : longint) : longint;

{*
 * HB_DIRECTION_IS_BACKWARD:
 * @dir: #hb_direction_t to test
 *
 * Tests whether a text direction moves backward (from right to left, or from
 * bottom to top). Requires that the direction be valid.
 *
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_BACKWARD(dir : longint) : longint;

{*
 * HB_DIRECTION_REVERSE:
 * @dir: #hb_direction_t to reverse
 *
 * Reverses a text direction. Requires that the direction
 * be valid.
 *
 * }
{ xxxxxxxxxxxxxxxxx }
{#define HB_DIRECTION_REVERSE(dir)	((hb_direction_t) (((unsigned int) (dir)) ^ 1)) }
{ hb_language_t  }
{*
 * hb_language_t:
 *
 * Data type for languages. Each #hb_language_t corresponds to a BCP 47
 * language tag.
 *
  }
(* Const before type ignored *)
type
  Phb_language_t = ^Thb_language_t;
  Thb_language_t = Phb_language_impl_t;
(* Const before type ignored *)

function hb_language_from_string(str:Pchar; len:longint):Thb_language_t;cdecl;external;
(* Const before type ignored *)
function hb_language_to_string(language:Thb_language_t):Pchar;cdecl;external;
{*
 * HB_LANGUAGE_INVALID:
 *
 * An unset #hb_language_t.
 *
 * Since: 0.6.0
  }
{ was #define dname def_expr }
function HB_LANGUAGE_INVALID : Thb_language_t;  

function hb_language_get_default:Thb_language_t;cdecl;external;
function hb_language_matches(language:Thb_language_t; specific:Thb_language_t):Thb_bool_t;cdecl;external;
{*
 * hb_script_t:
 * @HB_SCRIPT_COMMON: `Zyyy`
 * @HB_SCRIPT_INHERITED: `Zinh`
 * @HB_SCRIPT_UNKNOWN: `Zzzz`
 * @HB_SCRIPT_ARABIC: `Arab`
 * @HB_SCRIPT_ARMENIAN: `Armn`
 * @HB_SCRIPT_BENGALI: `Beng`
 * @HB_SCRIPT_CYRILLIC: `Cyrl`
 * @HB_SCRIPT_DEVANAGARI: `Deva`
 * @HB_SCRIPT_GEORGIAN: `Geor`
 * @HB_SCRIPT_GREEK: `Grek`
 * @HB_SCRIPT_GUJARATI: `Gujr`
 * @HB_SCRIPT_GURMUKHI: `Guru`
 * @HB_SCRIPT_HANGUL: `Hang`
 * @HB_SCRIPT_HAN: `Hani`
 * @HB_SCRIPT_HEBREW: `Hebr`
 * @HB_SCRIPT_HIRAGANA: `Hira`
 * @HB_SCRIPT_KANNADA: `Knda`
 * @HB_SCRIPT_KATAKANA: `Kana`
 * @HB_SCRIPT_LAO: `Laoo`
 * @HB_SCRIPT_LATIN: `Latn`
 * @HB_SCRIPT_MALAYALAM: `Mlym`
 * @HB_SCRIPT_ORIYA: `Orya`
 * @HB_SCRIPT_TAMIL: `Taml`
 * @HB_SCRIPT_TELUGU: `Telu`
 * @HB_SCRIPT_THAI: `Thai`
 * @HB_SCRIPT_TIBETAN: `Tibt`
 * @HB_SCRIPT_BOPOMOFO: `Bopo`
 * @HB_SCRIPT_BRAILLE: `Brai`
 * @HB_SCRIPT_CANADIAN_SYLLABICS: `Cans`
 * @HB_SCRIPT_CHEROKEE: `Cher`
 * @HB_SCRIPT_ETHIOPIC: `Ethi`
 * @HB_SCRIPT_KHMER: `Khmr`
 * @HB_SCRIPT_MONGOLIAN: `Mong`
 * @HB_SCRIPT_MYANMAR: `Mymr`
 * @HB_SCRIPT_OGHAM: `Ogam`
 * @HB_SCRIPT_RUNIC: `Runr`
 * @HB_SCRIPT_SINHALA: `Sinh`
 * @HB_SCRIPT_SYRIAC: `Syrc`
 * @HB_SCRIPT_THAANA: `Thaa`
 * @HB_SCRIPT_YI: `Yiii`
 * @HB_SCRIPT_DESERET: `Dsrt`
 * @HB_SCRIPT_GOTHIC: `Goth`
 * @HB_SCRIPT_OLD_ITALIC: `Ital`
 * @HB_SCRIPT_BUHID: `Buhd`
 * @HB_SCRIPT_HANUNOO: `Hano`
 * @HB_SCRIPT_TAGALOG: `Tglg`
 * @HB_SCRIPT_TAGBANWA: `Tagb`
 * @HB_SCRIPT_CYPRIOT: `Cprt`
 * @HB_SCRIPT_LIMBU: `Limb`
 * @HB_SCRIPT_LINEAR_B: `Linb`
 * @HB_SCRIPT_OSMANYA: `Osma`
 * @HB_SCRIPT_SHAVIAN: `Shaw`
 * @HB_SCRIPT_TAI_LE: `Tale`
 * @HB_SCRIPT_UGARITIC: `Ugar`
 * @HB_SCRIPT_BUGINESE: `Bugi`
 * @HB_SCRIPT_COPTIC: `Copt`
 * @HB_SCRIPT_GLAGOLITIC: `Glag`
 * @HB_SCRIPT_KHAROSHTHI: `Khar`
 * @HB_SCRIPT_NEW_TAI_LUE: `Talu`
 * @HB_SCRIPT_OLD_PERSIAN: `Xpeo`
 * @HB_SCRIPT_SYLOTI_NAGRI: `Sylo`
 * @HB_SCRIPT_TIFINAGH: `Tfng`
 * @HB_SCRIPT_BALINESE: `Bali`
 * @HB_SCRIPT_CUNEIFORM: `Xsux`
 * @HB_SCRIPT_NKO: `Nkoo`
 * @HB_SCRIPT_PHAGS_PA: `Phag`
 * @HB_SCRIPT_PHOENICIAN: `Phnx`
 * @HB_SCRIPT_CARIAN: `Cari`
 * @HB_SCRIPT_CHAM: `Cham`
 * @HB_SCRIPT_KAYAH_LI: `Kali`
 * @HB_SCRIPT_LEPCHA: `Lepc`
 * @HB_SCRIPT_LYCIAN: `Lyci`
 * @HB_SCRIPT_LYDIAN: `Lydi`
 * @HB_SCRIPT_OL_CHIKI: `Olck`
 * @HB_SCRIPT_REJANG: `Rjng`
 * @HB_SCRIPT_SAURASHTRA: `Saur`
 * @HB_SCRIPT_SUNDANESE: `Sund`
 * @HB_SCRIPT_VAI: `Vaii`
 * @HB_SCRIPT_AVESTAN: `Avst`
 * @HB_SCRIPT_BAMUM: `Bamu`
 * @HB_SCRIPT_EGYPTIAN_HIEROGLYPHS: `Egyp`
 * @HB_SCRIPT_IMPERIAL_ARAMAIC: `Armi`
 * @HB_SCRIPT_INSCRIPTIONAL_PAHLAVI: `Phli`
 * @HB_SCRIPT_INSCRIPTIONAL_PARTHIAN: `Prti`
 * @HB_SCRIPT_JAVANESE: `Java`
 * @HB_SCRIPT_KAITHI: `Kthi`
 * @HB_SCRIPT_LISU: `Lisu`
 * @HB_SCRIPT_MEETEI_MAYEK: `Mtei`
 * @HB_SCRIPT_OLD_SOUTH_ARABIAN: `Sarb`
 * @HB_SCRIPT_OLD_TURKIC: `Orkh`
 * @HB_SCRIPT_SAMARITAN: `Samr`
 * @HB_SCRIPT_TAI_THAM: `Lana`
 * @HB_SCRIPT_TAI_VIET: `Tavt`
 * @HB_SCRIPT_BATAK: `Batk`
 * @HB_SCRIPT_BRAHMI: `Brah`
 * @HB_SCRIPT_MANDAIC: `Mand`
 * @HB_SCRIPT_CHAKMA: `Cakm`
 * @HB_SCRIPT_MEROITIC_CURSIVE: `Merc`
 * @HB_SCRIPT_MEROITIC_HIEROGLYPHS: `Mero`
 * @HB_SCRIPT_MIAO: `Plrd`
 * @HB_SCRIPT_SHARADA: `Shrd`
 * @HB_SCRIPT_SORA_SOMPENG: `Sora`
 * @HB_SCRIPT_TAKRI: `Takr`
 * @HB_SCRIPT_BASSA_VAH: `Bass`, Since: 0.9.30
 * @HB_SCRIPT_CAUCASIAN_ALBANIAN: `Aghb`, Since: 0.9.30
 * @HB_SCRIPT_DUPLOYAN: `Dupl`, Since: 0.9.30
 * @HB_SCRIPT_ELBASAN: `Elba`, Since: 0.9.30
 * @HB_SCRIPT_GRANTHA: `Gran`, Since: 0.9.30
 * @HB_SCRIPT_KHOJKI: `Khoj`, Since: 0.9.30
 * @HB_SCRIPT_KHUDAWADI: `Sind`, Since: 0.9.30
 * @HB_SCRIPT_LINEAR_A: `Lina`, Since: 0.9.30
 * @HB_SCRIPT_MAHAJANI: `Mahj`, Since: 0.9.30
 * @HB_SCRIPT_MANICHAEAN: `Mani`, Since: 0.9.30
 * @HB_SCRIPT_MENDE_KIKAKUI: `Mend`, Since: 0.9.30
 * @HB_SCRIPT_MODI: `Modi`, Since: 0.9.30
 * @HB_SCRIPT_MRO: `Mroo`, Since: 0.9.30
 * @HB_SCRIPT_NABATAEAN: `Nbat`, Since: 0.9.30
 * @HB_SCRIPT_OLD_NORTH_ARABIAN: `Narb`, Since: 0.9.30
 * @HB_SCRIPT_OLD_PERMIC: `Perm`, Since: 0.9.30
 * @HB_SCRIPT_PAHAWH_HMONG: `Hmng`, Since: 0.9.30
 * @HB_SCRIPT_PALMYRENE: `Palm`, Since: 0.9.30
 * @HB_SCRIPT_PAU_CIN_HAU: `Pauc`, Since: 0.9.30
 * @HB_SCRIPT_PSALTER_PAHLAVI: `Phlp`, Since: 0.9.30
 * @HB_SCRIPT_SIDDHAM: `Sidd`, Since: 0.9.30
 * @HB_SCRIPT_TIRHUTA: `Tirh`, Since: 0.9.30
 * @HB_SCRIPT_WARANG_CITI: `Wara`, Since: 0.9.30
 * @HB_SCRIPT_AHOM: `Ahom`, Since: 0.9.30
 * @HB_SCRIPT_ANATOLIAN_HIEROGLYPHS: `Hluw`, Since: 0.9.30
 * @HB_SCRIPT_HATRAN: `Hatr`, Since: 0.9.30
 * @HB_SCRIPT_MULTANI: `Mult`, Since: 0.9.30
 * @HB_SCRIPT_OLD_HUNGARIAN: `Hung`, Since: 0.9.30
 * @HB_SCRIPT_SIGNWRITING: `Sgnw`, Since: 0.9.30
 * @HB_SCRIPT_ADLAM: `Adlm`, Since: 1.3.0
 * @HB_SCRIPT_BHAIKSUKI: `Bhks`, Since: 1.3.0
 * @HB_SCRIPT_MARCHEN: `Marc`, Since: 1.3.0
 * @HB_SCRIPT_OSAGE: `Osge`, Since: 1.3.0
 * @HB_SCRIPT_TANGUT: `Tang`, Since: 1.3.0
 * @HB_SCRIPT_NEWA: `Newa`, Since: 1.3.0
 * @HB_SCRIPT_MASARAM_GONDI: `Gonm`, Since: 1.6.0
 * @HB_SCRIPT_NUSHU: `Nshu`, Since: 1.6.0
 * @HB_SCRIPT_SOYOMBO: `Soyo`, Since: 1.6.0
 * @HB_SCRIPT_ZANABAZAR_SQUARE: `Zanb`, Since: 1.6.0
 * @HB_SCRIPT_DOGRA: `Dogr`, Since: 1.8.0
 * @HB_SCRIPT_GUNJALA_GONDI: `Gong`, Since: 1.8.0
 * @HB_SCRIPT_HANIFI_ROHINGYA: `Rohg`, Since: 1.8.0
 * @HB_SCRIPT_MAKASAR: `Maka`, Since: 1.8.0
 * @HB_SCRIPT_MEDEFAIDRIN: `Medf`, Since: 1.8.0
 * @HB_SCRIPT_OLD_SOGDIAN: `Sogo`, Since: 1.8.0
 * @HB_SCRIPT_SOGDIAN: `Sogd`, Since: 1.8.0
 * @HB_SCRIPT_ELYMAIC: `Elym`, Since: 2.4.0
 * @HB_SCRIPT_NANDINAGARI: `Nand`, Since: 2.4.0
 * @HB_SCRIPT_NYIAKENG_PUACHUE_HMONG: `Hmnp`, Since: 2.4.0
 * @HB_SCRIPT_WANCHO: `Wcho`, Since: 2.4.0
 * @HB_SCRIPT_CHORASMIAN: `Chrs`, Since: 2.6.7
 * @HB_SCRIPT_DIVES_AKURU: `Diak`, Since: 2.6.7
 * @HB_SCRIPT_KHITAN_SMALL_SCRIPT: `Kits`, Since: 2.6.7
 * @HB_SCRIPT_YEZIDI: `Yezi`, Since: 2.6.7
 * @HB_SCRIPT_CYPRO_MINOAN: `Cpmn`, Since: 3.0.0
 * @HB_SCRIPT_OLD_UYGHUR: `Ougr`, Since: 3.0.0
 * @HB_SCRIPT_TANGSA: `Tnsa`, Since: 3.0.0
 * @HB_SCRIPT_TOTO: `Toto`, Since: 3.0.0
 * @HB_SCRIPT_VITHKUQI: `Vith`, Since: 3.0.0
 * @HB_SCRIPT_MATH: `Zmth`, Since: 3.4.0
 * @HB_SCRIPT_KAWI: `Kawi`, Since: 5.2.0
 * @HB_SCRIPT_NAG_MUNDARI: `Nagm`, Since: 5.2.0
 * @HB_SCRIPT_INVALID: No script set
 *
 * Data type for scripts. Each #hb_script_t's value is an #hb_tag_t corresponding
 * to the four-letter values defined by [ISO 15924](https://unicode.org/iso15924/).
 *
 * See also the Script (sc) property of the Unicode Character Database.
 *
 * }
{ https://docs.google.com/spreadsheets/d/1Y90M0Ie3MUJ6UVCRDOypOtijlMDLNNyyLk36T6iMu0o  }
{1.1 }
{1.1 }
{5.0 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{1.1 }
{2.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.0 }
{3.1 }
{3.1 }
{3.1 }
{3.2 }
{3.2 }
{3.2 }
{3.2 }
{4.0 }
{4.0 }
{4.0 }
{4.0 }
{4.0 }
{4.0 }
{4.0 }
{4.1 }
{4.1 }
{4.1 }
{4.1 }
{4.1 }
{4.1 }
{4.1 }
{4.1 }
{5.0 }
{5.0 }
{5.0 }
{5.0 }
{5.0 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.1 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{5.2 }
{6.0 }
{6.0 }
{6.0 }
{6.1 }
{6.1 }
{6.1 }
{6.1 }
{6.1 }
{6.1 }
{6.1 }
{
   * Since: 0.9.30
    }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{7.0 }
{8.0 }
{8.0 }
{8.0 }
{8.0 }
{8.0 }
{8.0 }
{
   * Since 1.3.0
    }
{9.0 }
{9.0 }
{9.0 }
{9.0 }
{9.0 }
{9.0 }
{
   * Since 1.6.0
    }
{10.0 }
{10.0 }
{10.0 }
{10.0 }
{
   * Since 1.8.0
    }
{11.0 }
{11.0 }
{11.0 }
{11.0 }
{11.0 }
{11.0 }
{11.0 }
{
   * Since 2.4.0
    }
{12.0 }
{12.0 }
{12.0 }
{12.0 }
{
   * Since 2.6.7
    }
{13.0 }
{13.0 }
{13.0 }
{13.0 }
{
   * Since 3.0.0
    }
{14.0 }
{14.0 }
{14.0 }
{14.0 }
{14.0 }
{
   * Since 3.4.0
    }
{
   * Since 5.2.0
    }
{15.0 }
{15.0 }
{ No script set.  }
{< private > }
{ Dummy values to ensure any hb_tag_t value can be passed/stored as hb_script_t
   * without risking undefined behavior.  We have two, for historical reasons.
   * HB_TAG_MAX used to be unsigned, but that was invalid Ansi C, so was changed
   * to _HB_SCRIPT_MAX_VALUE to be equal to HB_TAG_MAX_SIGNED as well.
   *
   * See this thread for technicalities:
   *
   *   https://lists.freedesktop.org/archives/harfbuzz/2014-March/004150.html
    }
{< skip > }
{< skip > }
type
  Phb_script_t = ^Thb_script_t;
  Thb_script_t =  Longint;
  Const
    HB_SCRIPT_COMMON = HB_TAG('Z','y','y','y');
    HB_SCRIPT_INHERITED = HB_TAG('Z','i','n','h');
    HB_SCRIPT_UNKNOWN = HB_TAG('Z','z','z','z');
    HB_SCRIPT_ARABIC = HB_TAG('A','r','a','b');
    HB_SCRIPT_ARMENIAN = HB_TAG('A','r','m','n');
    HB_SCRIPT_BENGALI = HB_TAG('B','e','n','g');
    HB_SCRIPT_CYRILLIC = HB_TAG('C','y','r','l');
    HB_SCRIPT_DEVANAGARI = HB_TAG('D','e','v','a');
    HB_SCRIPT_GEORGIAN = HB_TAG('G','e','o','r');
    HB_SCRIPT_GREEK = HB_TAG('G','r','e','k');
    HB_SCRIPT_GUJARATI = HB_TAG('G','u','j','r');
    HB_SCRIPT_GURMUKHI = HB_TAG('G','u','r','u');
    HB_SCRIPT_HANGUL = HB_TAG('H','a','n','g');
    HB_SCRIPT_HAN = HB_TAG('H','a','n','i');
    HB_SCRIPT_HEBREW = HB_TAG('H','e','b','r');
    HB_SCRIPT_HIRAGANA = HB_TAG('H','i','r','a');
    HB_SCRIPT_KANNADA = HB_TAG('K','n','d','a');
    HB_SCRIPT_KATAKANA = HB_TAG('K','a','n','a');
    HB_SCRIPT_LAO = HB_TAG('L','a','o','o');
    HB_SCRIPT_LATIN = HB_TAG('L','a','t','n');
    HB_SCRIPT_MALAYALAM = HB_TAG('M','l','y','m');
    HB_SCRIPT_ORIYA = HB_TAG('O','r','y','a');
    HB_SCRIPT_TAMIL = HB_TAG('T','a','m','l');
    HB_SCRIPT_TELUGU = HB_TAG('T','e','l','u');
    HB_SCRIPT_THAI = HB_TAG('T','h','a','i');
    HB_SCRIPT_TIBETAN = HB_TAG('T','i','b','t');
    HB_SCRIPT_BOPOMOFO = HB_TAG('B','o','p','o');
    HB_SCRIPT_BRAILLE = HB_TAG('B','r','a','i');
    HB_SCRIPT_CANADIAN_SYLLABICS = HB_TAG('C','a','n','s');
    HB_SCRIPT_CHEROKEE = HB_TAG('C','h','e','r');
    HB_SCRIPT_ETHIOPIC = HB_TAG('E','t','h','i');
    HB_SCRIPT_KHMER = HB_TAG('K','h','m','r');
    HB_SCRIPT_MONGOLIAN = HB_TAG('M','o','n','g');
    HB_SCRIPT_MYANMAR = HB_TAG('M','y','m','r');
    HB_SCRIPT_OGHAM = HB_TAG('O','g','a','m');
    HB_SCRIPT_RUNIC = HB_TAG('R','u','n','r');
    HB_SCRIPT_SINHALA = HB_TAG('S','i','n','h');
    HB_SCRIPT_SYRIAC = HB_TAG('S','y','r','c');
    HB_SCRIPT_THAANA = HB_TAG('T','h','a','a');
    HB_SCRIPT_YI = HB_TAG('Y','i','i','i');
    HB_SCRIPT_DESERET = HB_TAG('D','s','r','t');
    HB_SCRIPT_GOTHIC = HB_TAG('G','o','t','h');
    HB_SCRIPT_OLD_ITALIC = HB_TAG('I','t','a','l');
    HB_SCRIPT_BUHID = HB_TAG('B','u','h','d');
    HB_SCRIPT_HANUNOO = HB_TAG('H','a','n','o');
    HB_SCRIPT_TAGALOG = HB_TAG('T','g','l','g');
    HB_SCRIPT_TAGBANWA = HB_TAG('T','a','g','b');
    HB_SCRIPT_CYPRIOT = HB_TAG('C','p','r','t');
    HB_SCRIPT_LIMBU = HB_TAG('L','i','m','b');
    HB_SCRIPT_LINEAR_B = HB_TAG('L','i','n','b');
    HB_SCRIPT_OSMANYA = HB_TAG('O','s','m','a');
    HB_SCRIPT_SHAVIAN = HB_TAG('S','h','a','w');
    HB_SCRIPT_TAI_LE = HB_TAG('T','a','l','e');
    HB_SCRIPT_UGARITIC = HB_TAG('U','g','a','r');
    HB_SCRIPT_BUGINESE = HB_TAG('B','u','g','i');
    HB_SCRIPT_COPTIC = HB_TAG('C','o','p','t');
    HB_SCRIPT_GLAGOLITIC = HB_TAG('G','l','a','g');
    HB_SCRIPT_KHAROSHTHI = HB_TAG('K','h','a','r');
    HB_SCRIPT_NEW_TAI_LUE = HB_TAG('T','a','l','u');
    HB_SCRIPT_OLD_PERSIAN = HB_TAG('X','p','e','o');
    HB_SCRIPT_SYLOTI_NAGRI = HB_TAG('S','y','l','o');
    HB_SCRIPT_TIFINAGH = HB_TAG('T','f','n','g');
    HB_SCRIPT_BALINESE = HB_TAG('B','a','l','i');
    HB_SCRIPT_CUNEIFORM = HB_TAG('X','s','u','x');
    HB_SCRIPT_NKO = HB_TAG('N','k','o','o');
    HB_SCRIPT_PHAGS_PA = HB_TAG('P','h','a','g');
    HB_SCRIPT_PHOENICIAN = HB_TAG('P','h','n','x');
    HB_SCRIPT_CARIAN = HB_TAG('C','a','r','i');
    HB_SCRIPT_CHAM = HB_TAG('C','h','a','m');
    HB_SCRIPT_KAYAH_LI = HB_TAG('K','a','l','i');
    HB_SCRIPT_LEPCHA = HB_TAG('L','e','p','c');
    HB_SCRIPT_LYCIAN = HB_TAG('L','y','c','i');
    HB_SCRIPT_LYDIAN = HB_TAG('L','y','d','i');
    HB_SCRIPT_OL_CHIKI = HB_TAG('O','l','c','k');
    HB_SCRIPT_REJANG = HB_TAG('R','j','n','g');
    HB_SCRIPT_SAURASHTRA = HB_TAG('S','a','u','r');
    HB_SCRIPT_SUNDANESE = HB_TAG('S','u','n','d');
    HB_SCRIPT_VAI = HB_TAG('V','a','i','i');
    HB_SCRIPT_AVESTAN = HB_TAG('A','v','s','t');
    HB_SCRIPT_BAMUM = HB_TAG('B','a','m','u');
    HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = HB_TAG('E','g','y','p');
    HB_SCRIPT_IMPERIAL_ARAMAIC = HB_TAG('A','r','m','i');
    HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = HB_TAG('P','h','l','i');
    HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = HB_TAG('P','r','t','i');
    HB_SCRIPT_JAVANESE = HB_TAG('J','a','v','a');
    HB_SCRIPT_KAITHI = HB_TAG('K','t','h','i');
    HB_SCRIPT_LISU = HB_TAG('L','i','s','u');
    HB_SCRIPT_MEETEI_MAYEK = HB_TAG('M','t','e','i');
    HB_SCRIPT_OLD_SOUTH_ARABIAN = HB_TAG('S','a','r','b');
    HB_SCRIPT_OLD_TURKIC = HB_TAG('O','r','k','h');
    HB_SCRIPT_SAMARITAN = HB_TAG('S','a','m','r');
    HB_SCRIPT_TAI_THAM = HB_TAG('L','a','n','a');
    HB_SCRIPT_TAI_VIET = HB_TAG('T','a','v','t');
    HB_SCRIPT_BATAK = HB_TAG('B','a','t','k');
    HB_SCRIPT_BRAHMI = HB_TAG('B','r','a','h');
    HB_SCRIPT_MANDAIC = HB_TAG('M','a','n','d');
    HB_SCRIPT_CHAKMA = HB_TAG('C','a','k','m');
    HB_SCRIPT_MEROITIC_CURSIVE = HB_TAG('M','e','r','c');
    HB_SCRIPT_MEROITIC_HIEROGLYPHS = HB_TAG('M','e','r','o');
    HB_SCRIPT_MIAO = HB_TAG('P','l','r','d');
    HB_SCRIPT_SHARADA = HB_TAG('S','h','r','d');
    HB_SCRIPT_SORA_SOMPENG = HB_TAG('S','o','r','a');
    HB_SCRIPT_TAKRI = HB_TAG('T','a','k','r');
    HB_SCRIPT_BASSA_VAH = HB_TAG('B','a','s','s');
    HB_SCRIPT_CAUCASIAN_ALBANIAN = HB_TAG('A','g','h','b');
    HB_SCRIPT_DUPLOYAN = HB_TAG('D','u','p','l');
    HB_SCRIPT_ELBASAN = HB_TAG('E','l','b','a');
    HB_SCRIPT_GRANTHA = HB_TAG('G','r','a','n');
    HB_SCRIPT_KHOJKI = HB_TAG('K','h','o','j');
    HB_SCRIPT_KHUDAWADI = HB_TAG('S','i','n','d');
    HB_SCRIPT_LINEAR_A = HB_TAG('L','i','n','a');
    HB_SCRIPT_MAHAJANI = HB_TAG('M','a','h','j');
    HB_SCRIPT_MANICHAEAN = HB_TAG('M','a','n','i');
    HB_SCRIPT_MENDE_KIKAKUI = HB_TAG('M','e','n','d');
    HB_SCRIPT_MODI = HB_TAG('M','o','d','i');
    HB_SCRIPT_MRO = HB_TAG('M','r','o','o');
    HB_SCRIPT_NABATAEAN = HB_TAG('N','b','a','t');
    HB_SCRIPT_OLD_NORTH_ARABIAN = HB_TAG('N','a','r','b');
    HB_SCRIPT_OLD_PERMIC = HB_TAG('P','e','r','m');
    HB_SCRIPT_PAHAWH_HMONG = HB_TAG('H','m','n','g');
    HB_SCRIPT_PALMYRENE = HB_TAG('P','a','l','m');
    HB_SCRIPT_PAU_CIN_HAU = HB_TAG('P','a','u','c');
    HB_SCRIPT_PSALTER_PAHLAVI = HB_TAG('P','h','l','p');
    HB_SCRIPT_SIDDHAM = HB_TAG('S','i','d','d');
    HB_SCRIPT_TIRHUTA = HB_TAG('T','i','r','h');
    HB_SCRIPT_WARANG_CITI = HB_TAG('W','a','r','a');
    HB_SCRIPT_AHOM = HB_TAG('A','h','o','m');
    HB_SCRIPT_ANATOLIAN_HIEROGLYPHS = HB_TAG('H','l','u','w');
    HB_SCRIPT_HATRAN = HB_TAG('H','a','t','r');
    HB_SCRIPT_MULTANI = HB_TAG('M','u','l','t');
    HB_SCRIPT_OLD_HUNGARIAN = HB_TAG('H','u','n','g');
    HB_SCRIPT_SIGNWRITING = HB_TAG('S','g','n','w');
    HB_SCRIPT_ADLAM = HB_TAG('A','d','l','m');
    HB_SCRIPT_BHAIKSUKI = HB_TAG('B','h','k','s');
    HB_SCRIPT_MARCHEN = HB_TAG('M','a','r','c');
    HB_SCRIPT_OSAGE = HB_TAG('O','s','g','e');
    HB_SCRIPT_TANGUT = HB_TAG('T','a','n','g');
    HB_SCRIPT_NEWA = HB_TAG('N','e','w','a');
    HB_SCRIPT_MASARAM_GONDI = HB_TAG('G','o','n','m');
    HB_SCRIPT_NUSHU = HB_TAG('N','s','h','u');
    HB_SCRIPT_SOYOMBO = HB_TAG('S','o','y','o');
    HB_SCRIPT_ZANABAZAR_SQUARE = HB_TAG('Z','a','n','b');
    HB_SCRIPT_DOGRA = HB_TAG('D','o','g','r');
    HB_SCRIPT_GUNJALA_GONDI = HB_TAG('G','o','n','g');
    HB_SCRIPT_HANIFI_ROHINGYA = HB_TAG('R','o','h','g');
    HB_SCRIPT_MAKASAR = HB_TAG('M','a','k','a');
    HB_SCRIPT_MEDEFAIDRIN = HB_TAG('M','e','d','f');
    HB_SCRIPT_OLD_SOGDIAN = HB_TAG('S','o','g','o');
    HB_SCRIPT_SOGDIAN = HB_TAG('S','o','g','d');
    HB_SCRIPT_ELYMAIC = HB_TAG('E','l','y','m');
    HB_SCRIPT_NANDINAGARI = HB_TAG('N','a','n','d');
    HB_SCRIPT_NYIAKENG_PUACHUE_HMONG = HB_TAG('H','m','n','p');
    HB_SCRIPT_WANCHO = HB_TAG('W','c','h','o');
    HB_SCRIPT_CHORASMIAN = HB_TAG('C','h','r','s');
    HB_SCRIPT_DIVES_AKURU = HB_TAG('D','i','a','k');
    HB_SCRIPT_KHITAN_SMALL_SCRIPT = HB_TAG('K','i','t','s');
    HB_SCRIPT_YEZIDI = HB_TAG('Y','e','z','i');
    HB_SCRIPT_CYPRO_MINOAN = HB_TAG('C','p','m','n');
    HB_SCRIPT_OLD_UYGHUR = HB_TAG('O','u','g','r');
    HB_SCRIPT_TANGSA = HB_TAG('T','n','s','a');
    HB_SCRIPT_TOTO = HB_TAG('T','o','t','o');
    HB_SCRIPT_VITHKUQI = HB_TAG('V','i','t','h');
    HB_SCRIPT_MATH = HB_TAG('Z','m','t','h');
    HB_SCRIPT_KAWI = HB_TAG('K','a','w','i');
    HB_SCRIPT_NAG_MUNDARI = HB_TAG('N','a','g','m');
    HB_SCRIPT_INVALID = HB_TAG_NONE;
    _HB_SCRIPT_MAX_VALUE = HB_TAG_MAX_SIGNED;
    _HB_SCRIPT_MAX_VALUE_SIGNED = HB_TAG_MAX_SIGNED;
;
{ Script functions  }

function hb_script_from_iso15924_tag(tag:Thb_tag_t):Thb_script_t;cdecl;external;
(* Const before type ignored *)
function hb_script_from_string(str:Pchar; len:longint):Thb_script_t;cdecl;external;
function hb_script_to_iso15924_tag(script:Thb_script_t):Thb_tag_t;cdecl;external;
function hb_script_get_horizontal_direction(script:Thb_script_t):Thb_direction_t;cdecl;external;
{ User data  }
{*
 * hb_user_data_key_t:
 *
 * Data structure for holding user-data keys.
 *
 * }
{< private > }
type
  Phb_user_data_key_t = ^Thb_user_data_key_t;
  Thb_user_data_key_t = record
      unused : char;
    end;
{*
 * hb_destroy_func_t:
 * @user_data: the data to be destroyed
 *
 * A virtual method for destroy user-data callbacks.
 *
  }

  Thb_destroy_func_t = procedure (user_data:pointer);cdecl;
{ Font features and variations.  }
{*
 * HB_FEATURE_GLOBAL_START:
 *
 * Special setting for #hb_feature_t.start to apply the feature from the start
 * of the buffer.
 *
 * Since: 2.0.0
  }

const
  HB_FEATURE_GLOBAL_START = 0;  
{*
 * HB_FEATURE_GLOBAL_END:
 *
 * Special setting for #hb_feature_t.end to apply the feature from to the end
 * of the buffer.
 *
 * Since: 2.0.0
  }

{ was #define dname def_expr }
function HB_FEATURE_GLOBAL_END : dword;  

{*
 * hb_feature_t:
 * @tag: The #hb_tag_t tag of the feature
 * @value: The value of the feature. 0 disables the feature, non-zero (usually
 * 1) enables the feature.  For features implemented as lookup type 3 (like
 * 'salt') the @value is a one based index into the alternates.
 * @start: the cluster to start applying this feature setting (inclusive).
 * @end: the cluster to end applying this feature setting (exclusive).
 *
 * The #hb_feature_t is the structure that holds information about requested
 * feature application. The feature will be applied with the given value to all
 * glyphs which are in clusters between @start (inclusive) and @end (exclusive).
 * Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
 * specifies that the feature always applies to the entire buffer.
  }
type
  Phb_feature_t = ^Thb_feature_t;
  Thb_feature_t = record
      tag : Thb_tag_t;
      value : Tuint32_t;
      start : dword;
      end : dword;
    end;
(* Const before type ignored *)

function hb_feature_from_string(str:Pchar; len:longint; feature:Phb_feature_t):Thb_bool_t;cdecl;external;
procedure hb_feature_to_string(feature:Phb_feature_t; buf:Pchar; size:dword);cdecl;external;
{*
 * hb_variation_t:
 * @tag: The #hb_tag_t tag of the variation-axis name
 * @value: The value of the variation axis
 *
 * Data type for holding variation data. Registered OpenType
 * variation-axis tags are listed in
 * [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
 * 
 * Since: 1.4.2
  }
type
  Phb_variation_t = ^Thb_variation_t;
  Thb_variation_t = record
      tag : Thb_tag_t;
      value : single;
    end;
(* Const before type ignored *)

function hb_variation_from_string(str:Pchar; len:longint; variation:Phb_variation_t):Thb_bool_t;cdecl;external;
procedure hb_variation_to_string(variation:Phb_variation_t; buf:Pchar; size:dword);cdecl;external;
{*
 * hb_color_t:
 *
 * Data type for holding color values. Colors are eight bits per
 * channel RGB plus alpha transparency.
 *
 * Since: 2.1.0
  }
type
  Phb_color_t = ^Thb_color_t;
  Thb_color_t = Tuint32_t;
{*
 * HB_COLOR:
 * @b: blue channel value
 * @g: green channel value
 * @r: red channel value
 * @a: alpha channel value
 *
 * Constructs an #hb_color_t from four integers.
 *
 * Since: 2.1.0
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function HB_COLOR(b,g,r,a : longint) : Thb_color_t;

function hb_color_get_alpha(color:Thb_color_t):Tuint8_t;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function hb_color_get_alpha(color : longint) : Tcolor;

function hb_color_get_red(color:Thb_color_t):Tuint8_t;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_red(color : longint) : longint;

function hb_color_get_green(color:Thb_color_t):Tuint8_t;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_green(color : longint) : longint;

function hb_color_get_blue(color:Thb_color_t):Tuint8_t;cdecl;external;
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_blue(color : longint) : longint;

{*
 * hb_glyph_extents_t:
 * @x_bearing: Distance from the x-origin to the left extremum of the glyph.
 * @y_bearing: Distance from the top extremum of the glyph to the y-origin.
 * @width: Distance from the left extremum of the glyph to the right extremum.
 * @height: Distance from the top extremum of the glyph to the bottom extremum.
 *
 * Glyph extent values, measured in font units.
 *
 * Note that @height is negative, in coordinate systems that grow up.
 * }
type
  Phb_glyph_extents_t = ^Thb_glyph_extents_t;
  Thb_glyph_extents_t = record
      x_bearing : Thb_position_t;
      y_bearing : Thb_position_t;
      width : Thb_position_t;
      height : Thb_position_t;
    end;
{*
 * hb_font_t:
 *
 * Data type for holding fonts.
 *
  }
{$endif}
{ HB_COMMON_H  }

implementation

{ was #define dname def_expr }
function HB_CODEPOINT_INVALID : Thb_codepoint_t;
  begin
    HB_CODEPOINT_INVALID:=Thb_codepoint_t(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function HB_TAG(c1,c2,c3,c4 : longint) : Thb_tag_t;
begin
  HB_TAG:=Thb_tag_t(((((Tuint32_t(Tc1(@($FF)))) shl 24) or ((Tuint32_t(Tc2(@($FF)))) shl 16)) or ((Tuint32_t(Tc3(@($FF)))) shl 8)) or (Tuint32_t(Tc4(@($FF)))));
end;

{ was #define dname def_expr }
function HB_TAG_NONE : longint; { return type might be wrong }
  begin
    HB_TAG_NONE:=HB_TAG(0,0,0,0);
  end;

{ was #define dname def_expr }
function HB_TAG_MAX : longint; { return type might be wrong }
  begin
    HB_TAG_MAX:=HB_TAG($ff,$ff,$ff,$ff);
  end;

{ was #define dname def_expr }
function HB_TAG_MAX_SIGNED : longint; { return type might be wrong }
  begin
    HB_TAG_MAX_SIGNED:=HB_TAG($7f,$ff,$ff,$ff);
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_VALID(dir : longint) : longint;
begin
  HB_DIRECTION_IS_VALID:=((dword(dir)) and ( not (3)))=4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_HORIZONTAL(dir : longint) : longint;
begin
  HB_DIRECTION_IS_HORIZONTAL:=((dword(dir)) and ( not (1)))=4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_VERTICAL(dir : longint) : longint;
begin
  HB_DIRECTION_IS_VERTICAL:=((dword(dir)) and ( not (1)))=6;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_FORWARD(dir : longint) : longint;
begin
  HB_DIRECTION_IS_FORWARD:=((dword(dir)) and ( not (2)))=4;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function HB_DIRECTION_IS_BACKWARD(dir : longint) : longint;
begin
  HB_DIRECTION_IS_BACKWARD:=((dword(dir)) and ( not (2)))=5;
end;

{ was #define dname def_expr }
function HB_LANGUAGE_INVALID : Thb_language_t;
  begin
    HB_LANGUAGE_INVALID:=Thb_language_t(0);
  end;

{ was #define dname def_expr }
function HB_FEATURE_GLOBAL_END : dword;
  begin
    HB_FEATURE_GLOBAL_END:=dword(-(1));
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function HB_COLOR(b,g,r,a : longint) : Thb_color_t;
begin
  HB_COLOR:=Thb_color_t(HB_TAG(b,g,r,a));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
function hb_color_get_alpha(color : longint) : Tcolor;
begin
  hb_color_get_alpha:=Tcolor(@($FF));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_red(color : longint) : longint;
begin
  hb_color_get_red:=(color shr 8) and $FF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_green(color : longint) : longint;
begin
  hb_color_get_green:=(color shr 16) and $FF;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function hb_color_get_blue(color : longint) : longint;
begin
  hb_color_get_blue:=(color shr 24) and $FF;
end;


end.
