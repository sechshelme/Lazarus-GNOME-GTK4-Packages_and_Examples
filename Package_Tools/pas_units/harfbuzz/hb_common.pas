unit hb_common;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

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

  Phb_bool_t = ^Thb_bool_t;
  Thb_bool_t = longint;

  Phb_codepoint_t = ^Thb_codepoint_t;
  Thb_codepoint_t = Tuint32_t;

type
  Phb_position_t = ^Thb_position_t;
  Thb_position_t = Tint32_t;

  Phb_mask_t = ^Thb_mask_t;
  Thb_mask_t = Tuint32_t;

  Thb_var_int_t = record
      case longint of
        0 : ( u32 : Tuint32_t );
        1 : ( i32 : Tint32_t );
        2 : ( u16 : array[0..1] of Tuint16_t );
        3 : ( i16 : array[0..1] of Tint16_t );
        4 : ( u8 : array[0..3] of Tuint8_t );
        5 : ( i8 : array[0..3] of Tint8_t );
      end;
  Phb_var_int_t = ^Thb_var_int_t;

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
  Phb_var_num_t = ^Thb_var_num_t;

  Phb_tag_t = ^Thb_tag_t;
  Thb_tag_t = Tuint32_t;

  const
  HB_TAG_NONE = 0;
  HB_TAG_MAX = (Ord($FF) shl 24) or (Ord($FF) shl 16) or (Ord($FF) shl 8) or Ord($FF);
  HB_TAG_MAX_SIGNED = (Ord($7F) shl 24) or (Ord($FF) shl 16) or (Ord($FF) shl 8) or Ord($FF);


function hb_tag_from_string(str:Pchar; len:longint):Thb_tag_t;cdecl;external libharfbuzz;
procedure hb_tag_to_string(tag:Thb_tag_t; buf:Pchar);cdecl;external libharfbuzz;
type
  Phb_direction_t = ^Thb_direction_t;
  Thb_direction_t =  Longint;
  Const
    HB_DIRECTION_INVALID = 0;
    HB_DIRECTION_LTR = 4;
    HB_DIRECTION_RTL = 5;
    HB_DIRECTION_TTB = 6;
    HB_DIRECTION_BTT = 7;

function hb_direction_from_string(str:Pchar; len:longint):Thb_direction_t;cdecl;external libharfbuzz;
function hb_direction_to_string(direction:Thb_direction_t):Pchar;cdecl;external libharfbuzz;
type
  Phb_language_t = ^Thb_language_t;
  Thb_language_t = Phb_language_impl_t;

function hb_language_from_string(str:Pchar; len:longint):Thb_language_t;cdecl;external libharfbuzz;
function hb_language_to_string(language:Thb_language_t):Pchar;cdecl;external libharfbuzz;

function hb_language_get_default:Thb_language_t;cdecl;external libharfbuzz;
function hb_language_matches(language:Thb_language_t; specific:Thb_language_t):Thb_bool_t;cdecl;external libharfbuzz;
type
  Phb_script_t = ^Thb_script_t;
  Thb_script_t =  Longint;


  const
    HB_SCRIPT_COMMON = (ord('Z')shl 24)or(ord('y')shl 16) or(ord('y')shl 8)or ord('y');
    HB_SCRIPT_INHERITED = (ord('Z')shl 24)or(ord('i')shl 16) or(ord('n')shl 8)or ord('h');
    HB_SCRIPT_UNKNOWN = (ord('Z')shl 24)or(ord('z')shl 16) or(ord('z')shl 8)or ord('z');
    HB_SCRIPT_ARABIC = (ord('A')shl 24)or(ord('r')shl 16) or(ord('a')shl 8)or ord('b');
    HB_SCRIPT_ARMENIAN = (ord('A')shl 24)or(ord('r')shl 16) or(ord('m')shl 8)or ord('n');
    HB_SCRIPT_BENGALI = (ord('B')shl 24)or(ord('e')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_CYRILLIC = (ord('C')shl 24)or(ord('y')shl 16) or(ord('r')shl 8)or ord('l');
    HB_SCRIPT_DEVANAGARI = (ord('D')shl 24)or(ord('e')shl 16) or(ord('v')shl 8)or ord('a');
    HB_SCRIPT_GEORGIAN = (ord('G')shl 24)or(ord('e')shl 16) or(ord('o')shl 8)or ord('r');
    HB_SCRIPT_GREEK = (ord('G')shl 24)or(ord('r')shl 16) or(ord('e')shl 8)or ord('k');
    HB_SCRIPT_GUJARATI = (ord('G')shl 24)or(ord('u')shl 16) or(ord('j')shl 8)or ord('r');
    HB_SCRIPT_GURMUKHI = (ord('G')shl 24)or(ord('u')shl 16) or(ord('r')shl 8)or ord('u');
    HB_SCRIPT_HANGUL = (ord('H')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_HAN = (ord('H')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('i');
    HB_SCRIPT_HEBREW = (ord('H')shl 24)or(ord('e')shl 16) or(ord('b')shl 8)or ord('r');
    HB_SCRIPT_HIRAGANA = (ord('H')shl 24)or(ord('i')shl 16) or(ord('r')shl 8)or ord('a');
    HB_SCRIPT_KANNADA = (ord('K')shl 24)or(ord('n')shl 16) or(ord('d')shl 8)or ord('a');
    HB_SCRIPT_KATAKANA = (ord('K')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('a');
    HB_SCRIPT_LAO = (ord('L')shl 24)or(ord('a')shl 16) or(ord('o')shl 8)or ord('o');
    HB_SCRIPT_LATIN = (ord('L')shl 24)or(ord('a')shl 16) or(ord('t')shl 8)or ord('n');
    HB_SCRIPT_MALAYALAM = (ord('M')shl 24)or(ord('l')shl 16) or(ord('y')shl 8)or ord('m');
    HB_SCRIPT_ORIYA = (ord('O')shl 24)or(ord('r')shl 16) or(ord('y')shl 8)or ord('a');
    HB_SCRIPT_TAMIL = (ord('T')shl 24)or(ord('a')shl 16) or(ord('m')shl 8)or ord('l');
    HB_SCRIPT_TELUGU = (ord('T')shl 24)or(ord('e')shl 16) or(ord('l')shl 8)or ord('u');
    HB_SCRIPT_THAI = (ord('T')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('i');
    HB_SCRIPT_TIBETAN = (ord('T')shl 24)or(ord('i')shl 16) or(ord('b')shl 8)or ord('t');
    HB_SCRIPT_BOPOMOFO = (ord('B')shl 24)or(ord('o')shl 16) or(ord('p')shl 8)or ord('o');
    HB_SCRIPT_BRAILLE = (ord('B')shl 24)or(ord('r')shl 16) or(ord('a')shl 8)or ord('i');
    HB_SCRIPT_CANADIAN_SYLLABICS = (ord('C')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('s');
    HB_SCRIPT_CHEROKEE = (ord('C')shl 24)or(ord('h')shl 16) or(ord('e')shl 8)or ord('r');
    HB_SCRIPT_ETHIOPIC = (ord('E')shl 24)or(ord('t')shl 16) or(ord('h')shl 8)or ord('i');
    HB_SCRIPT_KHMER = (ord('K')shl 24)or(ord('h')shl 16) or(ord('m')shl 8)or ord('r');
    HB_SCRIPT_MONGOLIAN = (ord('M')shl 24)or(ord('o')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_MYANMAR = (ord('M')shl 24)or(ord('y')shl 16) or(ord('m')shl 8)or ord('r');
    HB_SCRIPT_OGHAM = (ord('O')shl 24)or(ord('g')shl 16) or(ord('a')shl 8)or ord('m');
    HB_SCRIPT_RUNIC = (ord('R')shl 24)or(ord('u')shl 16) or(ord('n')shl 8)or ord('r');
    HB_SCRIPT_SINHALA = (ord('S')shl 24)or(ord('i')shl 16) or(ord('n')shl 8)or ord('h');
    HB_SCRIPT_SYRIAC = (ord('S')shl 24)or(ord('y')shl 16) or(ord('r')shl 8)or ord('c');
    HB_SCRIPT_THAANA = (ord('T')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('a');
    HB_SCRIPT_YI = (ord('Y')shl 24)or(ord('i')shl 16) or(ord('i')shl 8)or ord('i');
    HB_SCRIPT_DESERET = (ord('D')shl 24)or(ord('s')shl 16) or(ord('r')shl 8)or ord('t');
    HB_SCRIPT_GOTHIC = (ord('G')shl 24)or(ord('o')shl 16) or(ord('t')shl 8)or ord('h');
    HB_SCRIPT_OLD_ITALIC = (ord('I')shl 24)or(ord('t')shl 16) or(ord('a')shl 8)or ord('l');
    HB_SCRIPT_BUHID = (ord('B')shl 24)or(ord('u')shl 16) or(ord('h')shl 8)or ord('d');
    HB_SCRIPT_HANUNOO = (ord('H')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('o');
    HB_SCRIPT_TAGALOG = (ord('T')shl 24)or(ord('g')shl 16) or(ord('l')shl 8)or ord('g');
    HB_SCRIPT_TAGBANWA = (ord('T')shl 24)or(ord('a')shl 16) or(ord('g')shl 8)or ord('b');
    HB_SCRIPT_CYPRIOT = (ord('C')shl 24)or(ord('p')shl 16) or(ord('r')shl 8)or ord('t');
    HB_SCRIPT_LIMBU = (ord('L')shl 24)or(ord('i')shl 16) or(ord('m')shl 8)or ord('b');
    HB_SCRIPT_LINEAR_B = (ord('L')shl 24)or(ord('i')shl 16) or(ord('n')shl 8)or ord('b');
    HB_SCRIPT_OSMANYA = (ord('O')shl 24)or(ord('s')shl 16) or(ord('m')shl 8)or ord('a');
    HB_SCRIPT_SHAVIAN = (ord('S')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('w');
    HB_SCRIPT_TAI_LE = (ord('T')shl 24)or(ord('a')shl 16) or(ord('l')shl 8)or ord('e');
    HB_SCRIPT_UGARITIC = (ord('U')shl 24)or(ord('g')shl 16) or(ord('a')shl 8)or ord('r');
    HB_SCRIPT_BUGINESE = (ord('B')shl 24)or(ord('u')shl 16) or(ord('g')shl 8)or ord('i');
    HB_SCRIPT_COPTIC = (ord('C')shl 24)or(ord('o')shl 16) or(ord('p')shl 8)or ord('t');
    HB_SCRIPT_GLAGOLITIC = (ord('G')shl 24)or(ord('l')shl 16) or(ord('a')shl 8)or ord('g');
    HB_SCRIPT_KHAROSHTHI = (ord('K')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('r');
    HB_SCRIPT_NEW_TAI_LUE = (ord('T')shl 24)or(ord('a')shl 16) or(ord('l')shl 8)or ord('u');
    HB_SCRIPT_OLD_PERSIAN = (ord('X')shl 24)or(ord('p')shl 16) or(ord('e')shl 8)or ord('o');
    HB_SCRIPT_SYLOTI_NAGRI = (ord('S')shl 24)or(ord('y')shl 16) or(ord('l')shl 8)or ord('o');
    HB_SCRIPT_TIFINAGH = (ord('T')shl 24)or(ord('f')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_BALINESE = (ord('B')shl 24)or(ord('a')shl 16) or(ord('l')shl 8)or ord('i');
    HB_SCRIPT_CUNEIFORM = (ord('X')shl 24)or(ord('s')shl 16) or(ord('u')shl 8)or ord('x');
    HB_SCRIPT_NKO = (ord('N')shl 24)or(ord('k')shl 16) or(ord('o')shl 8)or ord('o');
    HB_SCRIPT_PHAGS_PA = (ord('P')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('g');
    HB_SCRIPT_PHOENICIAN = (ord('P')shl 24)or(ord('h')shl 16) or(ord('n')shl 8)or ord('x');
    HB_SCRIPT_CARIAN = (ord('C')shl 24)or(ord('a')shl 16) or(ord('r')shl 8)or ord('i');
    HB_SCRIPT_CHAM = (ord('C')shl 24)or(ord('h')shl 16) or(ord('a')shl 8)or ord('m');
    HB_SCRIPT_KAYAH_LI = (ord('K')shl 24)or(ord('a')shl 16) or(ord('l')shl 8)or ord('i');
    HB_SCRIPT_LEPCHA = (ord('L')shl 24)or(ord('e')shl 16) or(ord('p')shl 8)or ord('c');
    HB_SCRIPT_LYCIAN = (ord('L')shl 24)or(ord('y')shl 16) or(ord('c')shl 8)or ord('i');
    HB_SCRIPT_LYDIAN = (ord('L')shl 24)or(ord('y')shl 16) or(ord('d')shl 8)or ord('i');
    HB_SCRIPT_OL_CHIKI = (ord('O')shl 24)or(ord('l')shl 16) or(ord('c')shl 8)or ord('k');
    HB_SCRIPT_REJANG = (ord('R')shl 24)or(ord('j')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_SAURASHTRA = (ord('S')shl 24)or(ord('a')shl 16) or(ord('u')shl 8)or ord('r');
    HB_SCRIPT_SUNDANESE = (ord('S')shl 24)or(ord('u')shl 16) or(ord('n')shl 8)or ord('d');
    HB_SCRIPT_VAI = (ord('V')shl 24)or(ord('a')shl 16) or(ord('i')shl 8)or ord('i');
    HB_SCRIPT_AVESTAN = (ord('A')shl 24)or(ord('v')shl 16) or(ord('s')shl 8)or ord('t');
    HB_SCRIPT_BAMUM = (ord('B')shl 24)or(ord('a')shl 16) or(ord('m')shl 8)or ord('u');
    HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = (ord('E')shl 24)or(ord('g')shl 16) or(ord('y')shl 8)or ord('p');
    HB_SCRIPT_IMPERIAL_ARAMAIC = (ord('A')shl 24)or(ord('r')shl 16) or(ord('m')shl 8)or ord('i');
    HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = (ord('P')shl 24)or(ord('h')shl 16) or(ord('l')shl 8)or ord('i');
    HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = (ord('P')shl 24)or(ord('r')shl 16) or(ord('t')shl 8)or ord('i');
    HB_SCRIPT_JAVANESE = (ord('J')shl 24)or(ord('a')shl 16) or(ord('v')shl 8)or ord('a');
    HB_SCRIPT_KAITHI = (ord('K')shl 24)or(ord('t')shl 16) or(ord('h')shl 8)or ord('i');
    HB_SCRIPT_LISU = (ord('L')shl 24)or(ord('i')shl 16) or(ord('s')shl 8)or ord('u');
    HB_SCRIPT_MEETEI_MAYEK = (ord('M')shl 24)or(ord('t')shl 16) or(ord('e')shl 8)or ord('i');
    HB_SCRIPT_OLD_SOUTH_ARABIAN = (ord('S')shl 24)or(ord('a')shl 16) or(ord('r')shl 8)or ord('b');
    HB_SCRIPT_OLD_TURKIC = (ord('O')shl 24)or(ord('r')shl 16) or(ord('k')shl 8)or ord('h');
    HB_SCRIPT_SAMARITAN = (ord('S')shl 24)or(ord('a')shl 16) or(ord('m')shl 8)or ord('r');
    HB_SCRIPT_TAI_THAM = (ord('L')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('a');
    HB_SCRIPT_TAI_VIET = (ord('T')shl 24)or(ord('a')shl 16) or(ord('v')shl 8)or ord('t');
    HB_SCRIPT_BATAK = (ord('B')shl 24)or(ord('a')shl 16) or(ord('t')shl 8)or ord('k');
    HB_SCRIPT_BRAHMI = (ord('B')shl 24)or(ord('r')shl 16) or(ord('a')shl 8)or ord('h');
    HB_SCRIPT_MANDAIC = (ord('M')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('d');
    HB_SCRIPT_CHAKMA = (ord('C')shl 24)or(ord('a')shl 16) or(ord('k')shl 8)or ord('m');
    HB_SCRIPT_MEROITIC_CURSIVE = (ord('M')shl 24)or(ord('e')shl 16) or(ord('r')shl 8)or ord('c');
    HB_SCRIPT_MEROITIC_HIEROGLYPHS = (ord('M')shl 24)or(ord('e')shl 16) or(ord('r')shl 8)or ord('o');
    HB_SCRIPT_MIAO = (ord('P')shl 24)or(ord('l')shl 16) or(ord('r')shl 8)or ord('d');
    HB_SCRIPT_SHARADA = (ord('S')shl 24)or(ord('h')shl 16) or(ord('r')shl 8)or ord('d');
    HB_SCRIPT_SORA_SOMPENG = (ord('S')shl 24)or(ord('o')shl 16) or(ord('r')shl 8)or ord('a');
    HB_SCRIPT_TAKRI = (ord('T')shl 24)or(ord('a')shl 16) or(ord('k')shl 8)or ord('r');
    HB_SCRIPT_BASSA_VAH = (ord('B')shl 24)or(ord('a')shl 16) or(ord('s')shl 8)or ord('s');
    HB_SCRIPT_CAUCASIAN_ALBANIAN = (ord('A')shl 24)or(ord('g')shl 16) or(ord('h')shl 8)or ord('b');
    HB_SCRIPT_DUPLOYAN = (ord('D')shl 24)or(ord('u')shl 16) or(ord('p')shl 8)or ord('l');
    HB_SCRIPT_ELBASAN = (ord('E')shl 24)or(ord('l')shl 16) or(ord('b')shl 8)or ord('a');
    HB_SCRIPT_GRANTHA = (ord('G')shl 24)or(ord('r')shl 16) or(ord('a')shl 8)or ord('n');
    HB_SCRIPT_KHOJKI = (ord('K')shl 24)or(ord('h')shl 16) or(ord('o')shl 8)or ord('j');
    HB_SCRIPT_KHUDAWADI = (ord('S')shl 24)or(ord('i')shl 16) or(ord('n')shl 8)or ord('d');
    HB_SCRIPT_LINEAR_A = (ord('L')shl 24)or(ord('i')shl 16) or(ord('n')shl 8)or ord('a');
    HB_SCRIPT_MAHAJANI = (ord('M')shl 24)or(ord('a')shl 16) or(ord('h')shl 8)or ord('j');
    HB_SCRIPT_MANICHAEAN = (ord('M')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('i');
    HB_SCRIPT_MENDE_KIKAKUI = (ord('M')shl 24)or(ord('e')shl 16) or(ord('n')shl 8)or ord('d');
    HB_SCRIPT_MODI = (ord('M')shl 24)or(ord('o')shl 16) or(ord('d')shl 8)or ord('i');
    HB_SCRIPT_MRO = (ord('M')shl 24)or(ord('r')shl 16) or(ord('o')shl 8)or ord('o');
    HB_SCRIPT_NABATAEAN = (ord('N')shl 24)or(ord('b')shl 16) or(ord('a')shl 8)or ord('t');
    HB_SCRIPT_OLD_NORTH_ARABIAN = (ord('N')shl 24)or(ord('a')shl 16) or(ord('r')shl 8)or ord('b');
    HB_SCRIPT_OLD_PERMIC = (ord('P')shl 24)or(ord('e')shl 16) or(ord('r')shl 8)or ord('m');
    HB_SCRIPT_PAHAWH_HMONG = (ord('H')shl 24)or(ord('m')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_PALMYRENE = (ord('P')shl 24)or(ord('a')shl 16) or(ord('l')shl 8)or ord('m');
    HB_SCRIPT_PAU_CIN_HAU = (ord('P')shl 24)or(ord('a')shl 16) or(ord('u')shl 8)or ord('c');
    HB_SCRIPT_PSALTER_PAHLAVI = (ord('P')shl 24)or(ord('h')shl 16) or(ord('l')shl 8)or ord('p');
    HB_SCRIPT_SIDDHAM = (ord('S')shl 24)or(ord('i')shl 16) or(ord('d')shl 8)or ord('d');
    HB_SCRIPT_TIRHUTA = (ord('T')shl 24)or(ord('i')shl 16) or(ord('r')shl 8)or ord('h');
    HB_SCRIPT_WARANG_CITI = (ord('W')shl 24)or(ord('a')shl 16) or(ord('r')shl 8)or ord('a');
    HB_SCRIPT_AHOM = (ord('A')shl 24)or(ord('h')shl 16) or(ord('o')shl 8)or ord('m');
    HB_SCRIPT_ANATOLIAN_HIEROGLYPHS = (ord('H')shl 24)or(ord('l')shl 16) or(ord('u')shl 8)or ord('w');
    HB_SCRIPT_HATRAN = (ord('H')shl 24)or(ord('a')shl 16) or(ord('t')shl 8)or ord('r');
    HB_SCRIPT_MULTANI = (ord('M')shl 24)or(ord('u')shl 16) or(ord('l')shl 8)or ord('t');
    HB_SCRIPT_OLD_HUNGARIAN = (ord('H')shl 24)or(ord('u')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_SIGNWRITING = (ord('S')shl 24)or(ord('g')shl 16) or(ord('n')shl 8)or ord('w');
    HB_SCRIPT_ADLAM = (ord('A')shl 24)or(ord('d')shl 16) or(ord('l')shl 8)or ord('m');
    HB_SCRIPT_BHAIKSUKI = (ord('B')shl 24)or(ord('h')shl 16) or(ord('k')shl 8)or ord('s');
    HB_SCRIPT_MARCHEN = (ord('M')shl 24)or(ord('a')shl 16) or(ord('r')shl 8)or ord('c');
    HB_SCRIPT_OSAGE = (ord('O')shl 24)or(ord('s')shl 16) or(ord('g')shl 8)or ord('e');
    HB_SCRIPT_TANGUT = (ord('T')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_NEWA = (ord('N')shl 24)or(ord('e')shl 16) or(ord('w')shl 8)or ord('a');
    HB_SCRIPT_MASARAM_GONDI = (ord('G')shl 24)or(ord('o')shl 16) or(ord('n')shl 8)or ord('m');
    HB_SCRIPT_NUSHU = (ord('N')shl 24)or(ord('s')shl 16) or(ord('h')shl 8)or ord('u');
    HB_SCRIPT_SOYOMBO = (ord('S')shl 24)or(ord('o')shl 16) or(ord('y')shl 8)or ord('o');
    HB_SCRIPT_ZANABAZAR_SQUARE = (ord('Z')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('b');
    HB_SCRIPT_DOGRA = (ord('D')shl 24)or(ord('o')shl 16) or(ord('g')shl 8)or ord('r');
    HB_SCRIPT_GUNJALA_GONDI = (ord('G')shl 24)or(ord('o')shl 16) or(ord('n')shl 8)or ord('g');
    HB_SCRIPT_HANIFI_ROHINGYA = (ord('R')shl 24)or(ord('o')shl 16) or(ord('h')shl 8)or ord('g');
    HB_SCRIPT_MAKASAR = (ord('M')shl 24)or(ord('a')shl 16) or(ord('k')shl 8)or ord('a');
    HB_SCRIPT_MEDEFAIDRIN = (ord('M')shl 24)or(ord('e')shl 16) or(ord('d')shl 8)or ord('f');
    HB_SCRIPT_OLD_SOGDIAN = (ord('S')shl 24)or(ord('o')shl 16) or(ord('g')shl 8)or ord('o');
    HB_SCRIPT_SOGDIAN = (ord('S')shl 24)or(ord('o')shl 16) or(ord('g')shl 8)or ord('d');
    HB_SCRIPT_ELYMAIC = (ord('E')shl 24)or(ord('l')shl 16) or(ord('y')shl 8)or ord('m');
    HB_SCRIPT_NANDINAGARI = (ord('N')shl 24)or(ord('a')shl 16) or(ord('n')shl 8)or ord('d');
    HB_SCRIPT_NYIAKENG_PUACHUE_HMONG = (ord('H')shl 24)or(ord('m')shl 16) or(ord('n')shl 8)or ord('p');
    HB_SCRIPT_WANCHO = (ord('W')shl 24)or(ord('c')shl 16) or(ord('h')shl 8)or ord('o');
    HB_SCRIPT_CHORASMIAN = (ord('C')shl 24)or(ord('h')shl 16) or(ord('r')shl 8)or ord('s');
    HB_SCRIPT_DIVES_AKURU = (ord('D')shl 24)or(ord('i')shl 16) or(ord('a')shl 8)or ord('k');
    HB_SCRIPT_KHITAN_SMALL_SCRIPT = (ord('K')shl 24)or(ord('i')shl 16) or(ord('t')shl 8)or ord('s');
    HB_SCRIPT_YEZIDI = (ord('Y')shl 24)or(ord('e')shl 16) or(ord('z')shl 8)or ord('i');
    HB_SCRIPT_CYPRO_MINOAN = (ord('C')shl 24)or(ord('p')shl 16) or(ord('m')shl 8)or ord('n');
    HB_SCRIPT_OLD_UYGHUR = (ord('O')shl 24)or(ord('u')shl 16) or(ord('g')shl 8)or ord('r');
    HB_SCRIPT_TANGSA = (ord('T')shl 24)or(ord('n')shl 16) or(ord('s')shl 8)or ord('a');
    HB_SCRIPT_TOTO = (ord('T')shl 24)or(ord('o')shl 16) or(ord('t')shl 8)or ord('o');
    HB_SCRIPT_VITHKUQI = (ord('V')shl 24)or(ord('i')shl 16) or(ord('t')shl 8)or ord('h');
    HB_SCRIPT_MATH = (ord('Z')shl 24)or(ord('m')shl 16) or(ord('t')shl 8)or ord('h');
    HB_SCRIPT_KAWI = (ord('K')shl 24)or(ord('a')shl 16) or(ord('w')shl 8)or ord('i');
    HB_SCRIPT_NAG_MUNDARI = (ord('N')shl 24)or(ord('a')shl 16) or(ord('g')shl 8)or ord('m');

    HB_SCRIPT_INVALID = HB_TAG_NONE;
    _HB_SCRIPT_MAX_VALUE = HB_TAG_MAX_SIGNED;
    _HB_SCRIPT_MAX_VALUE_SIGNED = HB_TAG_MAX_SIGNED;

function hb_script_from_iso15924_tag(tag:Thb_tag_t):Thb_script_t;cdecl;external libharfbuzz;
function hb_script_from_string(str:Pchar; len:longint):Thb_script_t;cdecl;external libharfbuzz;
function hb_script_to_iso15924_tag(script:Thb_script_t):Thb_tag_t;cdecl;external libharfbuzz;
function hb_script_get_horizontal_direction(script:Thb_script_t):Thb_direction_t;cdecl;external libharfbuzz;
type
  Thb_user_data_key_t = record
      unused : char;
    end;
  Phb_user_data_key_t = ^Thb_user_data_key_t;

  Thb_destroy_func_t = procedure (user_data:pointer);cdecl;
const
  HB_FEATURE_GLOBAL_START = 0;  

type
  Phb_feature_t = ^Thb_feature_t;
  Thb_feature_t = record
      tag : Thb_tag_t;
      value : Tuint32_t;
      start : dword;
      end : dword;
    end;

function hb_feature_from_string(str:Pchar; len:longint; feature:Phb_feature_t):Thb_bool_t;cdecl;external libharfbuzz;
procedure hb_feature_to_string(feature:Phb_feature_t; buf:Pchar; size:dword);cdecl;external libharfbuzz;
type
  Thb_variation_t = record
      tag : Thb_tag_t;
      value : single;
    end;
  Phb_variation_t = ^Thb_variation_t;

function hb_variation_from_string(str:Pchar; len:longint; variation:Phb_variation_t):Thb_bool_t;cdecl;external libharfbuzz;
procedure hb_variation_to_string(variation:Phb_variation_t; buf:Pchar; size:dword);cdecl;external libharfbuzz;
type
  Phb_color_t = ^Thb_color_t;
  Thb_color_t = Tuint32_t;

function hb_color_get_alpha(color:Thb_color_t):Tuint8_t;cdecl;external libharfbuzz;
function hb_color_get_red(color:Thb_color_t):Tuint8_t;cdecl;external libharfbuzz;
function hb_color_get_green(color:Thb_color_t):Tuint8_t;cdecl;external libharfbuzz;
function hb_color_get_blue(color:Thb_color_t):Tuint8_t;cdecl;external libharfbuzz;

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

function HB_CODEPOINT_INVALID : Thb_codepoint_t;
function HB_TAG(c1,c2,c3,c4 : longint) : Thb_tag_t;

{ xxxxxxxxxxxxxxxxxxxxxxxxx }
{ #define HB_UNTAG(tag) (uint8_t)(((tag)>>24)&0xFF), (uint8_t)(((tag)>>16)&0xFF), (uint8_t)(((tag)>>8)&0xFF), (uint8_t)((tag)&0xFF) }
function HB_TAG_NONE : longint; { return type might be wrong }
function HB_TAG_MAX : longint; { return type might be wrong }
function HB_TAG_MAX_SIGNED : longint; { return type might be wrong }

function HB_DIRECTION_IS_VALID(dir : longint) : longint;
function HB_DIRECTION_IS_HORIZONTAL(dir : longint) : longint;
function HB_DIRECTION_IS_VERTICAL(dir : longint) : longint;
function HB_DIRECTION_IS_FORWARD(dir : longint) : longint;
function HB_DIRECTION_IS_BACKWARD(dir : longint) : longint;
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
  function HB_LANGUAGE_INVALID : Thb_language_t;

  function HB_FEATURE_GLOBAL_END : dword;

  function HB_COLOR(b,g,r,a : longint) : Thb_color_t;


// === Konventiert am: 25-12-24 16:53:42 ===


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


end.
