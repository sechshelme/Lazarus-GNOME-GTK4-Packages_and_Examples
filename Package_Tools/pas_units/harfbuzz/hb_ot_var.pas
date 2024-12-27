unit hb_ot_var;

interface

uses
  fp_glib2, hb_common, hb_ot_name;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  HB_OT_TAG_VAR_AXIS_ITALIC = (Ord('i') shl 24) or (Ord('t') shl 16) or (Ord('a') shl 8) or Ord('l');
  HB_OT_TAG_VAR_AXIS_OPTICAL_SIZE = (Ord('o') shl 24) or (Ord('p') shl 16) or (Ord('s') shl 8) or Ord('z');
  HB_OT_TAG_VAR_AXIS_SLANT = (Ord('s') shl 24) or (Ord('l') shl 16) or (Ord('n') shl 8) or Ord('t');
  HB_OT_TAG_VAR_AXIS_WIDTH = (Ord('w') shl 24) or (Ord('d') shl 16) or (Ord('t') shl 8) or Ord('h');
  HB_OT_TAG_VAR_AXIS_WEIGHT = (Ord('w') shl 24) or (Ord('g') shl 16) or (Ord('h') shl 8) or Ord('t');

function hb_ot_var_has_data(face: Phb_face_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_var_get_axis_count(face: Phb_face_t): dword; cdecl; external libharfbuzz;

type
  Phb_ot_var_axis_flags_t = ^Thb_ot_var_axis_flags_t;
  Thb_ot_var_axis_flags_t = longint;

const
  HB_OT_VAR_AXIS_FLAG_HIDDEN = $00000001;
  _HB_OT_VAR_AXIS_FLAG_MAX_VALUE = HB_TAG_MAX_SIGNED;

type
  Thb_ot_var_axis_info_t = record
    axis_index: dword;
    tag: Thb_tag_t;
    name_id: Thb_ot_name_id_t;
    flags: Thb_ot_var_axis_flags_t;
    min_value: single;
    default_value: single;
    max_value: single;
    reserved: dword;
  end;
  Phb_ot_var_axis_info_t = ^Thb_ot_var_axis_info_t;

function hb_ot_var_get_axis_infos(face: Phb_face_t; start_offset: dword; axes_count: Pdword; axes_array: Phb_ot_var_axis_info_t): dword; cdecl; external libharfbuzz;
function hb_ot_var_find_axis_info(face: Phb_face_t; axis_tag: Thb_tag_t; axis_info: Phb_ot_var_axis_info_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_ot_var_get_named_instance_count(face: Phb_face_t): dword; cdecl; external libharfbuzz;
function hb_ot_var_named_instance_get_subfamily_name_id(face: Phb_face_t; instance_index: dword): Thb_ot_name_id_t; cdecl; external libharfbuzz;
function hb_ot_var_named_instance_get_postscript_name_id(face: Phb_face_t; instance_index: dword): Thb_ot_name_id_t; cdecl; external libharfbuzz;
function hb_ot_var_named_instance_get_design_coords(face: Phb_face_t; instance_index: dword; coords_length: Pdword; coords: Psingle): dword; cdecl; external libharfbuzz;
procedure hb_ot_var_normalize_variations(face: Phb_face_t; variations: Phb_variation_t; variations_length: dword; coords: Plongint; coords_length: dword); cdecl; external libharfbuzz;
procedure hb_ot_var_normalize_coords(face: Phb_face_t; coords_length: dword; design_coords: Psingle; normalized_coords: Plongint); cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 14:56:45 ===


implementation


end.
