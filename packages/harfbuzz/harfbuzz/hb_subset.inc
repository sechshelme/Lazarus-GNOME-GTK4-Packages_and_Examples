{$IFDEF read_interface}

type
  Phb_subset_flags_t = ^Thb_subset_flags_t;
  Thb_subset_flags_t = longint;

const
  HB_SUBSET_FLAGS_DEFAULT = $00000000;
  HB_SUBSET_FLAGS_NO_HINTING = $00000001;
  HB_SUBSET_FLAGS_RETAIN_GIDS = $00000002;
  HB_SUBSET_FLAGS_DESUBROUTINIZE = $00000004;
  HB_SUBSET_FLAGS_NAME_LEGACY = $00000008;
  HB_SUBSET_FLAGS_SET_OVERLAPS_FLAG = $00000010;
  HB_SUBSET_FLAGS_PASSTHROUGH_UNRECOGNIZED = $00000020;
  HB_SUBSET_FLAGS_NOTDEF_OUTLINE = $00000040;
  HB_SUBSET_FLAGS_GLYPH_NAMES = $00000080;
  HB_SUBSET_FLAGS_NO_PRUNE_UNICODE_RANGES = $00000100;
  HB_SUBSET_FLAGS_NO_LAYOUT_CLOSURE = $00000200;
  HB_SUBSET_FLAGS_IFTB_REQUIREMENTS = $00000400;

type
  Phb_subset_sets_t = ^Thb_subset_sets_t;
  Thb_subset_sets_t = longint;

const
  HB_SUBSET_SETS_GLYPH_INDEX = 0;
  HB_SUBSET_SETS_UNICODE = 1;
  HB_SUBSET_SETS_NO_SUBSET_TABLE_TAG = 2;
  HB_SUBSET_SETS_DROP_TABLE_TAG = 3;
  HB_SUBSET_SETS_NAME_ID = 4;
  HB_SUBSET_SETS_NAME_LANG_ID = 5;
  HB_SUBSET_SETS_LAYOUT_FEATURE_TAG = 6;
  HB_SUBSET_SETS_LAYOUT_SCRIPT_TAG = 7;

type
  Thb_subset_input_t = record
  end;
  Phb_subset_input_t = ^Thb_subset_input_t;

  Thb_subset_plan_t = record
  end;
  Phb_subset_plan_t = ^Thb_subset_plan_t;

function hb_subset_input_create_or_fail: Phb_subset_input_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_reference(input: Phb_subset_input_t): Phb_subset_input_t; cdecl; external libharfbuzzsubset;
procedure hb_subset_input_destroy(input: Phb_subset_input_t); cdecl; external libharfbuzzsubset;
function hb_subset_input_set_user_data(input: Phb_subset_input_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_get_user_data(input: Phb_subset_input_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzzsubset;
procedure hb_subset_input_keep_everything(input: Phb_subset_input_t); cdecl; external libharfbuzzsubset;
function hb_subset_input_unicode_set(input: Phb_subset_input_t): Phb_set_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_glyph_set(input: Phb_subset_input_t): Phb_set_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_set(input: Phb_subset_input_t; set_type: Thb_subset_sets_t): Phb_set_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_old_to_new_glyph_mapping(input: Phb_subset_input_t): Phb_map_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_get_flags(input: Phb_subset_input_t): Thb_subset_flags_t; cdecl; external libharfbuzzsubset;
procedure hb_subset_input_set_flags(input: Phb_subset_input_t; Value: dword); cdecl; external libharfbuzzsubset;
function hb_subset_input_pin_axis_to_default(input: Phb_subset_input_t; face: Phb_face_t; axis_tag: Thb_tag_t): Thb_bool_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_pin_axis_location(input: Phb_subset_input_t; face: Phb_face_t; axis_tag: Thb_tag_t; axis_value: single): Thb_bool_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_set_axis_range(input: Phb_subset_input_t; face: Phb_face_t; axis_tag: Thb_tag_t; axis_min_value: single; axis_max_value: single;
  axis_def_value: Psingle): Thb_bool_t; cdecl; external libharfbuzzsubset;
function hb_subset_input_override_name_table(input: Phb_subset_input_t; name_id: Thb_ot_name_id_t; platform_id: dword; encoding_id: dword; language_id: dword;
  name_str: pchar; str_len: longint): Thb_bool_t; cdecl; external libharfbuzzsubset;

function hb_subset_preprocess(Source: Phb_face_t): Phb_face_t; cdecl; external libharfbuzzsubset;
function hb_subset_or_fail(Source: Phb_face_t; input: Phb_subset_input_t): Phb_face_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_execute_or_fail(plan: Phb_subset_plan_t): Phb_face_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_create_or_fail(face: Phb_face_t; input: Phb_subset_input_t): Phb_subset_plan_t; cdecl; external libharfbuzzsubset;
procedure hb_subset_plan_destroy(plan: Phb_subset_plan_t); cdecl; external libharfbuzzsubset;
function hb_subset_plan_old_to_new_glyph_mapping(plan: Phb_subset_plan_t): Phb_map_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_new_to_old_glyph_mapping(plan: Phb_subset_plan_t): Phb_map_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_unicode_to_old_glyph_mapping(plan: Phb_subset_plan_t): Phb_map_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_reference(plan: Phb_subset_plan_t): Phb_subset_plan_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_set_user_data(plan: Phb_subset_plan_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzzsubset;
function hb_subset_plan_get_user_data(plan: Phb_subset_plan_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzzsubset;

// === Konventiert am: 26-12-24 17:22:20 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
