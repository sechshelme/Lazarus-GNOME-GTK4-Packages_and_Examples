{$IFDEF read_interface}



function hb_gobject_aat_layout_feature_type_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_TYPE: TGType;

function hb_gobject_aat_layout_feature_selector_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_SELECTOR: TGType;

function hb_gobject_memory_mode_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_MEMORY_MODE: TGType;

function hb_gobject_glyph_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_GLYPH_FLAGS: TGType;

function hb_gobject_buffer_content_type_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_CONTENT_TYPE: TGType;

function hb_gobject_buffer_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_FLAGS: TGType;

function hb_gobject_buffer_cluster_level_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_CLUSTER_LEVEL: TGType;

function hb_gobject_buffer_serialize_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FLAGS: TGType;

function hb_gobject_buffer_serialize_format_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FORMAT: TGType;

function hb_gobject_buffer_diff_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_BUFFER_DIFF_FLAGS: TGType;

function hb_gobject_direction_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_DIRECTION: TGType;

function hb_gobject_script_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_SCRIPT: TGType;

function hb_gobject_ot_color_palette_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_COLOR_PALETTE_FLAGS: TGType;

function hb_gobject_ot_layout_glyph_class_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_LAYOUT_GLYPH_CLASS: TGType;

function hb_gobject_ot_layout_baseline_tag_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_LAYOUT_BASELINE_TAG: TGType;

function hb_gobject_ot_math_constant_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_MATH_CONSTANT: TGType;

function hb_gobject_ot_math_kern_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_MATH_KERN: TGType;

function hb_gobject_ot_math_glyph_part_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART_FLAGS: TGType;

function hb_gobject_ot_meta_tag_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_META_TAG: TGType;

function hb_gobject_ot_metrics_tag_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_METRICS_TAG: TGType;

function hb_gobject_ot_name_id_predefined_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_NAME_ID_PREDEFINED: TGType;

function hb_gobject_ot_var_axis_flags_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_OT_VAR_AXIS_FLAGS: TGType;

function hb_gobject_paint_extend_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_PAINT_EXTEND: TGType;

function hb_gobject_paint_composite_mode_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_PAINT_COMPOSITE_MODE: TGType;

function hb_gobject_style_tag_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_STYLE_TAG: TGType;

function hb_gobject_unicode_general_category_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_UNICODE_GENERAL_CATEGORY: TGType;

function hb_gobject_unicode_combining_class_get_type: TGType; cdecl; external libharfbuzzgobject;
function HB_GOBJECT_TYPE_UNICODE_COMBINING_CLASS: TGType;


// === Konventiert am: 26-12-24 17:22:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_TYPE: TGType;
begin
  HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_TYPE := hb_gobject_aat_layout_feature_type_get_type;
end;

function HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_SELECTOR: TGType;
begin
  HB_GOBJECT_TYPE_AAT_LAYOUT_FEATURE_SELECTOR := hb_gobject_aat_layout_feature_selector_get_type;
end;

function HB_GOBJECT_TYPE_MEMORY_MODE: TGType;
begin
  HB_GOBJECT_TYPE_MEMORY_MODE := hb_gobject_memory_mode_get_type;
end;

function HB_GOBJECT_TYPE_GLYPH_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_GLYPH_FLAGS := hb_gobject_glyph_flags_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_CONTENT_TYPE: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_CONTENT_TYPE := hb_gobject_buffer_content_type_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_FLAGS := hb_gobject_buffer_flags_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_CLUSTER_LEVEL: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_CLUSTER_LEVEL := hb_gobject_buffer_cluster_level_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FLAGS := hb_gobject_buffer_serialize_flags_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FORMAT: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_SERIALIZE_FORMAT := hb_gobject_buffer_serialize_format_get_type;
end;

function HB_GOBJECT_TYPE_BUFFER_DIFF_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_BUFFER_DIFF_FLAGS := hb_gobject_buffer_diff_flags_get_type;
end;

function HB_GOBJECT_TYPE_DIRECTION: TGType;
begin
  HB_GOBJECT_TYPE_DIRECTION := hb_gobject_direction_get_type;
end;

function HB_GOBJECT_TYPE_SCRIPT: TGType;
begin
  HB_GOBJECT_TYPE_SCRIPT := hb_gobject_script_get_type;
end;

function HB_GOBJECT_TYPE_OT_COLOR_PALETTE_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_OT_COLOR_PALETTE_FLAGS := hb_gobject_ot_color_palette_flags_get_type;
end;

function HB_GOBJECT_TYPE_OT_LAYOUT_GLYPH_CLASS: TGType;
begin
  HB_GOBJECT_TYPE_OT_LAYOUT_GLYPH_CLASS := hb_gobject_ot_layout_glyph_class_get_type;
end;

function HB_GOBJECT_TYPE_OT_LAYOUT_BASELINE_TAG: TGType;
begin
  HB_GOBJECT_TYPE_OT_LAYOUT_BASELINE_TAG := hb_gobject_ot_layout_baseline_tag_get_type;
end;

function HB_GOBJECT_TYPE_OT_MATH_CONSTANT: TGType;
begin
  HB_GOBJECT_TYPE_OT_MATH_CONSTANT := hb_gobject_ot_math_constant_get_type;
end;

function HB_GOBJECT_TYPE_OT_MATH_KERN: TGType;
begin
  HB_GOBJECT_TYPE_OT_MATH_KERN := hb_gobject_ot_math_kern_get_type;
end;

function HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_OT_MATH_GLYPH_PART_FLAGS := hb_gobject_ot_math_glyph_part_flags_get_type;
end;

function HB_GOBJECT_TYPE_OT_META_TAG: TGType;
begin
  HB_GOBJECT_TYPE_OT_META_TAG := hb_gobject_ot_meta_tag_get_type;
end;

function HB_GOBJECT_TYPE_OT_METRICS_TAG: TGType;
begin
  HB_GOBJECT_TYPE_OT_METRICS_TAG := hb_gobject_ot_metrics_tag_get_type;
end;

function HB_GOBJECT_TYPE_OT_NAME_ID_PREDEFINED: TGType;
begin
  HB_GOBJECT_TYPE_OT_NAME_ID_PREDEFINED := hb_gobject_ot_name_id_predefined_get_type;
end;

function HB_GOBJECT_TYPE_OT_VAR_AXIS_FLAGS: TGType;
begin
  HB_GOBJECT_TYPE_OT_VAR_AXIS_FLAGS := hb_gobject_ot_var_axis_flags_get_type;
end;

function HB_GOBJECT_TYPE_PAINT_EXTEND: TGType;
begin
  HB_GOBJECT_TYPE_PAINT_EXTEND := hb_gobject_paint_extend_get_type;
end;

function HB_GOBJECT_TYPE_PAINT_COMPOSITE_MODE: TGType;
begin
  HB_GOBJECT_TYPE_PAINT_COMPOSITE_MODE := hb_gobject_paint_composite_mode_get_type;
end;

function HB_GOBJECT_TYPE_STYLE_TAG: TGType;
begin
  HB_GOBJECT_TYPE_STYLE_TAG := hb_gobject_style_tag_get_type;
end;

function HB_GOBJECT_TYPE_UNICODE_GENERAL_CATEGORY: TGType;
begin
  HB_GOBJECT_TYPE_UNICODE_GENERAL_CATEGORY := hb_gobject_unicode_general_category_get_type;
end;

function HB_GOBJECT_TYPE_UNICODE_COMBINING_CLASS: TGType;
begin
  HB_GOBJECT_TYPE_UNICODE_COMBINING_CLASS := hb_gobject_unicode_combining_class_get_type;
end;


{$ENDIF read_implementation}
