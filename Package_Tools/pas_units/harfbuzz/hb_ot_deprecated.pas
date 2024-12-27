unit hb_ot_deprecated;

interface

uses
  fp_glib2, hb_common, hb_ot_math, hb_ot_name;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HB_MATH_GLYPH_PART_FLAG_EXTENDER = HB_OT_MATH_GLYPH_PART_FLAG_EXTENDER;
  HB_OT_MATH_SCRIPT = HB_OT_TAG_MATH_SCRIPT;

function hb_ot_layout_table_choose_script(face: Phb_face_t; table_tag: Thb_tag_t; script_tags: Phb_tag_t; script_index: Pdword; chosen_script: Phb_tag_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_layout_script_find_language(face: Phb_face_t; table_tag: Thb_tag_t; script_index: dword; language_tag: Thb_tag_t; language_index: Pdword): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_ot_tags_from_script(script: Thb_script_t; script_tag_1: Phb_tag_t; script_tag_2: Phb_tag_t); cdecl; external libharfbuzz;
function hb_ot_tag_from_language(language: Thb_language_t): Thb_tag_t; cdecl; external libharfbuzz;

const
  HB_OT_VAR_NO_AXIS_INDEX = $FFFFFFFF;

type
  Thb_ot_var_axis_t = record
    tag: Thb_tag_t;
    name_id: Thb_ot_name_id_t;
    min_value: single;
    default_value: single;
    max_value: single;
  end;
  Phb_ot_var_axis_t = ^Thb_ot_var_axis_t;

function hb_ot_var_get_axes(face: Phb_face_t; start_offset: dword; axes_count: Pdword; axes_array: Phb_ot_var_axis_t): dword; cdecl; external libharfbuzz;
function hb_ot_var_find_axis(face: Phb_face_t; axis_tag: Thb_tag_t; axis_index: Pdword; axis_info: Phb_ot_var_axis_t): Thb_bool_t; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:07:15 ===


implementation



end.
