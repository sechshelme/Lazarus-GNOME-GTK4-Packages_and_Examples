/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 26-11-2024   16:54                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

function pango_attr_type_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_ATTR_TYPE: TGType;

function pango_underline_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_UNDERLINE: TGType;

function pango_overline_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_OVERLINE: TGType;

function pango_show_flags_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_SHOW_FLAGS: TGType;

function pango_text_transform_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_TEXT_TRANSFORM: TGType;

function pango_baseline_shift_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_BASELINE_SHIFT: TGType;

function pango_font_scale_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_FONT_SCALE: TGType;

function pango_bidi_type_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_BIDI_TYPE: TGType;

function pango_coverage_level_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_COVERAGE_LEVEL: TGType;

function pango_direction_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_DIRECTION: TGType;

function pango_style_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_STYLE: TGType;

function pango_variant_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_VARIANT: TGType;

function pango_weight_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_WEIGHT: TGType;

function pango_stretch_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_STRETCH: TGType;

function pango_font_mask_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_FONT_MASK: TGType;

function pango_shape_flags_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_SHAPE_FLAGS: TGType;

function pango_gravity_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_GRAVITY: TGType;

function pango_gravity_hint_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_GRAVITY_HINT: TGType;

function pango_alignment_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_ALIGNMENT: TGType;

function pango_wrap_mode_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_WRAP_MODE: TGType;

function pango_ellipsize_mode_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_ELLIPSIZE_MODE: TGType;

function pango_layout_serialize_flags_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_LAYOUT_SERIALIZE_FLAGS: TGType;

function pango_layout_deserialize_error_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_LAYOUT_DESERIALIZE_ERROR: TGType;

function pango_layout_deserialize_flags_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_LAYOUT_DESERIALIZE_FLAGS: TGType;

function pango_render_part_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_RENDER_PART: TGType;

function pango_script_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_SCRIPT: TGType;

function pango_tab_align_get_type: TGType; cdecl; external libpango;
function PANGO_TYPE_TAB_ALIGN: TGType;


// === Konventiert am: 26-11-24 15:44:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function PANGO_TYPE_ATTR_TYPE: TGType;
begin
  PANGO_TYPE_ATTR_TYPE := pango_attr_type_get_type;
end;

function PANGO_TYPE_UNDERLINE: TGType;
begin
  PANGO_TYPE_UNDERLINE := pango_underline_get_type;
end;

function PANGO_TYPE_OVERLINE: TGType;
begin
  PANGO_TYPE_OVERLINE := pango_overline_get_type;
end;

function PANGO_TYPE_SHOW_FLAGS: TGType;
begin
  PANGO_TYPE_SHOW_FLAGS := pango_show_flags_get_type;
end;

function PANGO_TYPE_TEXT_TRANSFORM: TGType;
begin
  PANGO_TYPE_TEXT_TRANSFORM := pango_text_transform_get_type;
end;

function PANGO_TYPE_BASELINE_SHIFT: TGType;
begin
  PANGO_TYPE_BASELINE_SHIFT := pango_baseline_shift_get_type;
end;

function PANGO_TYPE_FONT_SCALE: TGType;
begin
  PANGO_TYPE_FONT_SCALE := pango_font_scale_get_type;
end;

function PANGO_TYPE_BIDI_TYPE: TGType;
begin
  PANGO_TYPE_BIDI_TYPE := pango_bidi_type_get_type;
end;

function PANGO_TYPE_COVERAGE_LEVEL: TGType;
begin
  PANGO_TYPE_COVERAGE_LEVEL := pango_coverage_level_get_type;
end;

function PANGO_TYPE_DIRECTION: TGType;
begin
  PANGO_TYPE_DIRECTION := pango_direction_get_type;
end;

function PANGO_TYPE_STYLE: TGType;
begin
  PANGO_TYPE_STYLE := pango_style_get_type;
end;

function PANGO_TYPE_VARIANT: TGType;
begin
  PANGO_TYPE_VARIANT := pango_variant_get_type;
end;

function PANGO_TYPE_WEIGHT: TGType;
begin
  PANGO_TYPE_WEIGHT := pango_weight_get_type;
end;

function PANGO_TYPE_STRETCH: TGType;
begin
  PANGO_TYPE_STRETCH := pango_stretch_get_type;
end;

function PANGO_TYPE_FONT_MASK: TGType;
begin
  PANGO_TYPE_FONT_MASK := pango_font_mask_get_type;
end;

function PANGO_TYPE_SHAPE_FLAGS: TGType;
begin
  PANGO_TYPE_SHAPE_FLAGS := pango_shape_flags_get_type;
end;

function PANGO_TYPE_GRAVITY: TGType;
begin
  PANGO_TYPE_GRAVITY := pango_gravity_get_type;
end;

function PANGO_TYPE_GRAVITY_HINT: TGType;
begin
  PANGO_TYPE_GRAVITY_HINT := pango_gravity_hint_get_type;
end;

function PANGO_TYPE_ALIGNMENT: TGType;
begin
  PANGO_TYPE_ALIGNMENT := pango_alignment_get_type;
end;

function PANGO_TYPE_WRAP_MODE: TGType;
begin
  PANGO_TYPE_WRAP_MODE := pango_wrap_mode_get_type;
end;

function PANGO_TYPE_ELLIPSIZE_MODE: TGType;
begin
  PANGO_TYPE_ELLIPSIZE_MODE := pango_ellipsize_mode_get_type;
end;

function PANGO_TYPE_LAYOUT_SERIALIZE_FLAGS: TGType;
begin
  PANGO_TYPE_LAYOUT_SERIALIZE_FLAGS := pango_layout_serialize_flags_get_type;
end;

function PANGO_TYPE_LAYOUT_DESERIALIZE_ERROR: TGType;
begin
  PANGO_TYPE_LAYOUT_DESERIALIZE_ERROR := pango_layout_deserialize_error_get_type;
end;

function PANGO_TYPE_LAYOUT_DESERIALIZE_FLAGS: TGType;
begin
  PANGO_TYPE_LAYOUT_DESERIALIZE_FLAGS := pango_layout_deserialize_flags_get_type;
end;

function PANGO_TYPE_RENDER_PART: TGType;
begin
  PANGO_TYPE_RENDER_PART := pango_render_part_get_type;
end;

function PANGO_TYPE_SCRIPT: TGType;
begin
  PANGO_TYPE_SCRIPT := pango_script_get_type;
end;

function PANGO_TYPE_TAB_ALIGN: TGType;
begin
  PANGO_TYPE_TAB_ALIGN := pango_tab_align_get_type;
end;


{$ENDIF read_implementation}
