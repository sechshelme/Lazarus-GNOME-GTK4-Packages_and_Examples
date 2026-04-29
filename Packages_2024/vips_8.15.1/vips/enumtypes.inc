
{$IFDEF read_function}
function vips_operation_math_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_MATH: TGType;

function vips_operation_math2_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_MATH2: TGType;

function vips_operation_round_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_ROUND: TGType;

function vips_operation_relational_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_RELATIONAL: TGType;

function vips_operation_boolean_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_BOOLEAN: TGType;

function vips_operation_complex_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_COMPLEX: TGType;

function vips_operation_complex2_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_COMPLEX2: TGType;

function vips_operation_complexget_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_COMPLEXGET: TGType;

function vips_precision_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_PRECISION: TGType;

function vips_intent_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_INTENT: TGType;

function vips_pcs_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_PCS: TGType;

function vips_extend_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_EXTEND: TGType;

function vips_compass_direction_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_COMPASS_DIRECTION: TGType;

function vips_direction_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_DIRECTION: TGType;

function vips_align_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ALIGN: TGType;

function vips_angle_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ANGLE: TGType;

function vips_angle45_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ANGLE45: TGType;

function vips_interesting_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_INTERESTING: TGType;

function vips_blend_mode_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_BLEND_MODE: TGType;

function vips_combine_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_COMBINE: TGType;

function vips_text_wrap_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_TEXT_WRAP: TGType;

function vips_combine_mode_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_COMBINE_MODE: TGType;

function vips_foreign_flags_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_FLAGS: TGType;

function vips_fail_on_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FAIL_ON: TGType;

function vips_saveable_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_SAVEABLE: TGType;

function vips_foreign_keep_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_KEEP: TGType;

function vips_foreign_subsample_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_SUBSAMPLE: TGType;

function vips_foreign_jpeg_subsample_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_JPEG_SUBSAMPLE: TGType;

function vips_foreign_webp_preset_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_WEBP_PRESET: TGType;

function vips_foreign_tiff_compression_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_TIFF_COMPRESSION: TGType;

function vips_foreign_tiff_predictor_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_TIFF_PREDICTOR: TGType;

function vips_foreign_tiff_resunit_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_TIFF_RESUNIT: TGType;

function vips_foreign_png_filter_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_PNG_FILTER: TGType;

function vips_foreign_ppm_format_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_PPM_FORMAT: TGType;

function vips_foreign_dz_layout_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_DZ_LAYOUT: TGType;

function vips_foreign_dz_depth_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_DZ_DEPTH: TGType;

function vips_foreign_dz_container_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_DZ_CONTAINER: TGType;

function vips_foreign_heif_compression_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_HEIF_COMPRESSION: TGType;

function vips_foreign_heif_encoder_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_FOREIGN_HEIF_ENCODER: TGType;

function vips_demand_style_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_DEMAND_STYLE: TGType;

function vips_image_type_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_IMAGE_TYPE: TGType;

function vips_interpretation_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_INTERPRETATION: TGType;

function vips_band_format_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_BAND_FORMAT: TGType;

function vips_coding_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_CODING: TGType;

function vips_access_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ACCESS: TGType;

function vips_operation_morphology_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_MORPHOLOGY: TGType;

function vips_argument_flags_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_ARGUMENT_FLAGS: TGType;

function vips_operation_flags_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_OPERATION_FLAGS: TGType;

function vips_region_shrink_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_REGION_SHRINK: TGType;

function vips_kernel_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_KERNEL: TGType;

function vips_size_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_SIZE: TGType;

function vips_token_get_type: TGType; cdecl; external libvips;
function VIPS_TYPE_TOKEN: TGType;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:14:07 ===



{$IFDEF read_implementation}


function VIPS_TYPE_OPERATION_MATH: TGType;
begin
  VIPS_TYPE_OPERATION_MATH := vips_operation_math_get_type;
end;

function VIPS_TYPE_OPERATION_MATH2: TGType;
begin
  VIPS_TYPE_OPERATION_MATH2 := vips_operation_math2_get_type;
end;

function VIPS_TYPE_OPERATION_ROUND: TGType;
begin
  VIPS_TYPE_OPERATION_ROUND := vips_operation_round_get_type;
end;

function VIPS_TYPE_OPERATION_RELATIONAL: TGType;
begin
  VIPS_TYPE_OPERATION_RELATIONAL := vips_operation_relational_get_type;
end;

function VIPS_TYPE_OPERATION_BOOLEAN: TGType;
begin
  VIPS_TYPE_OPERATION_BOOLEAN := vips_operation_boolean_get_type;
end;

function VIPS_TYPE_OPERATION_COMPLEX: TGType;
begin
  VIPS_TYPE_OPERATION_COMPLEX := vips_operation_complex_get_type;
end;

function VIPS_TYPE_OPERATION_COMPLEX2: TGType;
begin
  VIPS_TYPE_OPERATION_COMPLEX2 := vips_operation_complex2_get_type;
end;

function VIPS_TYPE_OPERATION_COMPLEXGET: TGType;
begin
  VIPS_TYPE_OPERATION_COMPLEXGET := vips_operation_complexget_get_type;
end;

function VIPS_TYPE_PRECISION: TGType;
begin
  VIPS_TYPE_PRECISION := vips_precision_get_type;
end;

function VIPS_TYPE_INTENT: TGType;
begin
  VIPS_TYPE_INTENT := vips_intent_get_type;
end;

function VIPS_TYPE_PCS: TGType;
begin
  VIPS_TYPE_PCS := vips_pcs_get_type;
end;

function VIPS_TYPE_EXTEND: TGType;
begin
  VIPS_TYPE_EXTEND := vips_extend_get_type;
end;

function VIPS_TYPE_COMPASS_DIRECTION: TGType;
begin
  VIPS_TYPE_COMPASS_DIRECTION := vips_compass_direction_get_type;
end;

function VIPS_TYPE_DIRECTION: TGType;
begin
  VIPS_TYPE_DIRECTION := vips_direction_get_type;
end;

function VIPS_TYPE_ALIGN: TGType;
begin
  VIPS_TYPE_ALIGN := vips_align_get_type;
end;

function VIPS_TYPE_ANGLE: TGType;
begin
  VIPS_TYPE_ANGLE := vips_angle_get_type;
end;

function VIPS_TYPE_ANGLE45: TGType;
begin
  VIPS_TYPE_ANGLE45 := vips_angle45_get_type;
end;

function VIPS_TYPE_INTERESTING: TGType;
begin
  VIPS_TYPE_INTERESTING := vips_interesting_get_type;
end;

function VIPS_TYPE_BLEND_MODE: TGType;
begin
  VIPS_TYPE_BLEND_MODE := vips_blend_mode_get_type;
end;

function VIPS_TYPE_COMBINE: TGType;
begin
  VIPS_TYPE_COMBINE := vips_combine_get_type;
end;

function VIPS_TYPE_TEXT_WRAP: TGType;
begin
  VIPS_TYPE_TEXT_WRAP := vips_text_wrap_get_type;
end;

function VIPS_TYPE_COMBINE_MODE: TGType;
begin
  VIPS_TYPE_COMBINE_MODE := vips_combine_mode_get_type;
end;

function VIPS_TYPE_FOREIGN_FLAGS: TGType;
begin
  VIPS_TYPE_FOREIGN_FLAGS := vips_foreign_flags_get_type;
end;

function VIPS_TYPE_FAIL_ON: TGType;
begin
  VIPS_TYPE_FAIL_ON := vips_fail_on_get_type;
end;

function VIPS_TYPE_SAVEABLE: TGType;
begin
  VIPS_TYPE_SAVEABLE := vips_saveable_get_type;
end;

function VIPS_TYPE_FOREIGN_KEEP: TGType;
begin
  VIPS_TYPE_FOREIGN_KEEP := vips_foreign_keep_get_type;
end;

function VIPS_TYPE_FOREIGN_SUBSAMPLE: TGType;
begin
  VIPS_TYPE_FOREIGN_SUBSAMPLE := vips_foreign_subsample_get_type;
end;

function VIPS_TYPE_FOREIGN_JPEG_SUBSAMPLE: TGType;
begin
  VIPS_TYPE_FOREIGN_JPEG_SUBSAMPLE := vips_foreign_jpeg_subsample_get_type;
end;

function VIPS_TYPE_FOREIGN_WEBP_PRESET: TGType;
begin
  VIPS_TYPE_FOREIGN_WEBP_PRESET := vips_foreign_webp_preset_get_type;
end;

function VIPS_TYPE_FOREIGN_TIFF_COMPRESSION: TGType;
begin
  VIPS_TYPE_FOREIGN_TIFF_COMPRESSION := vips_foreign_tiff_compression_get_type;
end;

function VIPS_TYPE_FOREIGN_TIFF_PREDICTOR: TGType;
begin
  VIPS_TYPE_FOREIGN_TIFF_PREDICTOR := vips_foreign_tiff_predictor_get_type;
end;

function VIPS_TYPE_FOREIGN_TIFF_RESUNIT: TGType;
begin
  VIPS_TYPE_FOREIGN_TIFF_RESUNIT := vips_foreign_tiff_resunit_get_type;
end;

function VIPS_TYPE_FOREIGN_PNG_FILTER: TGType;
begin
  VIPS_TYPE_FOREIGN_PNG_FILTER := vips_foreign_png_filter_get_type;
end;

function VIPS_TYPE_FOREIGN_PPM_FORMAT: TGType;
begin
  VIPS_TYPE_FOREIGN_PPM_FORMAT := vips_foreign_ppm_format_get_type;
end;

function VIPS_TYPE_FOREIGN_DZ_LAYOUT: TGType;
begin
  VIPS_TYPE_FOREIGN_DZ_LAYOUT := vips_foreign_dz_layout_get_type;
end;

function VIPS_TYPE_FOREIGN_DZ_DEPTH: TGType;
begin
  VIPS_TYPE_FOREIGN_DZ_DEPTH := vips_foreign_dz_depth_get_type;
end;

function VIPS_TYPE_FOREIGN_DZ_CONTAINER: TGType;
begin
  VIPS_TYPE_FOREIGN_DZ_CONTAINER := vips_foreign_dz_container_get_type;
end;

function VIPS_TYPE_FOREIGN_HEIF_COMPRESSION: TGType;
begin
  VIPS_TYPE_FOREIGN_HEIF_COMPRESSION := vips_foreign_heif_compression_get_type;
end;

function VIPS_TYPE_FOREIGN_HEIF_ENCODER: TGType;
begin
  VIPS_TYPE_FOREIGN_HEIF_ENCODER := vips_foreign_heif_encoder_get_type;
end;

function VIPS_TYPE_DEMAND_STYLE: TGType;
begin
  VIPS_TYPE_DEMAND_STYLE := vips_demand_style_get_type;
end;

function VIPS_TYPE_IMAGE_TYPE: TGType;
begin
  VIPS_TYPE_IMAGE_TYPE := vips_image_type_get_type;
end;

function VIPS_TYPE_INTERPRETATION: TGType;
begin
  VIPS_TYPE_INTERPRETATION := vips_interpretation_get_type;
end;

function VIPS_TYPE_BAND_FORMAT: TGType;
begin
  VIPS_TYPE_BAND_FORMAT := vips_band_format_get_type;
end;

function VIPS_TYPE_CODING: TGType;
begin
  VIPS_TYPE_CODING := vips_coding_get_type;
end;

function VIPS_TYPE_ACCESS: TGType;
begin
  VIPS_TYPE_ACCESS := vips_access_get_type;
end;

function VIPS_TYPE_OPERATION_MORPHOLOGY: TGType;
begin
  VIPS_TYPE_OPERATION_MORPHOLOGY := vips_operation_morphology_get_type;
end;

function VIPS_TYPE_ARGUMENT_FLAGS: TGType;
begin
  VIPS_TYPE_ARGUMENT_FLAGS := vips_argument_flags_get_type;
end;

function VIPS_TYPE_OPERATION_FLAGS: TGType;
begin
  VIPS_TYPE_OPERATION_FLAGS := vips_operation_flags_get_type;
end;

function VIPS_TYPE_REGION_SHRINK: TGType;
begin
  VIPS_TYPE_REGION_SHRINK := vips_region_shrink_get_type;
end;

function VIPS_TYPE_KERNEL: TGType;
begin
  VIPS_TYPE_KERNEL := vips_kernel_get_type;
end;

function VIPS_TYPE_SIZE: TGType;
begin
  VIPS_TYPE_SIZE := vips_size_get_type;
end;

function VIPS_TYPE_TOKEN: TGType;
begin
  VIPS_TYPE_TOKEN := vips_token_get_type;
end;


{$ENDIF read_implementation}
