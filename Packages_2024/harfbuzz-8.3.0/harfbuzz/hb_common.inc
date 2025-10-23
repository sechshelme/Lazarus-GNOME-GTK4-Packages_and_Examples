{$IFDEF read_interface}

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
//   === ausgelagert
  Thb_font_t = record
  end;
  Phb_font_t = ^Thb_font_t;
  // ====

  Phb_position_t = ^Thb_position_t;
  Thb_position_t = Tint32_t;

  Phb_mask_t = ^Thb_mask_t;
  Thb_mask_t = Tuint32_t;

  Thb_var_int_t = record
    case longint of
      0: (u32: Tuint32_t);
      1: (i32: Tint32_t);
      2: (u16: array[0..1] of Tuint16_t);
      3: (i16: array[0..1] of Tint16_t);
      4: (u8: array[0..3] of Tuint8_t);
      5: (i8: array[0..3] of Tint8_t);
  end;
  Phb_var_int_t = ^Thb_var_int_t;

  Thb_var_num_t = record
    case longint of
      0: (f: single);
      1: (u32: Tuint32_t);
      2: (i32: Tint32_t);
      3: (u16: array[0..1] of Tuint16_t);
      4: (i16: array[0..1] of Tint16_t);
      5: (u8: array[0..3] of Tuint8_t);
      6: (i8: array[0..3] of Tint8_t);
  end;
  Phb_var_num_t = ^Thb_var_num_t;

  Phb_tag_t = ^Thb_tag_t;
  Thb_tag_t = Tuint32_t;

const
  HB_TAG_NONE = 0;
  HB_TAG_MAX = (Ord($FF) shl 24) or (Ord($FF) shl 16) or (Ord($FF) shl 8) or Ord($FF);
  HB_TAG_MAX_SIGNED = (Ord($7F) shl 24) or (Ord($FF) shl 16) or (Ord($FF) shl 8) or Ord($FF);


function hb_tag_from_string(str: pchar; len: longint): Thb_tag_t; cdecl; external libharfbuzz;
procedure hb_tag_to_string(tag: Thb_tag_t; buf: pchar); cdecl; external libharfbuzz;

type
  Phb_direction_t = ^Thb_direction_t;
  Thb_direction_t = longint;

const
  HB_DIRECTION_INVALID = 0;
  HB_DIRECTION_LTR = 4;
  HB_DIRECTION_RTL = 5;
  HB_DIRECTION_TTB = 6;
  HB_DIRECTION_BTT = 7;

function hb_direction_from_string(str: pchar; len: longint): Thb_direction_t; cdecl; external libharfbuzz;
function hb_direction_to_string(direction: Thb_direction_t): pchar; cdecl; external libharfbuzz;

type
  Phb_language_impl_t = Pointer;
  Phb_language_t = ^Thb_language_t;
  Thb_language_t = Phb_language_impl_t;

function hb_language_from_string(str: pchar; len: longint): Thb_language_t; cdecl; external libharfbuzz;
function hb_language_to_string(language: Thb_language_t): pchar; cdecl; external libharfbuzz;

function hb_language_get_default: Thb_language_t; cdecl; external libharfbuzz;
function hb_language_matches(language: Thb_language_t; specific: Thb_language_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Phb_script_t = ^Thb_script_t;
  Thb_script_t = longint;

const
  HB_SCRIPT_COMMON = (Ord('Z') shl 24) or (Ord('y') shl 16) or (Ord('y') shl 8) or Ord('y');
  HB_SCRIPT_INHERITED = (Ord('Z') shl 24) or (Ord('i') shl 16) or (Ord('n') shl 8) or Ord('h');
  HB_SCRIPT_UNKNOWN = (Ord('Z') shl 24) or (Ord('z') shl 16) or (Ord('z') shl 8) or Ord('z');
  HB_SCRIPT_ARABIC = (Ord('A') shl 24) or (Ord('r') shl 16) or (Ord('a') shl 8) or Ord('b');
  HB_SCRIPT_ARMENIAN = (Ord('A') shl 24) or (Ord('r') shl 16) or (Ord('m') shl 8) or Ord('n');
  HB_SCRIPT_BENGALI = (Ord('B') shl 24) or (Ord('e') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_CYRILLIC = (Ord('C') shl 24) or (Ord('y') shl 16) or (Ord('r') shl 8) or Ord('l');
  HB_SCRIPT_DEVANAGARI = (Ord('D') shl 24) or (Ord('e') shl 16) or (Ord('v') shl 8) or Ord('a');
  HB_SCRIPT_GEORGIAN = (Ord('G') shl 24) or (Ord('e') shl 16) or (Ord('o') shl 8) or Ord('r');
  HB_SCRIPT_GREEK = (Ord('G') shl 24) or (Ord('r') shl 16) or (Ord('e') shl 8) or Ord('k');
  HB_SCRIPT_GUJARATI = (Ord('G') shl 24) or (Ord('u') shl 16) or (Ord('j') shl 8) or Ord('r');
  HB_SCRIPT_GURMUKHI = (Ord('G') shl 24) or (Ord('u') shl 16) or (Ord('r') shl 8) or Ord('u');
  HB_SCRIPT_HANGUL = (Ord('H') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_HAN = (Ord('H') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('i');
  HB_SCRIPT_HEBREW = (Ord('H') shl 24) or (Ord('e') shl 16) or (Ord('b') shl 8) or Ord('r');
  HB_SCRIPT_HIRAGANA = (Ord('H') shl 24) or (Ord('i') shl 16) or (Ord('r') shl 8) or Ord('a');
  HB_SCRIPT_KANNADA = (Ord('K') shl 24) or (Ord('n') shl 16) or (Ord('d') shl 8) or Ord('a');
  HB_SCRIPT_KATAKANA = (Ord('K') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('a');
  HB_SCRIPT_LAO = (Ord('L') shl 24) or (Ord('a') shl 16) or (Ord('o') shl 8) or Ord('o');
  HB_SCRIPT_LATIN = (Ord('L') shl 24) or (Ord('a') shl 16) or (Ord('t') shl 8) or Ord('n');
  HB_SCRIPT_MALAYALAM = (Ord('M') shl 24) or (Ord('l') shl 16) or (Ord('y') shl 8) or Ord('m');
  HB_SCRIPT_ORIYA = (Ord('O') shl 24) or (Ord('r') shl 16) or (Ord('y') shl 8) or Ord('a');
  HB_SCRIPT_TAMIL = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('m') shl 8) or Ord('l');
  HB_SCRIPT_TELUGU = (Ord('T') shl 24) or (Ord('e') shl 16) or (Ord('l') shl 8) or Ord('u');
  HB_SCRIPT_THAI = (Ord('T') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('i');
  HB_SCRIPT_TIBETAN = (Ord('T') shl 24) or (Ord('i') shl 16) or (Ord('b') shl 8) or Ord('t');
  HB_SCRIPT_BOPOMOFO = (Ord('B') shl 24) or (Ord('o') shl 16) or (Ord('p') shl 8) or Ord('o');
  HB_SCRIPT_BRAILLE = (Ord('B') shl 24) or (Ord('r') shl 16) or (Ord('a') shl 8) or Ord('i');
  HB_SCRIPT_CANADIAN_SYLLABICS = (Ord('C') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('s');
  HB_SCRIPT_CHEROKEE = (Ord('C') shl 24) or (Ord('h') shl 16) or (Ord('e') shl 8) or Ord('r');
  HB_SCRIPT_ETHIOPIC = (Ord('E') shl 24) or (Ord('t') shl 16) or (Ord('h') shl 8) or Ord('i');
  HB_SCRIPT_KHMER = (Ord('K') shl 24) or (Ord('h') shl 16) or (Ord('m') shl 8) or Ord('r');
  HB_SCRIPT_MONGOLIAN = (Ord('M') shl 24) or (Ord('o') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_MYANMAR = (Ord('M') shl 24) or (Ord('y') shl 16) or (Ord('m') shl 8) or Ord('r');
  HB_SCRIPT_OGHAM = (Ord('O') shl 24) or (Ord('g') shl 16) or (Ord('a') shl 8) or Ord('m');
  HB_SCRIPT_RUNIC = (Ord('R') shl 24) or (Ord('u') shl 16) or (Ord('n') shl 8) or Ord('r');
  HB_SCRIPT_SINHALA = (Ord('S') shl 24) or (Ord('i') shl 16) or (Ord('n') shl 8) or Ord('h');
  HB_SCRIPT_SYRIAC = (Ord('S') shl 24) or (Ord('y') shl 16) or (Ord('r') shl 8) or Ord('c');
  HB_SCRIPT_THAANA = (Ord('T') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('a');
  HB_SCRIPT_YI = (Ord('Y') shl 24) or (Ord('i') shl 16) or (Ord('i') shl 8) or Ord('i');
  HB_SCRIPT_DESERET = (Ord('D') shl 24) or (Ord('s') shl 16) or (Ord('r') shl 8) or Ord('t');
  HB_SCRIPT_GOTHIC = (Ord('G') shl 24) or (Ord('o') shl 16) or (Ord('t') shl 8) or Ord('h');
  HB_SCRIPT_OLD_ITALIC = (Ord('I') shl 24) or (Ord('t') shl 16) or (Ord('a') shl 8) or Ord('l');
  HB_SCRIPT_BUHID = (Ord('B') shl 24) or (Ord('u') shl 16) or (Ord('h') shl 8) or Ord('d');
  HB_SCRIPT_HANUNOO = (Ord('H') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('o');
  HB_SCRIPT_TAGALOG = (Ord('T') shl 24) or (Ord('g') shl 16) or (Ord('l') shl 8) or Ord('g');
  HB_SCRIPT_TAGBANWA = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('g') shl 8) or Ord('b');
  HB_SCRIPT_CYPRIOT = (Ord('C') shl 24) or (Ord('p') shl 16) or (Ord('r') shl 8) or Ord('t');
  HB_SCRIPT_LIMBU = (Ord('L') shl 24) or (Ord('i') shl 16) or (Ord('m') shl 8) or Ord('b');
  HB_SCRIPT_LINEAR_B = (Ord('L') shl 24) or (Ord('i') shl 16) or (Ord('n') shl 8) or Ord('b');
  HB_SCRIPT_OSMANYA = (Ord('O') shl 24) or (Ord('s') shl 16) or (Ord('m') shl 8) or Ord('a');
  HB_SCRIPT_SHAVIAN = (Ord('S') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('w');
  HB_SCRIPT_TAI_LE = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('l') shl 8) or Ord('e');
  HB_SCRIPT_UGARITIC = (Ord('U') shl 24) or (Ord('g') shl 16) or (Ord('a') shl 8) or Ord('r');
  HB_SCRIPT_BUGINESE = (Ord('B') shl 24) or (Ord('u') shl 16) or (Ord('g') shl 8) or Ord('i');
  HB_SCRIPT_COPTIC = (Ord('C') shl 24) or (Ord('o') shl 16) or (Ord('p') shl 8) or Ord('t');
  HB_SCRIPT_GLAGOLITIC = (Ord('G') shl 24) or (Ord('l') shl 16) or (Ord('a') shl 8) or Ord('g');
  HB_SCRIPT_KHAROSHTHI = (Ord('K') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('r');
  HB_SCRIPT_NEW_TAI_LUE = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('l') shl 8) or Ord('u');
  HB_SCRIPT_OLD_PERSIAN = (Ord('X') shl 24) or (Ord('p') shl 16) or (Ord('e') shl 8) or Ord('o');
  HB_SCRIPT_SYLOTI_NAGRI = (Ord('S') shl 24) or (Ord('y') shl 16) or (Ord('l') shl 8) or Ord('o');
  HB_SCRIPT_TIFINAGH = (Ord('T') shl 24) or (Ord('f') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_BALINESE = (Ord('B') shl 24) or (Ord('a') shl 16) or (Ord('l') shl 8) or Ord('i');
  HB_SCRIPT_CUNEIFORM = (Ord('X') shl 24) or (Ord('s') shl 16) or (Ord('u') shl 8) or Ord('x');
  HB_SCRIPT_NKO = (Ord('N') shl 24) or (Ord('k') shl 16) or (Ord('o') shl 8) or Ord('o');
  HB_SCRIPT_PHAGS_PA = (Ord('P') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('g');
  HB_SCRIPT_PHOENICIAN = (Ord('P') shl 24) or (Ord('h') shl 16) or (Ord('n') shl 8) or Ord('x');
  HB_SCRIPT_CARIAN = (Ord('C') shl 24) or (Ord('a') shl 16) or (Ord('r') shl 8) or Ord('i');
  HB_SCRIPT_CHAM = (Ord('C') shl 24) or (Ord('h') shl 16) or (Ord('a') shl 8) or Ord('m');
  HB_SCRIPT_KAYAH_LI = (Ord('K') shl 24) or (Ord('a') shl 16) or (Ord('l') shl 8) or Ord('i');
  HB_SCRIPT_LEPCHA = (Ord('L') shl 24) or (Ord('e') shl 16) or (Ord('p') shl 8) or Ord('c');
  HB_SCRIPT_LYCIAN = (Ord('L') shl 24) or (Ord('y') shl 16) or (Ord('c') shl 8) or Ord('i');
  HB_SCRIPT_LYDIAN = (Ord('L') shl 24) or (Ord('y') shl 16) or (Ord('d') shl 8) or Ord('i');
  HB_SCRIPT_OL_CHIKI = (Ord('O') shl 24) or (Ord('l') shl 16) or (Ord('c') shl 8) or Ord('k');
  HB_SCRIPT_REJANG = (Ord('R') shl 24) or (Ord('j') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_SAURASHTRA = (Ord('S') shl 24) or (Ord('a') shl 16) or (Ord('u') shl 8) or Ord('r');
  HB_SCRIPT_SUNDANESE = (Ord('S') shl 24) or (Ord('u') shl 16) or (Ord('n') shl 8) or Ord('d');
  HB_SCRIPT_VAI = (Ord('V') shl 24) or (Ord('a') shl 16) or (Ord('i') shl 8) or Ord('i');
  HB_SCRIPT_AVESTAN = (Ord('A') shl 24) or (Ord('v') shl 16) or (Ord('s') shl 8) or Ord('t');
  HB_SCRIPT_BAMUM = (Ord('B') shl 24) or (Ord('a') shl 16) or (Ord('m') shl 8) or Ord('u');
  HB_SCRIPT_EGYPTIAN_HIEROGLYPHS = (Ord('E') shl 24) or (Ord('g') shl 16) or (Ord('y') shl 8) or Ord('p');
  HB_SCRIPT_IMPERIAL_ARAMAIC = (Ord('A') shl 24) or (Ord('r') shl 16) or (Ord('m') shl 8) or Ord('i');
  HB_SCRIPT_INSCRIPTIONAL_PAHLAVI = (Ord('P') shl 24) or (Ord('h') shl 16) or (Ord('l') shl 8) or Ord('i');
  HB_SCRIPT_INSCRIPTIONAL_PARTHIAN = (Ord('P') shl 24) or (Ord('r') shl 16) or (Ord('t') shl 8) or Ord('i');
  HB_SCRIPT_JAVANESE = (Ord('J') shl 24) or (Ord('a') shl 16) or (Ord('v') shl 8) or Ord('a');
  HB_SCRIPT_KAITHI = (Ord('K') shl 24) or (Ord('t') shl 16) or (Ord('h') shl 8) or Ord('i');
  HB_SCRIPT_LISU = (Ord('L') shl 24) or (Ord('i') shl 16) or (Ord('s') shl 8) or Ord('u');
  HB_SCRIPT_MEETEI_MAYEK = (Ord('M') shl 24) or (Ord('t') shl 16) or (Ord('e') shl 8) or Ord('i');
  HB_SCRIPT_OLD_SOUTH_ARABIAN = (Ord('S') shl 24) or (Ord('a') shl 16) or (Ord('r') shl 8) or Ord('b');
  HB_SCRIPT_OLD_TURKIC = (Ord('O') shl 24) or (Ord('r') shl 16) or (Ord('k') shl 8) or Ord('h');
  HB_SCRIPT_SAMARITAN = (Ord('S') shl 24) or (Ord('a') shl 16) or (Ord('m') shl 8) or Ord('r');
  HB_SCRIPT_TAI_THAM = (Ord('L') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('a');
  HB_SCRIPT_TAI_VIET = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('v') shl 8) or Ord('t');
  HB_SCRIPT_BATAK = (Ord('B') shl 24) or (Ord('a') shl 16) or (Ord('t') shl 8) or Ord('k');
  HB_SCRIPT_BRAHMI = (Ord('B') shl 24) or (Ord('r') shl 16) or (Ord('a') shl 8) or Ord('h');
  HB_SCRIPT_MANDAIC = (Ord('M') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('d');
  HB_SCRIPT_CHAKMA = (Ord('C') shl 24) or (Ord('a') shl 16) or (Ord('k') shl 8) or Ord('m');
  HB_SCRIPT_MEROITIC_CURSIVE = (Ord('M') shl 24) or (Ord('e') shl 16) or (Ord('r') shl 8) or Ord('c');
  HB_SCRIPT_MEROITIC_HIEROGLYPHS = (Ord('M') shl 24) or (Ord('e') shl 16) or (Ord('r') shl 8) or Ord('o');
  HB_SCRIPT_MIAO = (Ord('P') shl 24) or (Ord('l') shl 16) or (Ord('r') shl 8) or Ord('d');
  HB_SCRIPT_SHARADA = (Ord('S') shl 24) or (Ord('h') shl 16) or (Ord('r') shl 8) or Ord('d');
  HB_SCRIPT_SORA_SOMPENG = (Ord('S') shl 24) or (Ord('o') shl 16) or (Ord('r') shl 8) or Ord('a');
  HB_SCRIPT_TAKRI = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('k') shl 8) or Ord('r');
  HB_SCRIPT_BASSA_VAH = (Ord('B') shl 24) or (Ord('a') shl 16) or (Ord('s') shl 8) or Ord('s');
  HB_SCRIPT_CAUCASIAN_ALBANIAN = (Ord('A') shl 24) or (Ord('g') shl 16) or (Ord('h') shl 8) or Ord('b');
  HB_SCRIPT_DUPLOYAN = (Ord('D') shl 24) or (Ord('u') shl 16) or (Ord('p') shl 8) or Ord('l');
  HB_SCRIPT_ELBASAN = (Ord('E') shl 24) or (Ord('l') shl 16) or (Ord('b') shl 8) or Ord('a');
  HB_SCRIPT_GRANTHA = (Ord('G') shl 24) or (Ord('r') shl 16) or (Ord('a') shl 8) or Ord('n');
  HB_SCRIPT_KHOJKI = (Ord('K') shl 24) or (Ord('h') shl 16) or (Ord('o') shl 8) or Ord('j');
  HB_SCRIPT_KHUDAWADI = (Ord('S') shl 24) or (Ord('i') shl 16) or (Ord('n') shl 8) or Ord('d');
  HB_SCRIPT_LINEAR_A = (Ord('L') shl 24) or (Ord('i') shl 16) or (Ord('n') shl 8) or Ord('a');
  HB_SCRIPT_MAHAJANI = (Ord('M') shl 24) or (Ord('a') shl 16) or (Ord('h') shl 8) or Ord('j');
  HB_SCRIPT_MANICHAEAN = (Ord('M') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('i');
  HB_SCRIPT_MENDE_KIKAKUI = (Ord('M') shl 24) or (Ord('e') shl 16) or (Ord('n') shl 8) or Ord('d');
  HB_SCRIPT_MODI = (Ord('M') shl 24) or (Ord('o') shl 16) or (Ord('d') shl 8) or Ord('i');
  HB_SCRIPT_MRO = (Ord('M') shl 24) or (Ord('r') shl 16) or (Ord('o') shl 8) or Ord('o');
  HB_SCRIPT_NABATAEAN = (Ord('N') shl 24) or (Ord('b') shl 16) or (Ord('a') shl 8) or Ord('t');
  HB_SCRIPT_OLD_NORTH_ARABIAN = (Ord('N') shl 24) or (Ord('a') shl 16) or (Ord('r') shl 8) or Ord('b');
  HB_SCRIPT_OLD_PERMIC = (Ord('P') shl 24) or (Ord('e') shl 16) or (Ord('r') shl 8) or Ord('m');
  HB_SCRIPT_PAHAWH_HMONG = (Ord('H') shl 24) or (Ord('m') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_PALMYRENE = (Ord('P') shl 24) or (Ord('a') shl 16) or (Ord('l') shl 8) or Ord('m');
  HB_SCRIPT_PAU_CIN_HAU = (Ord('P') shl 24) or (Ord('a') shl 16) or (Ord('u') shl 8) or Ord('c');
  HB_SCRIPT_PSALTER_PAHLAVI = (Ord('P') shl 24) or (Ord('h') shl 16) or (Ord('l') shl 8) or Ord('p');
  HB_SCRIPT_SIDDHAM = (Ord('S') shl 24) or (Ord('i') shl 16) or (Ord('d') shl 8) or Ord('d');
  HB_SCRIPT_TIRHUTA = (Ord('T') shl 24) or (Ord('i') shl 16) or (Ord('r') shl 8) or Ord('h');
  HB_SCRIPT_WARANG_CITI = (Ord('W') shl 24) or (Ord('a') shl 16) or (Ord('r') shl 8) or Ord('a');
  HB_SCRIPT_AHOM = (Ord('A') shl 24) or (Ord('h') shl 16) or (Ord('o') shl 8) or Ord('m');
  HB_SCRIPT_ANATOLIAN_HIEROGLYPHS = (Ord('H') shl 24) or (Ord('l') shl 16) or (Ord('u') shl 8) or Ord('w');
  HB_SCRIPT_HATRAN = (Ord('H') shl 24) or (Ord('a') shl 16) or (Ord('t') shl 8) or Ord('r');
  HB_SCRIPT_MULTANI = (Ord('M') shl 24) or (Ord('u') shl 16) or (Ord('l') shl 8) or Ord('t');
  HB_SCRIPT_OLD_HUNGARIAN = (Ord('H') shl 24) or (Ord('u') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_SIGNWRITING = (Ord('S') shl 24) or (Ord('g') shl 16) or (Ord('n') shl 8) or Ord('w');
  HB_SCRIPT_ADLAM = (Ord('A') shl 24) or (Ord('d') shl 16) or (Ord('l') shl 8) or Ord('m');
  HB_SCRIPT_BHAIKSUKI = (Ord('B') shl 24) or (Ord('h') shl 16) or (Ord('k') shl 8) or Ord('s');
  HB_SCRIPT_MARCHEN = (Ord('M') shl 24) or (Ord('a') shl 16) or (Ord('r') shl 8) or Ord('c');
  HB_SCRIPT_OSAGE = (Ord('O') shl 24) or (Ord('s') shl 16) or (Ord('g') shl 8) or Ord('e');
  HB_SCRIPT_TANGUT = (Ord('T') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_NEWA = (Ord('N') shl 24) or (Ord('e') shl 16) or (Ord('w') shl 8) or Ord('a');
  HB_SCRIPT_MASARAM_GONDI = (Ord('G') shl 24) or (Ord('o') shl 16) or (Ord('n') shl 8) or Ord('m');
  HB_SCRIPT_NUSHU = (Ord('N') shl 24) or (Ord('s') shl 16) or (Ord('h') shl 8) or Ord('u');
  HB_SCRIPT_SOYOMBO = (Ord('S') shl 24) or (Ord('o') shl 16) or (Ord('y') shl 8) or Ord('o');
  HB_SCRIPT_ZANABAZAR_SQUARE = (Ord('Z') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('b');
  HB_SCRIPT_DOGRA = (Ord('D') shl 24) or (Ord('o') shl 16) or (Ord('g') shl 8) or Ord('r');
  HB_SCRIPT_GUNJALA_GONDI = (Ord('G') shl 24) or (Ord('o') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_SCRIPT_HANIFI_ROHINGYA = (Ord('R') shl 24) or (Ord('o') shl 16) or (Ord('h') shl 8) or Ord('g');
  HB_SCRIPT_MAKASAR = (Ord('M') shl 24) or (Ord('a') shl 16) or (Ord('k') shl 8) or Ord('a');
  HB_SCRIPT_MEDEFAIDRIN = (Ord('M') shl 24) or (Ord('e') shl 16) or (Ord('d') shl 8) or Ord('f');
  HB_SCRIPT_OLD_SOGDIAN = (Ord('S') shl 24) or (Ord('o') shl 16) or (Ord('g') shl 8) or Ord('o');
  HB_SCRIPT_SOGDIAN = (Ord('S') shl 24) or (Ord('o') shl 16) or (Ord('g') shl 8) or Ord('d');
  HB_SCRIPT_ELYMAIC = (Ord('E') shl 24) or (Ord('l') shl 16) or (Ord('y') shl 8) or Ord('m');
  HB_SCRIPT_NANDINAGARI = (Ord('N') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('d');
  HB_SCRIPT_NYIAKENG_PUACHUE_HMONG = (Ord('H') shl 24) or (Ord('m') shl 16) or (Ord('n') shl 8) or Ord('p');
  HB_SCRIPT_WANCHO = (Ord('W') shl 24) or (Ord('c') shl 16) or (Ord('h') shl 8) or Ord('o');
  HB_SCRIPT_CHORASMIAN = (Ord('C') shl 24) or (Ord('h') shl 16) or (Ord('r') shl 8) or Ord('s');
  HB_SCRIPT_DIVES_AKURU = (Ord('D') shl 24) or (Ord('i') shl 16) or (Ord('a') shl 8) or Ord('k');
  HB_SCRIPT_KHITAN_SMALL_SCRIPT = (Ord('K') shl 24) or (Ord('i') shl 16) or (Ord('t') shl 8) or Ord('s');
  HB_SCRIPT_YEZIDI = (Ord('Y') shl 24) or (Ord('e') shl 16) or (Ord('z') shl 8) or Ord('i');
  HB_SCRIPT_CYPRO_MINOAN = (Ord('C') shl 24) or (Ord('p') shl 16) or (Ord('m') shl 8) or Ord('n');
  HB_SCRIPT_OLD_UYGHUR = (Ord('O') shl 24) or (Ord('u') shl 16) or (Ord('g') shl 8) or Ord('r');
  HB_SCRIPT_TANGSA = (Ord('T') shl 24) or (Ord('n') shl 16) or (Ord('s') shl 8) or Ord('a');
  HB_SCRIPT_TOTO = (Ord('T') shl 24) or (Ord('o') shl 16) or (Ord('t') shl 8) or Ord('o');
  HB_SCRIPT_VITHKUQI = (Ord('V') shl 24) or (Ord('i') shl 16) or (Ord('t') shl 8) or Ord('h');
  HB_SCRIPT_MATH = (Ord('Z') shl 24) or (Ord('m') shl 16) or (Ord('t') shl 8) or Ord('h');
  HB_SCRIPT_KAWI = (Ord('K') shl 24) or (Ord('a') shl 16) or (Ord('w') shl 8) or Ord('i');
  HB_SCRIPT_NAG_MUNDARI = (Ord('N') shl 24) or (Ord('a') shl 16) or (Ord('g') shl 8) or Ord('m');

  HB_SCRIPT_INVALID = HB_TAG_NONE;
  _HB_SCRIPT_MAX_VALUE = HB_TAG_MAX_SIGNED;
  _HB_SCRIPT_MAX_VALUE_SIGNED = HB_TAG_MAX_SIGNED;

function hb_script_from_iso15924_tag(tag: Thb_tag_t): Thb_script_t; cdecl; external libharfbuzz;
function hb_script_from_string(str: pchar; len: longint): Thb_script_t; cdecl; external libharfbuzz;
function hb_script_to_iso15924_tag(script: Thb_script_t): Thb_tag_t; cdecl; external libharfbuzz;
function hb_script_get_horizontal_direction(script: Thb_script_t): Thb_direction_t; cdecl; external libharfbuzz;

type
  Thb_user_data_key_t = record
    unused: char;
  end;
  Phb_user_data_key_t = ^Thb_user_data_key_t;

  Thb_destroy_func_t = procedure(user_data: pointer); cdecl;

const
  HB_FEATURE_GLOBAL_START = 0;

type
  Phb_feature_t = ^Thb_feature_t;

  Thb_feature_t = record
    tag: Thb_tag_t;
    Value: Tuint32_t;
    start: dword;
    end_: dword;
  end;

function hb_feature_from_string(str: pchar; len: longint; feature: Phb_feature_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_feature_to_string(feature: Phb_feature_t; buf: pchar; size: dword); cdecl; external libharfbuzz;

type
  Thb_variation_t = record
    tag: Thb_tag_t;
    Value: single;
  end;
  Phb_variation_t = ^Thb_variation_t;

function hb_variation_from_string(str: pchar; len: longint; variation: Phb_variation_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_variation_to_string(variation: Phb_variation_t; buf: pchar; size: dword); cdecl; external libharfbuzz;

type
  Phb_color_t = ^Thb_color_t;
  Thb_color_t = Tuint32_t;

function hb_color_get_alpha(color: Thb_color_t): Tuint8_t; cdecl; external libharfbuzz;
function hb_color_get_red(color: Thb_color_t): Tuint8_t; cdecl; external libharfbuzz;
function hb_color_get_green(color: Thb_color_t): Tuint8_t; cdecl; external libharfbuzz;
function hb_color_get_blue(color: Thb_color_t): Tuint8_t; cdecl; external libharfbuzz;

type
  Thb_glyph_extents_t = record
    x_bearing: Thb_position_t;
    y_bearing: Thb_position_t;
    Width: Thb_position_t;
    Height: Thb_position_t;
  end;
  Phb_glyph_extents_t = ^Thb_glyph_extents_t;

function HB_DIRECTION_IS_VALID(dir: cuint): boolean;
function HB_DIRECTION_IS_HORIZONTAL(dir: cuint): boolean;
function HB_DIRECTION_IS_VERTICAL(dir: cuint): boolean;
function HB_DIRECTION_IS_FORWARD(dir: cuint): boolean;
function HB_DIRECTION_IS_BACKWARD(dir: cuint): boolean;

function HB_DIRECTION_REVERSE(direction: cuint): Thb_direction_t;
function HB_COLOR(b, g, r, a: byte): Thb_color_t;

const
  HB_CODEPOINT_INVALID = Thb_codepoint_t(-1);
  HB_LANGUAGE_INVALID = Thb_language_t(0);
  HB_FEATURE_GLOBAL_END = cuint(-1);

  // === Konventiert am: 25-12-24 16:53:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function HB_DIRECTION_IS_VALID(dir: cuint): boolean;
begin
  HB_DIRECTION_IS_VALID := ((dword(dir)) and (not (3))) = 4;
end;

function HB_DIRECTION_IS_HORIZONTAL(dir: cuint): boolean;
begin
  HB_DIRECTION_IS_HORIZONTAL := ((dword(dir)) and (not (1))) = 4;
end;

function HB_DIRECTION_IS_VERTICAL(dir: cuint): boolean;
begin
  HB_DIRECTION_IS_VERTICAL := ((dword(dir)) and (not (1))) = 6;
end;

function HB_DIRECTION_IS_FORWARD(dir: cuint): boolean;
begin
  HB_DIRECTION_IS_FORWARD := ((dword(dir)) and (not (2))) = 4;
end;

function HB_DIRECTION_IS_BACKWARD(dir: cuint): boolean;
begin
  HB_DIRECTION_IS_BACKWARD := ((dword(dir)) and (not (2))) = 5;
end;

function HB_DIRECTION_REVERSE(direction: cuint): Thb_direction_t;
begin
  HB_DIRECTION_REVERSE := Thb_direction_t(cuint(direction) xor 1);
end;

function HB_COLOR(b, g, r, a: byte): Thb_color_t;
begin
  HB_COLOR := Thb_color_t((b shl 24) or (g shl 16) or (r shl 8) or a);
end;


{$ENDIF read_implementation}
