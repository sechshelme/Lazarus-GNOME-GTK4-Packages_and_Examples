{$IFDEF read_interface}

type
  Thb_paint_funcs_t = record
  end;
  Phb_paint_funcs_t = ^Thb_paint_funcs_t;

function hb_paint_funcs_create: Phb_paint_funcs_t; cdecl; external libharfbuzz;
function hb_paint_funcs_get_empty: Phb_paint_funcs_t; cdecl; external libharfbuzz;
function hb_paint_funcs_reference(funcs: Phb_paint_funcs_t): Phb_paint_funcs_t; cdecl; external libharfbuzz;
procedure hb_paint_funcs_destroy(funcs: Phb_paint_funcs_t); cdecl; external libharfbuzz;
function hb_paint_funcs_set_user_data(funcs: Phb_paint_funcs_t; key: Phb_user_data_key_t; Data: pointer; Destroy: Thb_destroy_func_t; replace: Thb_bool_t): Thb_bool_t; cdecl; external libharfbuzz;
function hb_paint_funcs_get_user_data(funcs: Phb_paint_funcs_t; key: Phb_user_data_key_t): pointer; cdecl; external libharfbuzz;
procedure hb_paint_funcs_make_immutable(funcs: Phb_paint_funcs_t); cdecl; external libharfbuzz;
function hb_paint_funcs_is_immutable(funcs: Phb_paint_funcs_t): Thb_bool_t; cdecl; external libharfbuzz;

type
  Thb_paint_push_transform_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; xx: single; yx: single; xy: single; yy: single; dx: single; dy: single; user_data: pointer); cdecl;
  Thb_paint_pop_transform_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; user_data: pointer); cdecl;
  Thb_paint_color_glyph_func_t = function(funcs: Phb_paint_funcs_t; paint_data: pointer; glyph: Thb_codepoint_t; font: Phb_font_t; user_data: pointer): Thb_bool_t; cdecl;
  Thb_paint_push_clip_glyph_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; glyph: Thb_codepoint_t; font: Phb_font_t; user_data: pointer); cdecl;
  Thb_paint_push_clip_rectangle_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; xmin: single; ymin: single; xmax: single; ymax: single; user_data: pointer); cdecl;
  Thb_paint_pop_clip_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; user_data: pointer); cdecl;
  Thb_paint_color_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; is_foreground: Thb_bool_t; color: Thb_color_t; user_data: pointer); cdecl;

type
  Thb_paint_image_func_t = function(funcs: Phb_paint_funcs_t; paint_data: pointer; image: Phb_blob_t; Width: dword; Height: dword; format: Thb_tag_t; slant: single; extents: Phb_glyph_extents_t; user_data: pointer): Thb_bool_t; cdecl;

  Thb_color_stop_t = record
    offset: single;
    is_foreground: Thb_bool_t;
    color: Thb_color_t;
  end;
  Phb_color_stop_t = ^Thb_color_stop_t;

  Phb_paint_extend_t = ^Thb_paint_extend_t;
  Thb_paint_extend_t = longint;

const
  HB_PAINT_EXTEND_PAD = 0;
  HB_PAINT_EXTEND_REPEAT = 1;
  HB_PAINT_EXTEND_REFLECT = 2;

type
  Phb_color_line_t = ^Thb_color_line_t;

  Thb_color_line_get_color_stops_func_t = function(color_line: Phb_color_line_t; color_line_data: pointer; start: dword; Count: Pdword; color_stops: Phb_color_stop_t; user_data: pointer): dword; cdecl;
  Thb_color_line_get_extend_func_t = function(color_line: Phb_color_line_t; color_line_data: pointer; user_data: pointer): Thb_paint_extend_t; cdecl;

  Thb_color_line_t = record
    Data: pointer;
    get_color_stops: Thb_color_line_get_color_stops_func_t;
    get_color_stops_user_data: pointer;
    get_extend: Thb_color_line_get_extend_func_t;
    get_extend_user_data: pointer;
    reserved0: pointer;
    reserved1: pointer;
    reserved2: pointer;
    reserved3: pointer;
    reserved5: pointer;
    reserved6: pointer;
    reserved7: pointer;
    reserved8: pointer;
  end;

function hb_color_line_get_color_stops(color_line: Phb_color_line_t; start: dword; Count: Pdword; color_stops: Phb_color_stop_t): dword; cdecl; external libharfbuzz;
function hb_color_line_get_extend(color_line: Phb_color_line_t): Thb_paint_extend_t; cdecl; external libharfbuzz;

type
  Thb_paint_linear_gradient_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single; x1: single; y1: single; x2: single; y2: single; user_data: pointer); cdecl;
  Thb_paint_radial_gradient_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single; r0: single; x1: single; y1: single; r1: single; user_data: pointer); cdecl;
  Thb_paint_sweep_gradient_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single; start_angle: single; end_angle: single; user_data: pointer); cdecl;

  Phb_paint_composite_mode_t = ^Thb_paint_composite_mode_t;
  Thb_paint_composite_mode_t = longint;

const
  HB_PAINT_COMPOSITE_MODE_CLEAR = 0;
  HB_PAINT_COMPOSITE_MODE_SRC = 1;
  HB_PAINT_COMPOSITE_MODE_DEST = 2;
  HB_PAINT_COMPOSITE_MODE_SRC_OVER = 3;
  HB_PAINT_COMPOSITE_MODE_DEST_OVER = 4;
  HB_PAINT_COMPOSITE_MODE_SRC_IN = 5;
  HB_PAINT_COMPOSITE_MODE_DEST_IN = 6;
  HB_PAINT_COMPOSITE_MODE_SRC_OUT = 7;
  HB_PAINT_COMPOSITE_MODE_DEST_OUT = 8;
  HB_PAINT_COMPOSITE_MODE_SRC_ATOP = 9;
  HB_PAINT_COMPOSITE_MODE_DEST_ATOP = 10;
  HB_PAINT_COMPOSITE_MODE_XOR = 11;
  HB_PAINT_COMPOSITE_MODE_PLUS = 12;
  HB_PAINT_COMPOSITE_MODE_SCREEN = 13;
  HB_PAINT_COMPOSITE_MODE_OVERLAY = 14;
  HB_PAINT_COMPOSITE_MODE_DARKEN = 15;
  HB_PAINT_COMPOSITE_MODE_LIGHTEN = 16;
  HB_PAINT_COMPOSITE_MODE_COLOR_DODGE = 17;
  HB_PAINT_COMPOSITE_MODE_COLOR_BURN = 18;
  HB_PAINT_COMPOSITE_MODE_HARD_LIGHT = 19;
  HB_PAINT_COMPOSITE_MODE_SOFT_LIGHT = 20;
  HB_PAINT_COMPOSITE_MODE_DIFFERENCE = 21;
  HB_PAINT_COMPOSITE_MODE_EXCLUSION = 22;
  HB_PAINT_COMPOSITE_MODE_MULTIPLY = 23;
  HB_PAINT_COMPOSITE_MODE_HSL_HUE = 24;
  HB_PAINT_COMPOSITE_MODE_HSL_SATURATION = 25;
  HB_PAINT_COMPOSITE_MODE_HSL_COLOR = 26;
  HB_PAINT_COMPOSITE_MODE_HSL_LUMINOSITY = 27;

type
  Thb_paint_push_group_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; user_data: pointer); cdecl;
  Thb_paint_pop_group_func_t = procedure(funcs: Phb_paint_funcs_t; paint_data: pointer; mode: Thb_paint_composite_mode_t; user_data: pointer); cdecl;
  Thb_paint_custom_palette_color_func_t = function(funcs: Phb_paint_funcs_t; paint_data: pointer; color_index: dword; color: Phb_color_t; user_data: pointer): Thb_bool_t; cdecl;

procedure hb_paint_funcs_set_push_transform_func(funcs: Phb_paint_funcs_t; func: Thb_paint_push_transform_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_pop_transform_func(funcs: Phb_paint_funcs_t; func: Thb_paint_pop_transform_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_color_glyph_func(funcs: Phb_paint_funcs_t; func: Thb_paint_color_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_push_clip_glyph_func(funcs: Phb_paint_funcs_t; func: Thb_paint_push_clip_glyph_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_push_clip_rectangle_func(funcs: Phb_paint_funcs_t; func: Thb_paint_push_clip_rectangle_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_pop_clip_func(funcs: Phb_paint_funcs_t; func: Thb_paint_pop_clip_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_color_func(funcs: Phb_paint_funcs_t; func: Thb_paint_color_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_image_func(funcs: Phb_paint_funcs_t; func: Thb_paint_image_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_linear_gradient_func(funcs: Phb_paint_funcs_t; func: Thb_paint_linear_gradient_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_radial_gradient_func(funcs: Phb_paint_funcs_t; func: Thb_paint_radial_gradient_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_sweep_gradient_func(funcs: Phb_paint_funcs_t; func: Thb_paint_sweep_gradient_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_push_group_func(funcs: Phb_paint_funcs_t; func: Thb_paint_push_group_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_pop_group_func(funcs: Phb_paint_funcs_t; func: Thb_paint_pop_group_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_funcs_set_custom_palette_color_func(funcs: Phb_paint_funcs_t; func: Thb_paint_custom_palette_color_func_t; user_data: pointer; Destroy: Thb_destroy_func_t); cdecl; external libharfbuzz;
procedure hb_paint_push_transform(funcs: Phb_paint_funcs_t; paint_data: pointer; xx: single; yx: single; xy: single;
  yy: single; dx: single; dy: single); cdecl; external libharfbuzz;
procedure hb_paint_pop_transform(funcs: Phb_paint_funcs_t; paint_data: pointer); cdecl; external libharfbuzz;
function hb_paint_color_glyph(funcs: Phb_paint_funcs_t; paint_data: pointer; glyph: Thb_codepoint_t; font: Phb_font_t): Thb_bool_t; cdecl; external libharfbuzz;
procedure hb_paint_push_clip_glyph(funcs: Phb_paint_funcs_t; paint_data: pointer; glyph: Thb_codepoint_t; font: Phb_font_t); cdecl; external libharfbuzz;
procedure hb_paint_push_clip_rectangle(funcs: Phb_paint_funcs_t; paint_data: pointer; xmin: single; ymin: single; xmax: single;
  ymax: single); cdecl; external libharfbuzz;
procedure hb_paint_pop_clip(funcs: Phb_paint_funcs_t; paint_data: pointer); cdecl; external libharfbuzz;
procedure hb_paint_color(funcs: Phb_paint_funcs_t; paint_data: pointer; is_foreground: Thb_bool_t; color: Thb_color_t); cdecl; external libharfbuzz;
procedure hb_paint_image(funcs: Phb_paint_funcs_t; paint_data: pointer; image: Phb_blob_t; Width: dword; Height: dword;
  format: Thb_tag_t; slant: single; extents: Phb_glyph_extents_t); cdecl; external libharfbuzz;
procedure hb_paint_linear_gradient(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single;
  x1: single; y1: single; x2: single; y2: single); cdecl; external libharfbuzz;
procedure hb_paint_radial_gradient(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single;
  r0: single; x1: single; y1: single; r1: single); cdecl; external libharfbuzz;
procedure hb_paint_sweep_gradient(funcs: Phb_paint_funcs_t; paint_data: pointer; color_line: Phb_color_line_t; x0: single; y0: single;
  start_angle: single; end_angle: single); cdecl; external libharfbuzz;
procedure hb_paint_push_group(funcs: Phb_paint_funcs_t; paint_data: pointer); cdecl; external libharfbuzz;
procedure hb_paint_pop_group(funcs: Phb_paint_funcs_t; paint_data: pointer; mode: Thb_paint_composite_mode_t); cdecl; external libharfbuzz;
function hb_paint_custom_palette_color(funcs: Phb_paint_funcs_t; paint_data: pointer; color_index: dword; color: Phb_color_t): Thb_bool_t; cdecl; external libharfbuzz;

const
  HB_PAINT_IMAGE_FORMAT_PNG = (Ord('p') shl 24) or (Ord('n') shl 16) or (Ord('g') shl 8) or Ord(' ');
  HB_PAINT_IMAGE_FORMAT_SVG = (Ord('s') shl 24) or (Ord('v') shl 16) or (Ord('g') shl 8) or Ord(' ');
  HB_PAINT_IMAGE_FORMAT_BGRA = (Ord('B') shl 24) or (Ord('G') shl 16) or (Ord('R') shl 8) or Ord('A');


  // === Konventiert am: 25-12-24 19:35:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
