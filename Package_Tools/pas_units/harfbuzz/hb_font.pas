unit hb_font;

interface

uses
  fp_glib2, hb_common, hb_draw, hb_paint;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Thb_font_funcs_t = record
  end;
  Phb_font_funcs_t = ^Thb_font_funcs_t;

function hb_font_funcs_create: Phb_font_funcs_t; cdecl; external libharfbuzz;
function hb_font_funcs_get_empty: Phb_font_funcs_t; cdecl; external libharfbuzz;
function hb_font_funcs_reference(ffuncs: Phb_font_funcs_t): Phb_font_funcs_t; cdecl; external libharfbuzz;
procedure hb_font_funcs_destroy(ffuncs: Phb_font_funcs_t); cdecl; external libharfbuzz;
function hb_font_funcs_set_user_data(ffuncs: Phb_font_funcs_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_funcs_get_user_data(ffuncs: Phb_font_funcs_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_font_funcs_make_immutable(ffuncs: Phb_font_funcs_t); cdecl; external libharfbuzz;
function hb_font_funcs_is_immutable(ffuncs: Phb_font_funcs_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Thb_font_extents_t = record
    ascender: Thb_position_t;
    descender: Thb_position_t;
    line_gap: Thb_position_t;
    reserved9: Thb_position_t;
    reserved8: Thb_position_t;
    reserved7: Thb_position_t;
    reserved6: Thb_position_t;
    reserved5: Thb_position_t;
    reserved4: Thb_position_t;
    reserved3: Thb_position_t;
    reserved2: Thb_position_t;
    reserved1: Thb_position_t;
  end;
  Phb_font_extents_t = ^Thb_font_extents_t;

  Thb_font_get_font_extents_func_t = function(font: Phb_font_t; font_data: pointer; extents: Phb_font_extents_t; user_data: pointer): Thb_bool_t; cdecl;

  Phb_font_get_font_h_extents_func_t = ^Thb_font_get_font_h_extents_func_t;
  Thb_font_get_font_h_extents_func_t = Thb_font_get_font_extents_func_t;

  Phb_font_get_font_v_extents_func_t = ^Thb_font_get_font_v_extents_func_t;
  Thb_font_get_font_v_extents_func_t = Thb_font_get_font_extents_func_t;

  Thb_font_get_nominal_glyph_func_t = function(font: Phb_font_t; font_data: pointer; unicode: Thb_codepoint_t; glyph: Phb_codepoint_t; user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_get_variation_glyph_func_t = function(font: Phb_font_t; font_data: pointer; unicode: Thb_codepoint_t; variation_selector: Thb_codepoint_t; glyph: Phb_codepoint_t;
    user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_get_nominal_glyphs_func_t = function(font: Phb_font_t; font_data: pointer; Count: dword; first_unicode: Phb_codepoint_t; unicode_stride: dword;
    first_glyph: Phb_codepoint_t; glyph_stride: dword; user_data: pointer): dword; cdecl;
  Thb_font_get_glyph_advance_func_t = function(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; user_data: pointer): Thb_position_t; cdecl;

  Phb_font_get_glyph_h_advance_func_t = ^Thb_font_get_glyph_h_advance_func_t;
  Thb_font_get_glyph_h_advance_func_t = Thb_font_get_glyph_advance_func_t;

  Phb_font_get_glyph_v_advance_func_t = ^Thb_font_get_glyph_v_advance_func_t;
  Thb_font_get_glyph_v_advance_func_t = Thb_font_get_glyph_advance_func_t;

  Thb_font_get_glyph_advances_func_t = procedure(font: Phb_font_t; font_data: pointer; Count: dword; first_glyph: Phb_codepoint_t; glyph_stride: dword;
    first_advance: Phb_position_t; advance_stride: dword; user_data: pointer); cdecl;

  Phb_font_get_glyph_h_advances_func_t = ^Thb_font_get_glyph_h_advances_func_t;
  Thb_font_get_glyph_h_advances_func_t = Thb_font_get_glyph_advances_func_t;

  Phb_font_get_glyph_v_advances_func_t = ^Thb_font_get_glyph_v_advances_func_t;
  Thb_font_get_glyph_v_advances_func_t = Thb_font_get_glyph_advances_func_t;

  Thb_font_get_glyph_origin_func_t = function(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; x: Phb_position_t; y: Phb_position_t;
    user_data: pointer): Thb_bool_t; cdecl;

  Phb_font_get_glyph_h_origin_func_t = ^Thb_font_get_glyph_h_origin_func_t;
  Thb_font_get_glyph_h_origin_func_t = Thb_font_get_glyph_origin_func_t;

  Phb_font_get_glyph_v_origin_func_t = ^Thb_font_get_glyph_v_origin_func_t;
  Thb_font_get_glyph_v_origin_func_t = Thb_font_get_glyph_origin_func_t;

  Thb_font_get_glyph_kerning_func_t = function(font: Phb_font_t; font_data: pointer; first_glyph: Thb_codepoint_t; second_glyph: Thb_codepoint_t; user_data: pointer): Thb_position_t; cdecl;

  Phb_font_get_glyph_h_kerning_func_t = ^Thb_font_get_glyph_h_kerning_func_t;
  Thb_font_get_glyph_h_kerning_func_t = Thb_font_get_glyph_kerning_func_t;

  Thb_font_get_glyph_extents_func_t = function(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; extents: Phb_glyph_extents_t; user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_get_glyph_contour_point_func_t = function(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; point_index: dword; x: Phb_position_t;
    y: Phb_position_t; user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_get_glyph_name_func_t = function(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; Name: pchar; size: dword;
    user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_get_glyph_from_name_func_t = function(font: Phb_font_t; font_data: pointer; Name: pchar; len: longint; glyph: Phb_codepoint_t;
    user_data: pointer): Thb_bool_t; cdecl;
  Thb_font_draw_glyph_func_t = procedure(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; draw_funcs: Phb_draw_funcs_t; draw_data: pointer;
    user_data: pointer); cdecl;
  Thb_font_paint_glyph_func_t = procedure(font: Phb_font_t; font_data: pointer; glyph: Thb_codepoint_t; paint_funcs: Phb_paint_funcs_t; paint_data: pointer;
    palette_index: dword; foreground: Thb_color_t; user_data: pointer); cdecl;

procedure hb_font_funcs_set_font_h_extents_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_font_h_extents_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_font_v_extents_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_font_v_extents_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_nominal_glyph_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_nominal_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_nominal_glyphs_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_nominal_glyphs_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_variation_glyph_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_variation_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_h_advance_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_h_advance_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_v_advance_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_v_advance_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_h_advances_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_h_advances_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_v_advances_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_v_advances_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_h_origin_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_h_origin_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_v_origin_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_v_origin_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_h_kerning_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_h_kerning_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_extents_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_extents_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_contour_point_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_contour_point_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_name_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_name_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_glyph_from_name_func(ffuncs: Phb_font_funcs_t; func: Thb_font_get_glyph_from_name_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_draw_glyph_func(ffuncs: Phb_font_funcs_t; func: Thb_font_draw_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_funcs_set_paint_glyph_func(ffuncs: Phb_font_funcs_t; func: Thb_font_paint_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
function hb_font_get_h_extents(font: Phb_font_t; extents: Phb_font_extents_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_v_extents(font: Phb_font_t; extents: Phb_font_extents_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_nominal_glyph(font: Phb_font_t; unicode: Thb_codepoint_t; glyph: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_variation_glyph(font: Phb_font_t; unicode: Thb_codepoint_t; variation_selector: Thb_codepoint_t; glyph: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_nominal_glyphs(font: Phb_font_t; Count: dword; first_unicode: Phb_codepoint_t; unicode_stride: dword; first_glyph: Phb_codepoint_t;
  glyph_stride: dword): dword; cdecl; external libharfbuzz;
function hb_font_get_glyph_h_advance(font: Phb_font_t; glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_v_advance(font: Phb_font_t; glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
procedure hb_font_get_glyph_h_advances(font: Phb_font_t; Count: dword; first_glyph: Phb_codepoint_t; glyph_stride: dword; first_advance: Phb_position_t;
  advance_stride: dword); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_v_advances(font: Phb_font_t; Count: dword; first_glyph: Phb_codepoint_t; glyph_stride: dword; first_advance: Phb_position_t;
  advance_stride: dword); cdecl; external libharfbuzz;
function hb_font_get_glyph_h_origin(font: Phb_font_t; glyph: Thb_codepoint_t; x: Phb_position_t; y: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_v_origin(font: Phb_font_t; glyph: Thb_codepoint_t; x: Phb_position_t; y: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_h_kerning(font: Phb_font_t; left_glyph: Thb_codepoint_t; right_glyph: Thb_codepoint_t): Thb_position_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_extents(font: Phb_font_t; glyph: Thb_codepoint_t; extents: Phb_glyph_extents_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_contour_point(font: Phb_font_t; glyph: Thb_codepoint_t; point_index: dword; x: Phb_position_t; y: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_name(font: Phb_font_t; glyph: Thb_codepoint_t; Name: pchar; size: dword): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_from_name(font: Phb_font_t; Name: pchar; len: longint; glyph: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_font_draw_glyph(font: Phb_font_t; glyph: Thb_codepoint_t; dfuncs: Phb_draw_funcs_t; draw_data: pointer); cdecl; external libharfbuzz;
procedure hb_font_paint_glyph(font: Phb_font_t; glyph: Thb_codepoint_t; pfuncs: Phb_paint_funcs_t; paint_data: pointer; palette_index: dword;
  foreground: Thb_color_t); cdecl; external libharfbuzz;
function hb_font_get_glyph(font: Phb_font_t; unicode: Thb_codepoint_t; variation_selector: Thb_codepoint_t; glyph: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_font_get_extents_for_direction(font: Phb_font_t; direction: Thb_direction_t; extents: Phb_font_extents_t); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_advance_for_direction(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; x: Phb_position_t; y: Phb_position_t); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_advances_for_direction(font: Phb_font_t; direction: Thb_direction_t; Count: dword; first_glyph: Phb_codepoint_t; glyph_stride: dword;
  first_advance: Phb_position_t; advance_stride: dword); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_origin_for_direction(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; x: Phb_position_t; y: Phb_position_t); cdecl; external libharfbuzz;
procedure hb_font_add_glyph_origin_for_direction(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; x: Phb_position_t; y: Phb_position_t); cdecl; external libharfbuzz;
procedure hb_font_subtract_glyph_origin_for_direction(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; x: Phb_position_t; y: Phb_position_t); cdecl; external libharfbuzz;
procedure hb_font_get_glyph_kerning_for_direction(font: Phb_font_t; first_glyph: Thb_codepoint_t; second_glyph: Thb_codepoint_t; direction: Thb_direction_t; x: Phb_position_t;
  y: Phb_position_t); cdecl; external libharfbuzz;
function hb_font_get_glyph_extents_for_origin(font: Phb_font_t; glyph: Thb_codepoint_t; direction: Thb_direction_t; extents: Phb_glyph_extents_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_glyph_contour_point_for_origin(font: Phb_font_t; glyph: Thb_codepoint_t; point_index: dword; direction: Thb_direction_t; x: Phb_position_t;
  y: Phb_position_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_font_glyph_to_string(font: Phb_font_t; glyph: Thb_codepoint_t; s: pchar; size: dword); cdecl; external libharfbuzz;
function hb_font_glyph_from_string(font: Phb_font_t; s: pchar; len: longint; glyph: Phb_codepoint_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_create(face: Phb_face_t): Phb_font_t; cdecl; external libharfbuzz;
function hb_font_create_sub_font(parent: Phb_font_t): Phb_font_t; cdecl; external libharfbuzz;
function hb_font_get_empty: Phb_font_t; cdecl; external libharfbuzz;
function hb_font_reference(font: Phb_font_t): Phb_font_t; cdecl; external libharfbuzz;
procedure hb_font_destroy(font: Phb_font_t); cdecl; external libharfbuzz;
function hb_font_set_user_data(font: Phb_font_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_user_data(font: Phb_font_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_font_make_immutable(font: Phb_font_t); cdecl; external libharfbuzz;
function hb_font_is_immutable(font: Phb_font_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_font_get_serial(font: Phb_font_t): dword; cdecl; external libharfbuzz;
procedure hb_font_changed(font: Phb_font_t); cdecl; external libharfbuzz;
procedure hb_font_set_parent(font: Phb_font_t; parent: Phb_font_t); cdecl; external libharfbuzz;
function hb_font_get_parent(font: Phb_font_t): Phb_font_t; cdecl; external libharfbuzz;
procedure hb_font_set_face(font: Phb_font_t; face: Phb_face_t); cdecl; external libharfbuzz;
function hb_font_get_face(font: Phb_font_t): Phb_face_t; cdecl; external libharfbuzz;
procedure hb_font_set_funcs(font: Phb_font_t; klass: Phb_font_funcs_t; font_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_set_funcs_data(font: Phb_font_t; font_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_font_set_scale(font: Phb_font_t; x_scale: longint; y_scale: longint); cdecl; external libharfbuzz;
procedure hb_font_get_scale(font: Phb_font_t; x_scale: Plongint; y_scale: Plongint); cdecl; external libharfbuzz;
procedure hb_font_set_ppem(font: Phb_font_t; x_ppem: dword; y_ppem: dword); cdecl; external libharfbuzz;
procedure hb_font_get_ppem(font: Phb_font_t; x_ppem: Pdword; y_ppem: Pdword); cdecl; external libharfbuzz;
procedure hb_font_set_ptem(font: Phb_font_t; ptem: single); cdecl; external libharfbuzz;
function hb_font_get_ptem(font: Phb_font_t): single; cdecl; external libharfbuzz;
procedure hb_font_set_synthetic_bold(font: Phb_font_t; x_embolden: single; y_embolden: single; in_place: Thb_bool_t); cdecl; external libharfbuzz;
procedure hb_font_get_synthetic_bold(font: Phb_font_t; x_embolden: Psingle; y_embolden: Psingle; in_place: Phb_bool_t); cdecl; external libharfbuzz;
procedure hb_font_set_synthetic_slant(font: Phb_font_t; slant: single); cdecl; external libharfbuzz;
function hb_font_get_synthetic_slant(font: Phb_font_t): single; cdecl; external libharfbuzz;
procedure hb_font_set_variations(font: Phb_font_t; variations: Phb_variation_t; variations_length: dword); cdecl; external libharfbuzz;
procedure hb_font_set_variation(font: Phb_font_t; tag: Thb_tag_t; Value: single); cdecl; external libharfbuzz;
procedure hb_font_set_var_coords_design(font: Phb_font_t; coords: Psingle; coords_length: dword); cdecl; external libharfbuzz;
function hb_font_get_var_coords_design(font: Phb_font_t; length: Pdword): Psingle; cdecl; external libharfbuzz;
procedure hb_font_set_var_coords_normalized(font: Phb_font_t; coords: Plongint; coords_length: dword); cdecl; external libharfbuzz;
function hb_font_get_var_coords_normalized(font: Phb_font_t; length: Pdword): Plongint; cdecl; external libharfbuzz;

const
  HB_FONT_NO_VAR_NAMED_INSTANCE = $FFFFFFFF;

procedure hb_font_set_var_named_instance(font: Phb_font_t; instance_index: dword); cdecl; external libharfbuzz;
function hb_font_get_var_named_instance(font: Phb_font_t): dword; cdecl; external libharfbuzz;

// === Konventiert am: 25-12-24 19:27:25 ===


implementation



end.
