unit hb_shape_plan;

interface

uses
  fp_glib2, hb_common, hb_buffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Thb_shape_plan_t = record
  end;
  Phb_shape_plan_t = ^Thb_shape_plan_t;

function hb_shape_plan_create(face: Phb_face_t; props: Phb_segment_properties_t; user_features: Phb_feature_t; num_user_features: dword; shaper_list: PPchar): Phb_shape_plan_t; cdecl; external libharfbuzz;
function hb_shape_plan_create_cached(face: Phb_face_t; props: Phb_segment_properties_t; user_features: Phb_feature_t; num_user_features: dword; shaper_list: PPchar): Phb_shape_plan_t; cdecl; external libharfbuzz;
function hb_shape_plan_create2(face: Phb_face_t; props: Phb_segment_properties_t; user_features: Phb_feature_t; num_user_features: dword; coords: Plongint;
  num_coords: dword; shaper_list: PPchar): Phb_shape_plan_t; cdecl; external libharfbuzz;
function hb_shape_plan_create_cached2(face: Phb_face_t; props: Phb_segment_properties_t; user_features: Phb_feature_t; num_user_features: dword; coords: Plongint;
  num_coords: dword; shaper_list: PPchar): Phb_shape_plan_t; cdecl; external libharfbuzz;
function hb_shape_plan_get_empty: Phb_shape_plan_t; cdecl; external libharfbuzz;
function hb_shape_plan_reference(shape_plan: Phb_shape_plan_t): Phb_shape_plan_t; cdecl; external libharfbuzz;
procedure hb_shape_plan_destroy(shape_plan: Phb_shape_plan_t); cdecl; external libharfbuzz;
function hb_shape_plan_set_user_data(shape_plan: Phb_shape_plan_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_shape_plan_get_user_data(shape_plan: Phb_shape_plan_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
function hb_shape_plan_execute(shape_plan: Phb_shape_plan_t; font: Phb_font_t; buffer: Phb_buffer_t; features: Phb_feature_t; num_features: dword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_shape_plan_get_shaper(shape_plan: Phb_shape_plan_t): pchar; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:07:19 ===


implementation



end.
