
{$IFDEF read_interface}


function gst_color_balance_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_COLOR_BALANCE_TYPE: TGType;

function gst_video_decoder_request_sync_point_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_DECODER_REQUEST_SYNC_POINT_FLAGS: TGType;

function gst_video_gl_texture_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_GL_TEXTURE_TYPE: TGType;

function gst_video_gl_texture_orientation_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_GL_TEXTURE_ORIENTATION: TGType;

function gst_video_time_code_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_TIME_CODE_FLAGS: TGType;

function gst_video_codec_frame_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CODEC_FRAME_FLAGS: TGType;

function gst_navigation_modifier_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_NAVIGATION_MODIFIER_TYPE: TGType;

function gst_navigation_command_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_NAVIGATION_COMMAND: TGType;

function gst_navigation_query_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_NAVIGATION_QUERY_TYPE: TGType;

function gst_navigation_message_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_NAVIGATION_MESSAGE_TYPE: TGType;

function gst_navigation_event_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_NAVIGATION_EVENT_TYPE: TGType;

function gst_video_ancillary_did_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_ANCILLARY_DID: TGType;

function gst_video_ancillary_di_d16_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_ANCILLARY_DI_D16: TGType;

function gst_ancillary_meta_field_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_ANCILLARY_META_FIELD: TGType;

function gst_video_afd_value_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_AFD_VALUE: TGType;

function gst_video_afd_spec_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_AFD_SPEC: TGType;

function gst_video_caption_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CAPTION_TYPE: TGType;

function gst_video_vbi_parser_result_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_VBI_PARSER_RESULT: TGType;

function gst_video_chroma_site_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CHROMA_SITE: TGType;

function gst_video_chroma_method_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CHROMA_METHOD: TGType;

function gst_video_chroma_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CHROMA_FLAGS: TGType;

function gst_video_color_range_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_COLOR_RANGE: TGType;

function gst_video_color_matrix_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_COLOR_MATRIX: TGType;

function gst_video_transfer_function_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_TRANSFER_FUNCTION: TGType;

function gst_video_color_primaries_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_COLOR_PRIMARIES: TGType;

function gst_video_alpha_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_ALPHA_MODE: TGType;

function gst_video_chroma_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_CHROMA_MODE: TGType;

function gst_video_matrix_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_MATRIX_MODE: TGType;

function gst_video_gamma_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_GAMMA_MODE: TGType;

function gst_video_primaries_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_PRIMARIES_MODE: TGType;

function gst_video_dither_method_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_DITHER_METHOD: TGType;

function gst_video_dither_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_DITHER_FLAGS: TGType;

function gst_video_format_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FORMAT: TGType;

function gst_video_format_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FORMAT_FLAGS: TGType;

function gst_video_pack_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_PACK_FLAGS: TGType;

function gst_video_frame_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FRAME_FLAGS: TGType;

function gst_video_buffer_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_BUFFER_FLAGS: TGType;

function gst_video_frame_map_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FRAME_MAP_FLAGS: TGType;

function gst_video_interlace_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_INTERLACE_MODE: TGType;

function gst_video_multiview_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_MULTIVIEW_MODE: TGType;

function gst_video_multiview_frame_packing_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_MULTIVIEW_FRAME_PACKING: TGType;

function gst_video_multiview_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_MULTIVIEW_FLAGS: TGType;

function gst_video_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FLAGS: TGType;

function gst_video_field_order_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_FIELD_ORDER: TGType;

function gst_video_overlay_format_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_OVERLAY_FORMAT_FLAGS: TGType;

function gst_video_resampler_method_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_RESAMPLER_METHOD: TGType;

function gst_video_resampler_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_RESAMPLER_FLAGS: TGType;

function gst_video_scaler_flags_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_SCALER_FLAGS: TGType;

function gst_video_tile_type_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_TILE_TYPE: TGType;

function gst_video_tile_mode_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_TILE_MODE: TGType;

function gst_video_orientation_method_get_type: TGType; cdecl; external libgstvideo;
function GST_TYPE_VIDEO_ORIENTATION_METHOD: TGType;


// === Konventiert am: 30-9-24 17:31:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_COLOR_BALANCE_TYPE: TGType;
begin
  GST_TYPE_COLOR_BALANCE_TYPE := gst_color_balance_type_get_type;
end;

function GST_TYPE_VIDEO_DECODER_REQUEST_SYNC_POINT_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_DECODER_REQUEST_SYNC_POINT_FLAGS := gst_video_decoder_request_sync_point_flags_get_type;
end;

function GST_TYPE_VIDEO_GL_TEXTURE_TYPE: TGType;
begin
  GST_TYPE_VIDEO_GL_TEXTURE_TYPE := gst_video_gl_texture_type_get_type;
end;

function GST_TYPE_VIDEO_GL_TEXTURE_ORIENTATION: TGType;
begin
  GST_TYPE_VIDEO_GL_TEXTURE_ORIENTATION := gst_video_gl_texture_orientation_get_type;
end;

function GST_TYPE_VIDEO_TIME_CODE_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_TIME_CODE_FLAGS := gst_video_time_code_flags_get_type;
end;

function GST_TYPE_VIDEO_CODEC_FRAME_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_CODEC_FRAME_FLAGS := gst_video_codec_frame_flags_get_type;
end;

function GST_TYPE_NAVIGATION_MODIFIER_TYPE: TGType;
begin
  GST_TYPE_NAVIGATION_MODIFIER_TYPE := gst_navigation_modifier_type_get_type;
end;

function GST_TYPE_NAVIGATION_COMMAND: TGType;
begin
  GST_TYPE_NAVIGATION_COMMAND := gst_navigation_command_get_type;
end;

function GST_TYPE_NAVIGATION_QUERY_TYPE: TGType;
begin
  GST_TYPE_NAVIGATION_QUERY_TYPE := gst_navigation_query_type_get_type;
end;

function GST_TYPE_NAVIGATION_MESSAGE_TYPE: TGType;
begin
  GST_TYPE_NAVIGATION_MESSAGE_TYPE := gst_navigation_message_type_get_type;
end;

function GST_TYPE_NAVIGATION_EVENT_TYPE: TGType;
begin
  GST_TYPE_NAVIGATION_EVENT_TYPE := gst_navigation_event_type_get_type;
end;

function GST_TYPE_VIDEO_ANCILLARY_DID: TGType;
begin
  GST_TYPE_VIDEO_ANCILLARY_DID := gst_video_ancillary_did_get_type;
end;

function GST_TYPE_VIDEO_ANCILLARY_DI_D16: TGType;
begin
  GST_TYPE_VIDEO_ANCILLARY_DI_D16 := gst_video_ancillary_di_d16_get_type;
end;

function GST_TYPE_ANCILLARY_META_FIELD: TGType;
begin
  GST_TYPE_ANCILLARY_META_FIELD := gst_ancillary_meta_field_get_type;
end;

function GST_TYPE_VIDEO_AFD_VALUE: TGType;
begin
  GST_TYPE_VIDEO_AFD_VALUE := gst_video_afd_value_get_type;
end;

function GST_TYPE_VIDEO_AFD_SPEC: TGType;
begin
  GST_TYPE_VIDEO_AFD_SPEC := gst_video_afd_spec_get_type;
end;

function GST_TYPE_VIDEO_CAPTION_TYPE: TGType;
begin
  GST_TYPE_VIDEO_CAPTION_TYPE := gst_video_caption_type_get_type;
end;

function GST_TYPE_VIDEO_VBI_PARSER_RESULT: TGType;
begin
  GST_TYPE_VIDEO_VBI_PARSER_RESULT := gst_video_vbi_parser_result_get_type;
end;

function GST_TYPE_VIDEO_CHROMA_SITE: TGType;
begin
  GST_TYPE_VIDEO_CHROMA_SITE := gst_video_chroma_site_get_type;
end;

function GST_TYPE_VIDEO_CHROMA_METHOD: TGType;
begin
  GST_TYPE_VIDEO_CHROMA_METHOD := gst_video_chroma_method_get_type;
end;

function GST_TYPE_VIDEO_CHROMA_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_CHROMA_FLAGS := gst_video_chroma_flags_get_type;
end;

function GST_TYPE_VIDEO_COLOR_RANGE: TGType;
begin
  GST_TYPE_VIDEO_COLOR_RANGE := gst_video_color_range_get_type;
end;

function GST_TYPE_VIDEO_COLOR_MATRIX: TGType;
begin
  GST_TYPE_VIDEO_COLOR_MATRIX := gst_video_color_matrix_get_type;
end;

function GST_TYPE_VIDEO_TRANSFER_FUNCTION: TGType;
begin
  GST_TYPE_VIDEO_TRANSFER_FUNCTION := gst_video_transfer_function_get_type;
end;

function GST_TYPE_VIDEO_COLOR_PRIMARIES: TGType;
begin
  GST_TYPE_VIDEO_COLOR_PRIMARIES := gst_video_color_primaries_get_type;
end;

function GST_TYPE_VIDEO_ALPHA_MODE: TGType;
begin
  GST_TYPE_VIDEO_ALPHA_MODE := gst_video_alpha_mode_get_type;
end;

function GST_TYPE_VIDEO_CHROMA_MODE: TGType;
begin
  GST_TYPE_VIDEO_CHROMA_MODE := gst_video_chroma_mode_get_type;
end;

function GST_TYPE_VIDEO_MATRIX_MODE: TGType;
begin
  GST_TYPE_VIDEO_MATRIX_MODE := gst_video_matrix_mode_get_type;
end;

function GST_TYPE_VIDEO_GAMMA_MODE: TGType;
begin
  GST_TYPE_VIDEO_GAMMA_MODE := gst_video_gamma_mode_get_type;
end;

function GST_TYPE_VIDEO_PRIMARIES_MODE: TGType;
begin
  GST_TYPE_VIDEO_PRIMARIES_MODE := gst_video_primaries_mode_get_type;
end;

function GST_TYPE_VIDEO_DITHER_METHOD: TGType;
begin
  GST_TYPE_VIDEO_DITHER_METHOD := gst_video_dither_method_get_type;
end;

function GST_TYPE_VIDEO_DITHER_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_DITHER_FLAGS := gst_video_dither_flags_get_type;
end;

function GST_TYPE_VIDEO_FORMAT: TGType;
begin
  GST_TYPE_VIDEO_FORMAT := gst_video_format_get_type;
end;

function GST_TYPE_VIDEO_FORMAT_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_FORMAT_FLAGS := gst_video_format_flags_get_type;
end;

function GST_TYPE_VIDEO_PACK_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_PACK_FLAGS := gst_video_pack_flags_get_type;
end;

function GST_TYPE_VIDEO_FRAME_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_FRAME_FLAGS := gst_video_frame_flags_get_type;
end;

function GST_TYPE_VIDEO_BUFFER_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_BUFFER_FLAGS := gst_video_buffer_flags_get_type;
end;

function GST_TYPE_VIDEO_FRAME_MAP_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_FRAME_MAP_FLAGS := gst_video_frame_map_flags_get_type;
end;

function GST_TYPE_VIDEO_INTERLACE_MODE: TGType;
begin
  GST_TYPE_VIDEO_INTERLACE_MODE := gst_video_interlace_mode_get_type;
end;

function GST_TYPE_VIDEO_MULTIVIEW_MODE: TGType;
begin
  GST_TYPE_VIDEO_MULTIVIEW_MODE := gst_video_multiview_mode_get_type;
end;

function GST_TYPE_VIDEO_MULTIVIEW_FRAME_PACKING: TGType;
begin
  GST_TYPE_VIDEO_MULTIVIEW_FRAME_PACKING := gst_video_multiview_frame_packing_get_type;
end;

function GST_TYPE_VIDEO_MULTIVIEW_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_MULTIVIEW_FLAGS := gst_video_multiview_flags_get_type;
end;

function GST_TYPE_VIDEO_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_FLAGS := gst_video_flags_get_type;
end;

function GST_TYPE_VIDEO_FIELD_ORDER: TGType;
begin
  GST_TYPE_VIDEO_FIELD_ORDER := gst_video_field_order_get_type;
end;

function GST_TYPE_VIDEO_OVERLAY_FORMAT_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_OVERLAY_FORMAT_FLAGS := gst_video_overlay_format_flags_get_type;
end;

function GST_TYPE_VIDEO_RESAMPLER_METHOD: TGType;
begin
  GST_TYPE_VIDEO_RESAMPLER_METHOD := gst_video_resampler_method_get_type;
end;

function GST_TYPE_VIDEO_RESAMPLER_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_RESAMPLER_FLAGS := gst_video_resampler_flags_get_type;
end;

function GST_TYPE_VIDEO_SCALER_FLAGS: TGType;
begin
  GST_TYPE_VIDEO_SCALER_FLAGS := gst_video_scaler_flags_get_type;
end;

function GST_TYPE_VIDEO_TILE_TYPE: TGType;
begin
  GST_TYPE_VIDEO_TILE_TYPE := gst_video_tile_type_get_type;
end;

function GST_TYPE_VIDEO_TILE_MODE: TGType;
begin
  GST_TYPE_VIDEO_TILE_MODE := gst_video_tile_mode_get_type;
end;

function GST_TYPE_VIDEO_ORIENTATION_METHOD: TGType;
begin
  GST_TYPE_VIDEO_ORIENTATION_METHOD := gst_video_orientation_method_get_type;
end;


{$ENDIF read_implementation}
