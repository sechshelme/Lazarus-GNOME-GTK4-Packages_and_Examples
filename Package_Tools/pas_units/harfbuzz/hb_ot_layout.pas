unit hb_ot_layout;

interface

uses
  fp_glib2, hb_common, hb_set, hb_map, hb_ot_name, hb_font;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HB_OT_TAG_BASE = (Ord('B') shl 24) or (Ord('A') shl 16) or (Ord('S') shl 8) or Ord('E');
  HB_OT_TAG_GDEF = (Ord('G') shl 24) or (Ord('D') shl 16) or (Ord('E') shl 8) or Ord('F');
  HB_OT_TAG_GSUB = (Ord('G') shl 24) or (Ord('S') shl 16) or (Ord('U') shl 8) or Ord('B');
  HB_OT_TAG_GPOS = (Ord('G') shl 24) or (Ord('P') shl 16) or (Ord('O') shl 8) or Ord('S');
  HB_OT_TAG_JSTF = (Ord('J') shl 24) or (Ord('S') shl 16) or (Ord('T') shl 8) or Ord('F');
  HB_OT_TAG_DEFAULT_SCRIPT = (Ord('D') shl 24) or (Ord('F') shl 16) or (Ord('L') shl 8) or Ord('T');
  HB_OT_TAG_DEFAULT_LANGUAGE = (Ord('d') shl 24) or (Ord('f') shl 16) or (Ord('l') shl 8) or Ord('t');

  HB_OT_MAX_TAGS_PER_SCRIPT = 3;
  HB_OT_MAX_TAGS_PER_LANGUAGE = 3;

procedure hb_ot_tags_from_script_and_language(script: Thb_script_t; language: Thb_language_t; script_count: Pdword; script_tags: Phb_tag_t; language_count: Pdword;
  language_tags: Phb_tag_t); cdecl; external libharfbuzz;
function hb_ot_tag_to_script(tag: Thb_tag_t): Thb_script_t; cdecl; external libharfbuzz;
function hb_ot_tag_to_language(tag: Thb_tag_t): Thb_language_t; cdecl; external libharfbuzz;
procedure hb_ot_tags_to_script_and_language(script_tag: Thb_tag_t; language_tag: Thb_tag_t; script: Phb_script_t; language: Phb_language_t); cdecl; external libharfbuzz;
function hb_ot_layout_has_glyph_classes(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Phb_ot_layout_glyph_class_t = ^Thb_ot_layout_glyph_class_t;
  Thb_ot_layout_glyph_class_t = longint;

const
  HB_OT_LAYOUT_GLYPH_CLASS_UNCLASSIFIED = 0;
  HB_OT_LAYOUT_GLYPH_CLASS_BASE_GLYPH = 1;
  HB_OT_LAYOUT_GLYPH_CLASS_LIGATURE = 2;
  HB_OT_LAYOUT_GLYPH_CLASS_MARK = 3;
  HB_OT_LAYOUT_GLYPH_CLASS_COMPONENT = 4;

function hb_ot_layout_get_glyph_class(face: Phb_face_t; glyph: Thb_codepoint_t): Thb_ot_layout_glyph_class_t; cdecl; external libharfbuzz;
procedure hb_ot_layout_get_glyphs_in_class(face: Phb_face_t; klass: Thb_ot_layout_glyph_class_t; glyphs: Phb_set_t); cdecl; external libharfbuzz;
function hb_ot_layout_get_attach_points(face: Phb_face_t; glyph: Thb_codepoint_t; start_offset: dword; point_count: Pdword; point_array: Pdword): dword; cdecl; external libharfbuzz;
function hb_ot_layout_get_ligature_carets(font: Phb_font_t; direction: Thb_direction_t; glyph: Thb_codepoint_t; start_offset: dword; caret_count: Pdword;
  caret_array: Phb_position_t): dword; cdecl; external libharfbuzz;

const
  HB_OT_LAYOUT_NO_SCRIPT_INDEX = $FFFF;
  HB_OT_LAYOUT_NO_FEATURE_INDEX = $FFFF;
  HB_OT_LAYOUT_DEFAULT_LANGUAGE_INDEX = $FFFF;
  HB_OT_LAYOUT_NO_VARIATIONS_INDEX = $FFFFFFFF;

function hb_ot_layout_table_get_script_tags(face: Phb_face_t; table_tag: Thb_tag_t; start_offset: dword; script_count: Pdword; script_tags: Phb_tag_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_table_find_script(face: Phb_face_t; table_tag: Thb_tag_t; script_tag: Thb_tag_t; script_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_table_select_script(face: Phb_face_t; table_tag: Thb_tag_t; script_count: dword; script_tags: Phb_tag_t; script_index: Pdword;
  chosen_script: Phb_tag_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_table_get_feature_tags(face: Phb_face_t; table_tag: Thb_tag_t; start_offset: dword; feature_count: Pdword; feature_tags: Phb_tag_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_script_get_language_tags(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; start_offset: dword; language_count: Pdword;
  language_tags: Phb_tag_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_script_select_language(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_count: dword; language_tags: Phb_tag_t;
  language_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_script_select_language2(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_count: dword; language_tags: Phb_tag_t;
  language_index: Pdword; chosen_language: Phb_tag_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_language_get_required_feature_index(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; feature_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_language_get_required_feature(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; feature_index: Pdword;
  feature_tag: Phb_tag_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_language_get_feature_indexes(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; start_offset: dword;
  feature_count: Pdword; feature_indexes: Pdword): dword; cdecl; external libharfbuzz;
function hb_ot_layout_language_get_feature_tags(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; start_offset: dword;
  feature_count: Pdword; feature_tags: Phb_tag_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_language_find_feature(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; feature_tag: Thb_tag_t;
  feature_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_feature_get_lookups(face: Phb_face_t; table_tag: Thb_tag_t; feature_index: dword; start_offset: dword; lookup_count: Pdword;
  lookup_indexes: Pdword): dword; cdecl; external libharfbuzz;
function hb_ot_layout_table_get_lookup_count(face: Phb_face_t; table_tag: Thb_tag_t): dword; cdecl; external libharfbuzz;
procedure hb_ot_layout_collect_features(face: Phb_face_t; table_tag: Thb_tag_t; scripts: Phb_tag_t; languages: Phb_tag_t; features: Phb_tag_t;
  feature_indexes: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_ot_layout_collect_features_map(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_index: dword; feature_map: Phb_map_t); cdecl; external libharfbuzz;
procedure hb_ot_layout_collect_lookups(face: Phb_face_t; table_tag: Thb_tag_t; scripts: Phb_tag_t; languages: Phb_tag_t; features: Phb_tag_t;
  lookup_indexes: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_ot_layout_lookup_collect_glyphs(face: Phb_face_t; table_tag: Thb_tag_t; lookup_index: dword; glyphs_before: Phb_set_t; glyphs_input: Phb_set_t;
  glyphs_after: Phb_set_t; glyphs_output: Phb_set_t); cdecl; external libharfbuzz;
function hb_ot_layout_table_find_feature_variations(face: Phb_face_t; table_tag: Thb_tag_t; coords: Plongint; num_coords: dword; variations_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_feature_with_variations_get_lookups(face: Phb_face_t; table_tag: Thb_tag_t; feature_index: dword; variations_index: dword; start_offset: dword;
  lookup_count: Pdword; lookup_indexes: Pdword): dword; cdecl; external libharfbuzz;
function hb_ot_layout_has_substitution(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_lookup_get_glyph_alternates(face: Phb_face_t; lookup_index: dword; glyph: Thb_codepoint_t; start_offset: dword; alternate_count: Pdword;
  alternate_glyphs: Phb_codepoint_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_lookup_would_substitute(face: Phb_face_t; lookup_index: dword; glyphs: Phb_codepoint_t; glyphs_length: dword; zero_context: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_ot_layout_lookup_substitute_closure(face: Phb_face_t; lookup_index: dword; glyphs: Phb_set_t); cdecl; external libharfbuzz;
procedure hb_ot_layout_lookups_substitute_closure(face: Phb_face_t; lookups: Phb_set_t; glyphs: Phb_set_t); cdecl; external libharfbuzz;
function hb_ot_layout_has_positioning(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_get_size_params(face: Phb_face_t; design_size: Pdword; subfamily_id: Pdword; subfamily_name_id: Phb_ot_name_id_t; range_start: Pdword;
  range_end: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_lookup_get_optical_bound(font: Phb_font_t; lookup_index: dword; direction: Thb_direction_t; glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_ot_layout_feature_get_name_ids(face: Phb_face_t; table_tag: Thb_tag_t; feature_index: dword; label_id: Phb_ot_name_id_t; tooltip_id: Phb_ot_name_id_t;
  sample_id: Phb_ot_name_id_t; num_named_parameters: Pdword; first_param_id: Phb_ot_name_id_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_feature_get_characters(face: Phb_face_t; table_tag: Thb_tag_t; feature_index: dword; start_offset: dword; char_count: Pdword;
  characters: Phb_codepoint_t): dword; cdecl; external libharfbuzz;
function hb_ot_layout_get_font_extents(font: Phb_font_t; direction: Thb_direction_t; script_tag: Thb_tag_t; language_tag: Thb_tag_t; extents: Phb_font_extents_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_get_font_extents2(font: Phb_font_t; direction: Thb_direction_t; script: Thb_script_t; language: Thb_language_t; extents: Phb_font_extents_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Phb_ot_layout_baseline_tag_t = ^Thb_ot_layout_baseline_tag_t;
  Thb_ot_layout_baseline_tag_t = longint;

const
  HB_OT_LAYOUT_BASELINE_TAG_ROMAN = (Ord('r') shl 24) or (Ord('o') shl 16) or (Ord('m') shl 8) or Ord('n');
  HB_OT_LAYOUT_BASELINE_TAG_HANGING = (Ord('h') shl 24) or (Ord('a') shl 16) or (Ord('n') shl 8) or Ord('g');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_BOTTOM_OR_LEFT = (Ord('i') shl 24) or (Ord('c') shl 16) or (Ord('f') shl 8) or Ord('b');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_TOP_OR_RIGHT = (Ord('i') shl 24) or (Ord('c') shl 16) or (Ord('f') shl 8) or Ord('t');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_FACE_CENTRAL = (Ord('I') shl 24) or (Ord('c') shl 16) or (Ord('f') shl 8) or Ord('c');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_BOTTOM_OR_LEFT = (Ord('i') shl 24) or (Ord('d') shl 16) or (Ord('e') shl 8) or Ord('o');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_TOP_OR_RIGHT = (Ord('i') shl 24) or (Ord('d') shl 16) or (Ord('t') shl 8) or Ord('p');
  HB_OT_LAYOUT_BASELINE_TAG_IDEO_EMBOX_CENTRAL = (Ord('I') shl 24) or (Ord('d') shl 16) or (Ord('c') shl 8) or Ord('e');
  HB_OT_LAYOUT_BASELINE_TAG_MATH = (Ord('m') shl 24) or (Ord('a') shl 16) or (Ord('t') shl 8) or Ord('h');
  _HB_OT_LAYOUT_BASELINE_TAG_MAX_VALUE = HB_TAG_MAX_SIGNED;



function hb_ot_layout_get_horizontal_baseline_tag_for_script(script: Thb_script_t): Thb_ot_layout_baseline_tag_t; cdecl; external libharfbuzz;
function hb_ot_layout_get_baseline(font: Phb_font_t; baseline_tag: Thb_ot_layout_baseline_tag_t; direction: Thb_direction_t; script_tag: Thb_tag_t; language_tag: Thb_tag_t;
  coord: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_get_baseline2(font: Phb_font_t; baseline_tag: Thb_ot_layout_baseline_tag_t; direction: Thb_direction_t; script: Thb_script_t; language: Thb_language_t;
  coord: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_ot_layout_get_baseline_with_fallback(font: Phb_font_t; baseline_tag: Thb_ot_layout_baseline_tag_t; direction: Thb_direction_t; script_tag: Thb_tag_t; language_tag: Thb_tag_t;
  coord: Phb_position_t); cdecl; external libharfbuzz;
procedure hb_ot_layout_get_baseline_with_fallback2(font: Phb_font_t; baseline_tag: Thb_ot_layout_baseline_tag_t; direction: Thb_direction_t; script: Thb_script_t; language: Thb_language_t;
  coord: Phb_position_t); cdecl; external libharfbuzz;

// === Konventiert am: 26-12-24 16:49:05 ===


implementation



end.
