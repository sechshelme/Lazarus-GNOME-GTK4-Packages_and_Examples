{$IFDEF read_interface}

const
  HB_SCRIPT_CANADIAN_ABORIGINAL = HB_SCRIPT_CANADIAN_SYLLABICS;
  HB_BUFFER_FLAGS_DEFAULT = HB_BUFFER_FLAG_DEFAULT;
  HB_BUFFER_SERIALIZE_FLAGS_DEFAULT = HB_BUFFER_SERIALIZE_FLAG_DEFAULT;

type
  Thb_font_get_glyph_func_t = function(font: Phb_font_t; font_data: pointer; unicode: Thb_codepoint_t; variation_selector: Thb_codepoint_t; glyph: Phb_codepoint_t;
    user_data: pointer): Thb_bool_t; cdecl;

procedure hb_font_funcs_set_glyph_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;

const
  HB_UNICODE_COMBINING_CLASS_CCC133 = 133;

type
  Thb_unicode_eastasian_width_func_t = function(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t; user_data: pointer): dword; cdecl;

procedure hb_unicode_funcs_set_eastasian_width_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_eastasian_width_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_unicode_eastasian_width(ufuncs: Phb_unicode_funcs_t; unicode: Thb_codepoint_t): dword; cdecl; external libharfbuzz;

type
  Thb_unicode_decompose_compatibility_func_t = function(ufuncs: Phb_unicode_funcs_t; u: Thb_codepoint_t; decomposed: Phb_codepoint_t; user_data: pointer): dword; cdecl;

const
  HB_UNICODE_MAX_DECOMPOSITION_LEN = 18 + 1;

procedure hb_unicode_funcs_set_decompose_compatibility_func(ufuncs: Phb_unicode_funcs_t; func: Thb_unicode_decompose_compatibility_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_unicode_decompose_compatibility(ufuncs: Phb_unicode_funcs_t; u: Thb_codepoint_t; decomposed: Phb_codepoint_t): dword; cdecl; external libharfbuzz;

type
  Phb_font_get_glyph_v_kerning_func_t = ^Thb_font_get_glyph_v_kerning_func_t;
  Thb_font_get_glyph_v_kerning_func_t = Thb_font_get_glyph_kerning_func_t;

procedure hb_font_funcs_set_glyph_v_kerning_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_v_kerning_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_font_get_glyph_v_kerning(font: Phb_font_t; top_glyph: Thb_codepoint_t; bottom_glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;

type
  Thb_font_get_glyph_shape_func_t = procedure(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; draw_funcs: Phb_draw_funcs_t; draw_data: pointer;
    user_data: pointer); cdecl;

procedure hb_font_funcs_set_glyph_shape_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_shape_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_shape(font: Phb_font_t; glyph: Thb_codepoint_t; dfuncs: Phb_draw_funcs_t; draw_data: pointer); cdecl; external libharfbuzz;

const
  HB_AAT_LAYOUT_FEATURE_TYPE_CURISVE_CONNECTION = HB_AAT_LAYOUT_FEATURE_TYPE_CURSIVE_CONNECTION;

  // === Konventiert am: 26-12-24 17:14:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
