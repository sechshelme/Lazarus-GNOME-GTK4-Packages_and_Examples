
unit pango_script;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_script.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_script.h
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
PPangoLanguage  = ^PangoLanguage;
PPangoScript  = ^PangoScript;
PPangoScriptIter  = ^PangoScriptIter;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-script.h: Script tag handling
 *
 * Copyright (C) 2002 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_SCRIPT_H__}
{$define __PANGO_SCRIPT_H__}
{$include <glib-object.h>}
{*
 * PangoScriptIter:
 *
 * A `PangoScriptIter` is used to iterate through a string
 * and identify ranges in different scripts.
 * }
type
{*
 * PangoScript:
 * @PANGO_SCRIPT_INVALID_CODE: a value never returned from pango_script_for_unichar()
 * @PANGO_SCRIPT_COMMON: a character used by multiple different scripts
 * @PANGO_SCRIPT_INHERITED: a mark glyph that takes its script from the
 * base glyph to which it is attached
 * @PANGO_SCRIPT_ARABIC:        Arabic
 * @PANGO_SCRIPT_ARMENIAN: Armenian
 * @PANGO_SCRIPT_BENGALI:       Bengali
 * @PANGO_SCRIPT_BOPOMOFO: Bopomofo
 * @PANGO_SCRIPT_CHEROKEE:      Cherokee
 * @PANGO_SCRIPT_COPTIC:        Coptic
 * @PANGO_SCRIPT_CYRILLIC:      Cyrillic
 * @PANGO_SCRIPT_DESERET:       Deseret
 * @PANGO_SCRIPT_DEVANAGARI:    Devanagari
 * @PANGO_SCRIPT_ETHIOPIC:      Ethiopic
 * @PANGO_SCRIPT_GEORGIAN:      Georgian
 * @PANGO_SCRIPT_GOTHIC:        Gothic
 * @PANGO_SCRIPT_GREEK:         Greek
 * @PANGO_SCRIPT_GUJARATI:      Gujarati
 * @PANGO_SCRIPT_GURMUKHI:      Gurmukhi
 * @PANGO_SCRIPT_HAN:   Han
 * @PANGO_SCRIPT_HANGUL:        Hangul
 * @PANGO_SCRIPT_HEBREW:        Hebrew
 * @PANGO_SCRIPT_HIRAGANA:      Hiragana
 * @PANGO_SCRIPT_KANNADA:       Kannada
 * @PANGO_SCRIPT_KATAKANA:      Katakana
 * @PANGO_SCRIPT_KHMER:         Khmer
 * @PANGO_SCRIPT_LAO:   Lao
 * @PANGO_SCRIPT_LATIN:         Latin
 * @PANGO_SCRIPT_MALAYALAM:     Malayalam
 * @PANGO_SCRIPT_MONGOLIAN:     Mongolian
 * @PANGO_SCRIPT_MYANMAR:       Myanmar
 * @PANGO_SCRIPT_OGHAM:         Ogham
 * @PANGO_SCRIPT_OLD_ITALIC:    Old Italic
 * @PANGO_SCRIPT_ORIYA:         Oriya
 * @PANGO_SCRIPT_RUNIC:         Runic
 * @PANGO_SCRIPT_SINHALA:       Sinhala
 * @PANGO_SCRIPT_SYRIAC:        Syriac
 * @PANGO_SCRIPT_TAMIL:         Tamil
 * @PANGO_SCRIPT_TELUGU:        Telugu
 * @PANGO_SCRIPT_THAANA:        Thaana
 * @PANGO_SCRIPT_THAI:  Thai
 * @PANGO_SCRIPT_TIBETAN:       Tibetan
 * @PANGO_SCRIPT_CANADIAN_ABORIGINAL:   Canadian Aboriginal
 * @PANGO_SCRIPT_YI:    Yi
 * @PANGO_SCRIPT_TAGALOG:       Tagalog
 * @PANGO_SCRIPT_HANUNOO:       Hanunoo
 * @PANGO_SCRIPT_BUHID:         Buhid
 * @PANGO_SCRIPT_TAGBANWA:      Tagbanwa
 * @PANGO_SCRIPT_BRAILLE:       Braille
 * @PANGO_SCRIPT_CYPRIOT:       Cypriot
 * @PANGO_SCRIPT_LIMBU:         Limbu
 * @PANGO_SCRIPT_OSMANYA:       Osmanya
 * @PANGO_SCRIPT_SHAVIAN:       Shavian
 * @PANGO_SCRIPT_LINEAR_B:      Linear B
 * @PANGO_SCRIPT_TAI_LE:        Tai Le
 * @PANGO_SCRIPT_UGARITIC:      Ugaritic
 * @PANGO_SCRIPT_NEW_TAI_LUE:   New Tai Lue. Since 1.10
 * @PANGO_SCRIPT_BUGINESE:      Buginese. Since 1.10
 * @PANGO_SCRIPT_GLAGOLITIC:    Glagolitic. Since 1.10
 * @PANGO_SCRIPT_TIFINAGH:      Tifinagh. Since 1.10
 * @PANGO_SCRIPT_SYLOTI_NAGRI:  Syloti Nagri. Since 1.10
 * @PANGO_SCRIPT_OLD_PERSIAN:   Old Persian. Since 1.10
 * @PANGO_SCRIPT_KHAROSHTHI:    Kharoshthi. Since 1.10
 * @PANGO_SCRIPT_UNKNOWN:               an unassigned code point. Since 1.14
 * @PANGO_SCRIPT_BALINESE:              Balinese. Since 1.14
 * @PANGO_SCRIPT_CUNEIFORM:     Cuneiform. Since 1.14
 * @PANGO_SCRIPT_PHOENICIAN:    Phoenician. Since 1.14
 * @PANGO_SCRIPT_PHAGS_PA:              Phags-pa. Since 1.14
 * @PANGO_SCRIPT_NKO:           N'Ko. Since 1.14
 * @PANGO_SCRIPT_KAYAH_LI:   Kayah Li. Since 1.20.1
 * @PANGO_SCRIPT_LEPCHA:     Lepcha. Since 1.20.1
 * @PANGO_SCRIPT_REJANG:     Rejang. Since 1.20.1
 * @PANGO_SCRIPT_SUNDANESE:  Sundanese. Since 1.20.1
 * @PANGO_SCRIPT_SAURASHTRA: Saurashtra. Since 1.20.1
 * @PANGO_SCRIPT_CHAM:       Cham. Since 1.20.1
 * @PANGO_SCRIPT_OL_CHIKI:   Ol Chiki. Since 1.20.1
 * @PANGO_SCRIPT_VAI:        Vai. Since 1.20.1
 * @PANGO_SCRIPT_CARIAN:     Carian. Since 1.20.1
 * @PANGO_SCRIPT_LYCIAN:     Lycian. Since 1.20.1
 * @PANGO_SCRIPT_LYDIAN:     Lydian. Since 1.20.1
 * @PANGO_SCRIPT_BATAK:      Batak. Since 1.32
 * @PANGO_SCRIPT_BRAHMI:     Brahmi. Since 1.32
 * @PANGO_SCRIPT_MANDAIC:    Mandaic. Since 1.32
 * @PANGO_SCRIPT_CHAKMA:               Chakma. Since: 1.32
 * @PANGO_SCRIPT_MEROITIC_CURSIVE:     Meroitic Cursive. Since: 1.32
 * @PANGO_SCRIPT_MEROITIC_HIEROGLYPHS: Meroitic Hieroglyphs. Since: 1.32
 * @PANGO_SCRIPT_MIAO:                 Miao. Since: 1.32
 * @PANGO_SCRIPT_SHARADA:              Sharada. Since: 1.32
 * @PANGO_SCRIPT_SORA_SOMPENG:         Sora Sompeng. Since: 1.32
 * @PANGO_SCRIPT_TAKRI:                Takri. Since: 1.32
 * @PANGO_SCRIPT_BASSA_VAH:            Bassa. Since: 1.40
 * @PANGO_SCRIPT_CAUCASIAN_ALBANIAN:   Caucasian Albanian. Since: 1.40
 * @PANGO_SCRIPT_DUPLOYAN:             Duployan. Since: 1.40
 * @PANGO_SCRIPT_ELBASAN:              Elbasan. Since: 1.40
 * @PANGO_SCRIPT_GRANTHA:              Grantha. Since: 1.40
 * @PANGO_SCRIPT_KHOJKI:               Kjohki. Since: 1.40
 * @PANGO_SCRIPT_KHUDAWADI:            Khudawadi, Sindhi. Since: 1.40
 * @PANGO_SCRIPT_LINEAR_A:             Linear A. Since: 1.40
 * @PANGO_SCRIPT_MAHAJANI:             Mahajani. Since: 1.40
 * @PANGO_SCRIPT_MANICHAEAN:           Manichaean. Since: 1.40
 * @PANGO_SCRIPT_MENDE_KIKAKUI:        Mende Kikakui. Since: 1.40
 * @PANGO_SCRIPT_MODI:                 Modi. Since: 1.40
 * @PANGO_SCRIPT_MRO:                  Mro. Since: 1.40
 * @PANGO_SCRIPT_NABATAEAN:            Nabataean. Since: 1.40
 * @PANGO_SCRIPT_OLD_NORTH_ARABIAN:    Old North Arabian. Since: 1.40
 * @PANGO_SCRIPT_OLD_PERMIC:           Old Permic. Since: 1.40
 * @PANGO_SCRIPT_PAHAWH_HMONG:         Pahawh Hmong. Since: 1.40
 * @PANGO_SCRIPT_PALMYRENE:            Palmyrene. Since: 1.40
 * @PANGO_SCRIPT_PAU_CIN_HAU:          Pau Cin Hau. Since: 1.40
 * @PANGO_SCRIPT_PSALTER_PAHLAVI:      Psalter Pahlavi. Since: 1.40
 * @PANGO_SCRIPT_SIDDHAM:              Siddham. Since: 1.40
 * @PANGO_SCRIPT_TIRHUTA:              Tirhuta. Since: 1.40
 * @PANGO_SCRIPT_WARANG_CITI:          Warang Citi. Since: 1.40
 * @PANGO_SCRIPT_AHOM:                 Ahom. Since: 1.40
 * @PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS: Anatolian Hieroglyphs. Since: 1.40
 * @PANGO_SCRIPT_HATRAN:               Hatran. Since: 1.40
 * @PANGO_SCRIPT_MULTANI:              Multani. Since: 1.40
 * @PANGO_SCRIPT_OLD_HUNGARIAN:        Old Hungarian. Since: 1.40
 * @PANGO_SCRIPT_SIGNWRITING:          Signwriting. Since: 1.40
 *
 * The `PangoScript` enumeration identifies different writing
 * systems.
 *
 * The values correspond to the names as defined in the Unicode standard. See
 * [Unicode Standard Annex 24: Script names](http://www.unicode.org/reports/tr24/)
 *
 * Note that this enumeration is deprecated and will not be updated to include values
 * in newer versions of the Unicode standard. Applications should use the
 * [enum@GLib.UnicodeScript] enumeration instead,
 * whose values are interchangeable with `PangoScript`.
  }
{ ISO 15924 code  }
{ Zyyy  }
{ Qaai  }
{ Arab  }
{ Armn  }
{ Beng  }
{ Bopo  }
{ Cher  }
{ Qaac  }
{ Cyrl (Cyrs)  }
{ Dsrt  }
{ Deva  }
{ Ethi  }
{ Geor (Geon, Geoa)  }
{ Goth  }
{ Grek  }
{ Gujr  }
{ Guru  }
{ Hani  }
{ Hang  }
{ Hebr  }
{ Hira  }
{ Knda  }
{ Kana  }
{ Khmr  }
{ Laoo  }
{ Latn (Latf, Latg)  }
{ Mlym  }
{ Mong  }
{ Mymr  }
{ Ogam  }
{ Ital  }
{ Orya  }
{ Runr  }
{ Sinh  }
{ Syrc (Syrj, Syrn, Syre)  }
{ Taml  }
{ Telu  }
{ Thaa  }
{ Thai  }
{ Tibt  }
{ Cans  }
{ Yiii  }
{ Tglg  }
{ Hano  }
{ Buhd  }
{ Tagb  }
{ Unicode-4.0 additions  }
{ Brai  }
{ Cprt  }
{ Limb  }
{ Osma  }
{ Shaw  }
{ Linb  }
{ Tale  }
{ Ugar  }
{ Unicode-4.1 additions  }
{ Talu  }
{ Bugi  }
{ Glag  }
{ Tfng  }
{ Sylo  }
{ Xpeo  }
{ Khar  }
{ Unicode-5.0 additions  }
{ Zzzz  }
{ Bali  }
{ Xsux  }
{ Phnx  }
{ Phag  }
{ Nkoo  }
{ Unicode-5.1 additions  }
{ Kali  }
{ Lepc  }
{ Rjng  }
{ Sund  }
{ Saur  }
{ Cham  }
{ Olck  }
{ Vaii  }
{ Cari  }
{ Lyci  }
{ Lydi  }
{ Unicode-6.0 additions  }
{ Batk  }
{ Brah  }
{ Mand  }
{ Unicode-6.1 additions  }
{ Cakm  }
{ Merc  }
{ Mero  }
{ Plrd  }
{ Shrd  }
{ Sora  }
{ Takr  }
{ Unicode 7.0 additions  }
{ Bass  }
{ Aghb  }
{ Dupl  }
{ Elba  }
{ Gran  }
{ Khoj  }
{ Sind  }
{ Lina  }
{ Mahj  }
{ Manu  }
{ Mend  }
{ Modi  }
{ Mroo  }
{ Nbat  }
{ Narb  }
{ Perm  }
{ Hmng  }
{ Palm  }
{ Pauc  }
{ Phlp  }
{ Sidd  }
{ Tirh  }
{ Wara  }
{ Unicode 8.0 additions  }
{ Ahom  }
{ Hluw  }
{ Hatr  }
{ Mult  }
{ Hung  }
{ Sgnw  }

  PPangoScript = ^TPangoScript;
  TPangoScript =  Longint;
  Const
    PANGO_SCRIPT_INVALID_CODE = -(1);
    PANGO_SCRIPT_COMMON = 0;
    PANGO_SCRIPT_INHERITED = 1;
    PANGO_SCRIPT_ARABIC = 2;
    PANGO_SCRIPT_ARMENIAN = 3;
    PANGO_SCRIPT_BENGALI = 4;
    PANGO_SCRIPT_BOPOMOFO = 5;
    PANGO_SCRIPT_CHEROKEE = 6;
    PANGO_SCRIPT_COPTIC = 7;
    PANGO_SCRIPT_CYRILLIC = 8;
    PANGO_SCRIPT_DESERET = 9;
    PANGO_SCRIPT_DEVANAGARI = 10;
    PANGO_SCRIPT_ETHIOPIC = 11;
    PANGO_SCRIPT_GEORGIAN = 12;
    PANGO_SCRIPT_GOTHIC = 13;
    PANGO_SCRIPT_GREEK = 14;
    PANGO_SCRIPT_GUJARATI = 15;
    PANGO_SCRIPT_GURMUKHI = 16;
    PANGO_SCRIPT_HAN = 17;
    PANGO_SCRIPT_HANGUL = 18;
    PANGO_SCRIPT_HEBREW = 19;
    PANGO_SCRIPT_HIRAGANA = 20;
    PANGO_SCRIPT_KANNADA = 21;
    PANGO_SCRIPT_KATAKANA = 22;
    PANGO_SCRIPT_KHMER = 23;
    PANGO_SCRIPT_LAO = 24;
    PANGO_SCRIPT_LATIN = 25;
    PANGO_SCRIPT_MALAYALAM = 26;
    PANGO_SCRIPT_MONGOLIAN = 27;
    PANGO_SCRIPT_MYANMAR = 28;
    PANGO_SCRIPT_OGHAM = 29;
    PANGO_SCRIPT_OLD_ITALIC = 30;
    PANGO_SCRIPT_ORIYA = 31;
    PANGO_SCRIPT_RUNIC = 32;
    PANGO_SCRIPT_SINHALA = 33;
    PANGO_SCRIPT_SYRIAC = 34;
    PANGO_SCRIPT_TAMIL = 35;
    PANGO_SCRIPT_TELUGU = 36;
    PANGO_SCRIPT_THAANA = 37;
    PANGO_SCRIPT_THAI = 38;
    PANGO_SCRIPT_TIBETAN = 39;
    PANGO_SCRIPT_CANADIAN_ABORIGINAL = 40;
    PANGO_SCRIPT_YI = 41;
    PANGO_SCRIPT_TAGALOG = 42;
    PANGO_SCRIPT_HANUNOO = 43;
    PANGO_SCRIPT_BUHID = 44;
    PANGO_SCRIPT_TAGBANWA = 45;
    PANGO_SCRIPT_BRAILLE = 46;
    PANGO_SCRIPT_CYPRIOT = 47;
    PANGO_SCRIPT_LIMBU = 48;
    PANGO_SCRIPT_OSMANYA = 49;
    PANGO_SCRIPT_SHAVIAN = 50;
    PANGO_SCRIPT_LINEAR_B = 51;
    PANGO_SCRIPT_TAI_LE = 52;
    PANGO_SCRIPT_UGARITIC = 53;
    PANGO_SCRIPT_NEW_TAI_LUE = 54;
    PANGO_SCRIPT_BUGINESE = 55;
    PANGO_SCRIPT_GLAGOLITIC = 56;
    PANGO_SCRIPT_TIFINAGH = 57;
    PANGO_SCRIPT_SYLOTI_NAGRI = 58;
    PANGO_SCRIPT_OLD_PERSIAN = 59;
    PANGO_SCRIPT_KHAROSHTHI = 60;
    PANGO_SCRIPT_UNKNOWN = 61;
    PANGO_SCRIPT_BALINESE = 62;
    PANGO_SCRIPT_CUNEIFORM = 63;
    PANGO_SCRIPT_PHOENICIAN = 64;
    PANGO_SCRIPT_PHAGS_PA = 65;
    PANGO_SCRIPT_NKO = 66;
    PANGO_SCRIPT_KAYAH_LI = 67;
    PANGO_SCRIPT_LEPCHA = 68;
    PANGO_SCRIPT_REJANG = 69;
    PANGO_SCRIPT_SUNDANESE = 70;
    PANGO_SCRIPT_SAURASHTRA = 71;
    PANGO_SCRIPT_CHAM = 72;
    PANGO_SCRIPT_OL_CHIKI = 73;
    PANGO_SCRIPT_VAI = 74;
    PANGO_SCRIPT_CARIAN = 75;
    PANGO_SCRIPT_LYCIAN = 76;
    PANGO_SCRIPT_LYDIAN = 77;
    PANGO_SCRIPT_BATAK = 78;
    PANGO_SCRIPT_BRAHMI = 79;
    PANGO_SCRIPT_MANDAIC = 80;
    PANGO_SCRIPT_CHAKMA = 81;
    PANGO_SCRIPT_MEROITIC_CURSIVE = 82;
    PANGO_SCRIPT_MEROITIC_HIEROGLYPHS = 83;
    PANGO_SCRIPT_MIAO = 84;
    PANGO_SCRIPT_SHARADA = 85;
    PANGO_SCRIPT_SORA_SOMPENG = 86;
    PANGO_SCRIPT_TAKRI = 87;
    PANGO_SCRIPT_BASSA_VAH = 88;
    PANGO_SCRIPT_CAUCASIAN_ALBANIAN = 89;
    PANGO_SCRIPT_DUPLOYAN = 90;
    PANGO_SCRIPT_ELBASAN = 91;
    PANGO_SCRIPT_GRANTHA = 92;
    PANGO_SCRIPT_KHOJKI = 93;
    PANGO_SCRIPT_KHUDAWADI = 94;
    PANGO_SCRIPT_LINEAR_A = 95;
    PANGO_SCRIPT_MAHAJANI = 96;
    PANGO_SCRIPT_MANICHAEAN = 97;
    PANGO_SCRIPT_MENDE_KIKAKUI = 98;
    PANGO_SCRIPT_MODI = 99;
    PANGO_SCRIPT_MRO = 100;
    PANGO_SCRIPT_NABATAEAN = 101;
    PANGO_SCRIPT_OLD_NORTH_ARABIAN = 102;
    PANGO_SCRIPT_OLD_PERMIC = 103;
    PANGO_SCRIPT_PAHAWH_HMONG = 104;
    PANGO_SCRIPT_PALMYRENE = 105;
    PANGO_SCRIPT_PAU_CIN_HAU = 106;
    PANGO_SCRIPT_PSALTER_PAHLAVI = 107;
    PANGO_SCRIPT_SIDDHAM = 108;
    PANGO_SCRIPT_TIRHUTA = 109;
    PANGO_SCRIPT_WARANG_CITI = 110;
    PANGO_SCRIPT_AHOM = 111;
    PANGO_SCRIPT_ANATOLIAN_HIEROGLYPHS = 112;
    PANGO_SCRIPT_HATRAN = 113;
    PANGO_SCRIPT_MULTANI = 114;
    PANGO_SCRIPT_OLD_HUNGARIAN = 115;
    PANGO_SCRIPT_SIGNWRITING = 116;
;
{$include <pango/pango-version-macros.h>}

function pango_script_for_unichar(ch:Tgunichar):TPangoScript;cdecl;external;
function pango_script_iter_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_script_iter_new(text:Pchar; length:longint):PPangoScriptIter;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure pango_script_iter_get_range(iter:PPangoScriptIter; start:PPchar; end:PPchar; script:PPangoScript);cdecl;external;
function pango_script_iter_next(iter:PPangoScriptIter):Tgboolean;cdecl;external;
procedure pango_script_iter_free(iter:PPangoScriptIter);cdecl;external;
{$include <pango/pango-language.h>}

function pango_script_get_sample_language(script:TPangoScript):PPangoLanguage;cdecl;external;
{$endif}
{ __PANGO_SCRIPT_H__  }

implementation


end.
