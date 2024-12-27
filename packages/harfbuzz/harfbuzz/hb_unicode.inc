{$IFDEF read_interface}


const
  HB_UNICODE_MAX = $10FFFF;

type
  Phb_unicode_general_category_t = ^Thb_unicode_general_category_t;
  Thb_unicode_general_category_t = longint;

const
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

type
  Phb_unicode_combining_class_t = ^Thb_unicode_combining_class_t;
  Thb_unicode_combining_class_t = longint;

const
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

type
  Thb_unicode_funcs_t = record
  end;
  Phb_unicode_funcs_t = ^Thb_unicode_funcs_t;

function hb_unicode_funcs_get_default: Phb_unicode_funcs_t; cdecl; external libharfbuzz;
function hb_unicode_funcs_create(parent: Phb_unicode_funcs_t): Phb_unicode_funcs_t; cdecl; external libharfbuzz;
function hb_unicode_funcs_get_empty: Phb_unicode_funcs_t; cdecl; external libharfbuzz;
function hb_unicode_funcs_reference(ufuncs: Phb_unicode_funcs_t): Phb_unicode_funcs_t; cdecl; external libharfbuzz;
procedure hb_unicode_funcs_destroy(ufuncs: Phb_unicode_funcs_t); cdecl; external libharfbuzz;
function hb_unicode_funcs_set_user_data(ufuncs: Phb_unicode_funcs_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_unicode_funcs_get_user_data(ufuncs: Phb_unicode_funcs_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_unicode_funcs_make_immutable(ufuncs: Phb_unicode_funcs_t); cdecl; external libharfbuzz;
function hb_unicode_funcs_is_immutable(ufuncs: Phb_unicode_funcs_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_unicode_funcs_get_parent(ufuncs: Phb_unicode_funcs_t): Phb_unicode_funcs_t; cdecl; external libharfbuzz;

type
  Thb_unicode_combining_class_func_t = function(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t; user_data: pointer): Thb_unicode_combining_class_t; cdecl;
  Thb_unicode_general_category_func_t = function(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t; user_data: pointer): Thb_unicode_general_category_t; cdecl;
  Thb_unicode_mirroring_func_t = function(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t; user_data: pointer): Thb_codepoint_t; cdecl;
  Thb_unicode_script_func_t = function(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t; user_data: pointer): Thb_script_t; cdecl;
  Thb_unicode_compose_func_t = function(ufuncs: Phb_unicode_funcs_t; a: Thb_codepoint_t; b: Thb_codepoint_t; ab: Phb_codepoint_t; user_data: pointer): Thb_bool_t; cdecl;
  Thb_unicode_decompose_func_t = function(ufuncs: Phb_unicode_funcs_t; ab: Thb_codepoint_t; a: Phb_codepoint_t; b: Phb_codepoint_t; user_data: pointer): Thb_bool_t; cdecl;

procedure hb_unicode_funcs_set_combining_class_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_combining_class_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_unicode_funcs_set_general_category_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_general_category_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_unicode_funcs_set_mirroring_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_mirroring_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_unicode_funcs_set_script_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_script_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_unicode_funcs_set_compose_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_compose_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_unicode_funcs_set_decompose_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_decompose_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_unicode_combining_class(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t): Thb_unicode_combining_class_t; cdecl; external libharfbuzz;
function hb_unicode_general_category(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t): Thb_unicode_general_category_t; cdecl; external libharfbuzz;
function hb_unicode_mirroring(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t): Thb_codepoint_t; cdecl; external libharfbuzz;
function hb_unicode_script(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t): Thb_script_t; cdecl; external libharfbuzz;
function hb_unicode_compose(ufuncs: Phb_unicode_funcs_t; a: Thb_codepoint_t; b: Thb_codepoint_t; ab: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_unicode_decompose(ufuncs: Phb_unicode_funcs_t; ab: Thb_codepoint_t; a: Phb_codepoint_t; b: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:13:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
