unit hb_ot_math;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HB_OT_TAG_MATH = (Ord('M') shl 24) or (Ord('A') shl 16) or (Ord('T') shl 8) or Ord('H');
  HB_OT_TAG_MATH_SCRIPT = (Ord('m') shl 24) or (Ord('a') shl 16) or (Ord('t') shl 8) or Ord('h');

type
  Phb_ot_math_constant_t = ^Thb_ot_math_constant_t;
  Thb_ot_math_constant_t = longint;

const
  HB_OT_MATH_CONSTANT_SCRIPT_PERCENT_SCALE_DOWN = 0;
  HB_OT_MATH_CONSTANT_SCRIPT_SCRIPT_PERCENT_SCALE_DOWN = 1;
  HB_OT_MATH_CONSTANT_DELIMITED_SUB_FORMULA_MIN_HEIGHT = 2;
  HB_OT_MATH_CONSTANT_DISPLAY_OPERATOR_MIN_HEIGHT = 3;
  HB_OT_MATH_CONSTANT_MATH_LEADING = 4;
  HB_OT_MATH_CONSTANT_AXIS_HEIGHT = 5;
  HB_OT_MATH_CONSTANT_ACCENT_BASE_HEIGHT = 6;
  HB_OT_MATH_CONSTANT_FLATTENED_ACCENT_BASE_HEIGHT = 7;
  HB_OT_MATH_CONSTANT_SUBSCRIPT_SHIFT_DOWN = 8;
  HB_OT_MATH_CONSTANT_SUBSCRIPT_TOP_MAX = 9;
  HB_OT_MATH_CONSTANT_SUBSCRIPT_BASELINE_DROP_MIN = 10;
  HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP = 11;
  HB_OT_MATH_CONSTANT_SUPERSCRIPT_SHIFT_UP_CRAMPED = 12;
  HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MIN = 13;
  HB_OT_MATH_CONSTANT_SUPERSCRIPT_BASELINE_DROP_MAX = 14;
  HB_OT_MATH_CONSTANT_SUB_SUPERSCRIPT_GAP_MIN = 15;
  HB_OT_MATH_CONSTANT_SUPERSCRIPT_BOTTOM_MAX_WITH_SUBSCRIPT = 16;
  HB_OT_MATH_CONSTANT_SPACE_AFTER_SCRIPT = 17;
  HB_OT_MATH_CONSTANT_UPPER_LIMIT_GAP_MIN = 18;
  HB_OT_MATH_CONSTANT_UPPER_LIMIT_BASELINE_RISE_MIN = 19;
  HB_OT_MATH_CONSTANT_LOWER_LIMIT_GAP_MIN = 20;
  HB_OT_MATH_CONSTANT_LOWER_LIMIT_BASELINE_DROP_MIN = 21;
  HB_OT_MATH_CONSTANT_STACK_TOP_SHIFT_UP = 22;
  HB_OT_MATH_CONSTANT_STACK_TOP_DISPLAY_STYLE_SHIFT_UP = 23;
  HB_OT_MATH_CONSTANT_STACK_BOTTOM_SHIFT_DOWN = 24;
  HB_OT_MATH_CONSTANT_STACK_BOTTOM_DISPLAY_STYLE_SHIFT_DOWN = 25;
  HB_OT_MATH_CONSTANT_STACK_GAP_MIN = 26;
  HB_OT_MATH_CONSTANT_STACK_DISPLAY_STYLE_GAP_MIN = 27;
  HB_OT_MATH_CONSTANT_STRETCH_STACK_TOP_SHIFT_UP = 28;
  HB_OT_MATH_CONSTANT_STRETCH_STACK_BOTTOM_SHIFT_DOWN = 29;
  HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_ABOVE_MIN = 30;
  HB_OT_MATH_CONSTANT_STRETCH_STACK_GAP_BELOW_MIN = 31;
  HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_SHIFT_UP = 32;
  HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_DISPLAY_STYLE_SHIFT_UP = 33;
  HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_SHIFT_DOWN = 34;
  HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_DISPLAY_STYLE_SHIFT_DOWN = 35;
  HB_OT_MATH_CONSTANT_FRACTION_NUMERATOR_GAP_MIN = 36;
  HB_OT_MATH_CONSTANT_FRACTION_NUM_DISPLAY_STYLE_GAP_MIN = 37;
  HB_OT_MATH_CONSTANT_FRACTION_RULE_THICKNESS = 38;
  HB_OT_MATH_CONSTANT_FRACTION_DENOMINATOR_GAP_MIN = 39;
  HB_OT_MATH_CONSTANT_FRACTION_DENOM_DISPLAY_STYLE_GAP_MIN = 40;
  HB_OT_MATH_CONSTANT_SKEWED_FRACTION_HORIZONTAL_GAP = 41;
  HB_OT_MATH_CONSTANT_SKEWED_FRACTION_VERTICAL_GAP = 42;
  HB_OT_MATH_CONSTANT_OVERBAR_VERTICAL_GAP = 43;
  HB_OT_MATH_CONSTANT_OVERBAR_RULE_THICKNESS = 44;
  HB_OT_MATH_CONSTANT_OVERBAR_EXTRA_ASCENDER = 45;
  HB_OT_MATH_CONSTANT_UNDERBAR_VERTICAL_GAP = 46;
  HB_OT_MATH_CONSTANT_UNDERBAR_RULE_THICKNESS = 47;
  HB_OT_MATH_CONSTANT_UNDERBAR_EXTRA_DESCENDER = 48;
  HB_OT_MATH_CONSTANT_RADICAL_VERTICAL_GAP = 49;
  HB_OT_MATH_CONSTANT_RADICAL_DISPLAY_STYLE_VERTICAL_GAP = 50;
  HB_OT_MATH_CONSTANT_RADICAL_RULE_THICKNESS = 51;
  HB_OT_MATH_CONSTANT_RADICAL_EXTRA_ASCENDER = 52;
  HB_OT_MATH_CONSTANT_RADICAL_KERN_BEFORE_DEGREE = 53;
  HB_OT_MATH_CONSTANT_RADICAL_KERN_AFTER_DEGREE = 54;
  HB_OT_MATH_CONSTANT_RADICAL_DEGREE_BOTTOM_RAISE_PERCENT = 55;

type
  Phb_ot_math_kern_t = ^Thb_ot_math_kern_t;
  Thb_ot_math_kern_t = longint;

const
  HB_OT_MATH_KERN_TOP_RIGHT = 0;
  HB_OT_MATH_KERN_TOP_LEFT = 1;
  HB_OT_MATH_KERN_BOTTOM_RIGHT = 2;
  HB_OT_MATH_KERN_BOTTOM_LEFT = 3;

type
  Thb_ot_math_kern_entry_t = record
    max_correction_height: Thb_position_t;
    kern_value: Thb_position_t;
  end;
  Phb_ot_math_kern_entry_t = ^Thb_ot_math_kern_entry_t;

  Thb_ot_math_glyph_variant_t = record
    glyph: Thb_codepoint_t;
    advance: Thb_position_t;
  end;
  Phb_ot_math_glyph_variant_t = ^Thb_ot_math_glyph_variant_t;

  Phb_ot_math_glyph_part_flags_t = ^Thb_ot_math_glyph_part_flags_t;
  Thb_ot_math_glyph_part_flags_t = longint;

const
  HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER = $00000001;

type
  Thb_ot_math_glyph_part_t = record
    glyph: Thb_codepoint_t;
    start_connector_length: Thb_position_t;
    end_connector_length: Thb_position_t;
    full_advance: Thb_position_t;
    flags: Thb_ot_math_glyph_part_flags_t;
  end;
  Phb_ot_math_glyph_part_t = ^Thb_ot_math_glyph_part_t;

function hb_ot_math_has_data(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_math_get_constant(font: Phb_font_t; constant: Thb_ot_math_constant_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_italics_correction(font: Phb_font_t; glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_top_accent_attachment(font: Phb_font_t; glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_math_is_glyph_extended_shape(face: Phb_face_t; glyph: Thb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_kerning(font: Phb_font_t; glyph: Thb_codepoint_t; kern: Thb_ot_math_kern_t; correction_height: Thb_position_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_kernings(font: Phb_font_t; glyph: Thb_codepoint_t; kern: Thb_ot_math_kern_t; start_offset: dword; entries_count: Pdword;
  kern_entries: Phb_ot_math_kern_entry_t): dword; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_variants(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; start_offset: dword; variants_count: Pdword;
  variants: Phb_ot_math_glyph_variant_t): dword; cdecl; external libharfbuzz;
function hb_ot_math_get_min_connector_overlap(font: Phb_font_t; direction: Thb_direction_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_math_get_glyph_assembly(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; start_offset: dword; parts_count: Pdword;
  parts: Phb_ot_math_glyph_part_t; italics_correction: Phb_position_t): dword; cdecl; external libharfbuzz;

// === Konventiert am: 26-12-24 17:14:41 ===


implementation



end.
