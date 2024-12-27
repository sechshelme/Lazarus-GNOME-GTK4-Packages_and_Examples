unit hb_gobject_structs;

interface

uses
  fp_glib2, hb_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function hb_gobject_blob_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BLOB: TGType;

function hb_gobject_buffer_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER: TGType;

function hb_gobject_draw_funcs_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_DRAW_FUNCS: TGType;

function hb_gobject_paint_funcs_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_PAINT_FUNCS: TGType;

function hb_gobject_face_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_FACE: TGType;

function hb_gobject_font_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_FONT: TGType;

function hb_gobject_font_funcs_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_FONT_FUNCS: TGType;

function hb_gobject_set_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_SET: TGType;

function hb_gobject_map_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_MAP: TGType;

function hb_gobject_shape_plan_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_SHAPE_PLAN: TGType;

function hb_gobject_unicode_funcs_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_UNICODE_FUNCS: TGType;

function hb_gobject_feature_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_FEATURE: TGType;

function hb_gobject_glyph_info_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_GLYPH_INFO: TGType;

function hb_gobject_glyph_position_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_GLYPH_POSITION: TGType;

function hb_gobject_segment_properties_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_SEGMENT_PROPERTIES: TGType;

function hb_gobject_draw_state_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_DRAW_STATE: TGType;

function hb_gobject_color_stop_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_COLOR_STOP: TGType;

function hb_gobject_color_line_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_COLOR_LINE: TGType;

function hb_gobject_user_data_key_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_USER_DATA_KEY: TGType;

function hb_gobject_ot_var_axis_info_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_VAR_AXIS_INFO: TGType;

function hb_gobject_ot_math_glyph_variant_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_MATH_GLYPH_VARIANT: TGType;

function hb_gobject_ot_math_glyph_part_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART: TGType;


// === Konventiert am: 27-12-24 15:15:51 ===


implementation


function HB_GOBJECT_TYPE_BLOB: TGType;
begin
  HB_GOBJECT_TYPE_BLOB := hb_gobject_blob_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER := hb_gobject_buffer_get_type;
end;

function HB_GOBJECT_TYPE_DRAW_FUNCS: TGType;
begin
  HB_GOBJECT_TYPE_DRAW_FUNCS := hb_gobject_draw_funcs_get_type;
end;

function HB_GOBJECT_TYPE_PAINT_FUNCS: TGType;
begin
  HB_GOBJECT_TYPE_PAINT_FUNCS := hb_gobject_paint_funcs_get_type;
end;

function HB_GOBJECT_TYPE_FACE: TGType;
begin
  HB_GOBJECT_TYPE_FACE := hb_gobject_face_get_type;
end;

function HB_GOBJECT_TYPE_FONT: TGType;
begin
  HB_GOBJECT_TYPE_FONT := hb_gobject_font_get_type;
end;

function HB_GOBJECT_TYPE_FONT_FUNCS: TGType;
begin
  HB_GOBJECT_TYPE_FONT_FUNCS := hb_gobject_font_funcs_get_type;
end;

function HB_GOBJECT_TYPE_SET: TGType;
begin
  HB_GOBJECT_TYPE_SET := hb_gobject_set_get_type;
end;

function HB_GOBJECT_TYPE_MAP: TGType;
begin
  HB_GOBJECT_TYPE_MAP := hb_gobject_map_get_type;
end;

function HB_GOBJECT_TYPE_SHAPE_PLAN: TGType;
begin
  HB_GOBJECT_TYPE_SHAPE_PLAN := hb_gobject_shape_plan_get_type;
end;

function HB_GOBJECT_TYPE_UNICODE_FUNCS: TGType;
begin
  HB_GOBJECT_TYPE_UNICODE_FUNCS := hb_gobject_unicode_funcs_get_type;
end;

function HB_GOBJECT_TYPE_FEATURE: TGType;
begin
  HB_GOBJECT_TYPE_FEATURE := hb_gobject_feature_get_type;
end;

function HB_GOBJECT_TYPE_GLYPH_INFO: TGType;
begin
  HB_GOBJECT_TYPE_GLYPH_INFO := hb_gobject_glyph_info_get_type;
end;

function HB_GOBJECT_TYPE_GLYPH_POSITION: TGType;
begin
  HB_GOBJECT_TYPE_GLYPH_POSITION := hb_gobject_glyph_position_get_type;
end;

function HB_GOBJECT_TYPE_SEGMENT_PROPERTIES: TGType;
begin
  HB_GOBJECT_TYPE_SEGMENT_PROPERTIES := hb_gobject_segment_properties_get_type;
end;

function HB_GOBJECT_TYPE_DRAW_STATE: TGType;
begin
  HB_GOBJECT_TYPE_DRAW_STATE := hb_gobject_draw_state_get_type;
end;

function HB_GOBJECT_TYPE_COLOR_STOP: TGType;
begin
  HB_GOBJECT_TYPE_COLOR_STOP := hb_gobject_color_stop_get_type;
end;

function HB_GOBJECT_TYPE_COLOR_LINE: TGType;
begin
  HB_GOBJECT_TYPE_COLOR_LINE := hb_gobject_color_line_get_type;
end;

function HB_GOBJECT_TYPE_USER_DATA_KEY: TGType;
begin
  HB_GOBJECT_TYPE_USER_DATA_KEY := hb_gobject_user_data_key_get_type;
end;

function HB_GOBJECT_TYPE_OT_VAR_AXIS_INFO: TGType;
begin
  HB_GOBJECT_TYPE_OT_VAR_AXIS_INFO := hb_gobject_ot_var_axis_info_get_type;
end;

function HB_GOBJECT_TYPE_OT_MATH_GLYPH_VARIANT: TGType;
begin
  HB_GOBJECT_TYPE_OT_MATH_GLYPH_VARIANT := hb_gobject_ot_math_glyph_variant_get_type;
end;

function HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART: TGType;

begin
  HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART := hb_gobject_ot_math_glyph_part_get_type;
end;


end.
