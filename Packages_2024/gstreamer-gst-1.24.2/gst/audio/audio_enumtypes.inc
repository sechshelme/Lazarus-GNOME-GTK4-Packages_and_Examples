
{$IFDEF read_interface}


function gst_audio_channel_mixer_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_CHANNEL_MIXER_FLAGS: TGType;

function gst_audio_channel_position_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_CHANNEL_POSITION: TGType;

function gst_audio_converter_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_CONVERTER_FLAGS: TGType;

function gst_audio_format_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_FORMAT: TGType;

function gst_audio_format_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_FORMAT_FLAGS: TGType;

function gst_audio_pack_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_PACK_FLAGS: TGType;

function gst_audio_layout_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_LAYOUT: TGType;

function gst_audio_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_FLAGS: TGType;

function gst_audio_dither_method_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_DITHER_METHOD: TGType;

function gst_audio_noise_shaping_method_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_NOISE_SHAPING_METHOD: TGType;

function gst_audio_quantize_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_QUANTIZE_FLAGS: TGType;

function gst_audio_resampler_filter_mode_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RESAMPLER_FILTER_MODE: TGType;

function gst_audio_resampler_filter_interpolation_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RESAMPLER_FILTER_INTERPOLATION: TGType;

function gst_audio_resampler_method_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RESAMPLER_METHOD: TGType;

function gst_audio_resampler_flags_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RESAMPLER_FLAGS: TGType;

function gst_audio_base_sink_slave_method_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_BASE_SINK_SLAVE_METHOD: TGType;

function gst_audio_base_sink_discont_reason_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_BASE_SINK_DISCONT_REASON: TGType;

function gst_audio_base_src_slave_method_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_BASE_SRC_SLAVE_METHOD: TGType;

function gst_audio_cd_src_mode_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_CD_SRC_MODE: TGType;

function gst_audio_ring_buffer_state_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RING_BUFFER_STATE: TGType;

function gst_audio_ring_buffer_format_type_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_AUDIO_RING_BUFFER_FORMAT_TYPE: TGType;

function gst_dsd_format_get_type: TGType; cdecl; external libgstaudio;
function GST_TYPE_DSD_FORMAT: TGType;

// === Konventiert am: 28-9-24 19:33:01 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_AUDIO_CHANNEL_MIXER_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_CHANNEL_MIXER_FLAGS := gst_audio_channel_mixer_flags_get_type;
end;

function GST_TYPE_AUDIO_CHANNEL_POSITION: TGType;
begin
  GST_TYPE_AUDIO_CHANNEL_POSITION := gst_audio_channel_position_get_type;
end;

function GST_TYPE_AUDIO_CONVERTER_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_CONVERTER_FLAGS := gst_audio_converter_flags_get_type;
end;

function GST_TYPE_AUDIO_FORMAT: TGType;
begin
  GST_TYPE_AUDIO_FORMAT := gst_audio_format_get_type;
end;

function GST_TYPE_AUDIO_FORMAT_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_FORMAT_FLAGS := gst_audio_format_flags_get_type;
end;

function GST_TYPE_AUDIO_PACK_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_PACK_FLAGS := gst_audio_pack_flags_get_type;
end;

function GST_TYPE_AUDIO_LAYOUT: TGType;
begin
  GST_TYPE_AUDIO_LAYOUT := gst_audio_layout_get_type;
end;

function GST_TYPE_AUDIO_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_FLAGS := gst_audio_flags_get_type;
end;

function GST_TYPE_AUDIO_DITHER_METHOD: TGType;
begin
  GST_TYPE_AUDIO_DITHER_METHOD := gst_audio_dither_method_get_type;
end;

function GST_TYPE_AUDIO_NOISE_SHAPING_METHOD: TGType;
begin
  GST_TYPE_AUDIO_NOISE_SHAPING_METHOD := gst_audio_noise_shaping_method_get_type;
end;

function GST_TYPE_AUDIO_QUANTIZE_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_QUANTIZE_FLAGS := gst_audio_quantize_flags_get_type;
end;

function GST_TYPE_AUDIO_RESAMPLER_FILTER_MODE: TGType;
begin
  GST_TYPE_AUDIO_RESAMPLER_FILTER_MODE := gst_audio_resampler_filter_mode_get_type;
end;

function GST_TYPE_AUDIO_RESAMPLER_FILTER_INTERPOLATION: TGType;
begin
  GST_TYPE_AUDIO_RESAMPLER_FILTER_INTERPOLATION := gst_audio_resampler_filter_interpolation_get_type;
end;

function GST_TYPE_AUDIO_RESAMPLER_METHOD: TGType;
begin
  GST_TYPE_AUDIO_RESAMPLER_METHOD := gst_audio_resampler_method_get_type;
end;

function GST_TYPE_AUDIO_RESAMPLER_FLAGS: TGType;
begin
  GST_TYPE_AUDIO_RESAMPLER_FLAGS := gst_audio_resampler_flags_get_type;
end;

function GST_TYPE_AUDIO_BASE_SINK_SLAVE_METHOD: TGType;
begin
  GST_TYPE_AUDIO_BASE_SINK_SLAVE_METHOD := gst_audio_base_sink_slave_method_get_type;
end;

function GST_TYPE_AUDIO_BASE_SINK_DISCONT_REASON: TGType;
begin
  GST_TYPE_AUDIO_BASE_SINK_DISCONT_REASON := gst_audio_base_sink_discont_reason_get_type;
end;

function GST_TYPE_AUDIO_BASE_SRC_SLAVE_METHOD: TGType;
begin
  GST_TYPE_AUDIO_BASE_SRC_SLAVE_METHOD := gst_audio_base_src_slave_method_get_type;
end;

function GST_TYPE_AUDIO_CD_SRC_MODE: TGType;
begin
  GST_TYPE_AUDIO_CD_SRC_MODE := gst_audio_cd_src_mode_get_type;
end;

function GST_TYPE_AUDIO_RING_BUFFER_STATE: TGType;
begin
  GST_TYPE_AUDIO_RING_BUFFER_STATE := gst_audio_ring_buffer_state_get_type;
end;

function GST_TYPE_AUDIO_RING_BUFFER_FORMAT_TYPE: TGType;
begin
  GST_TYPE_AUDIO_RING_BUFFER_FORMAT_TYPE := gst_audio_ring_buffer_format_type_get_type;
end;

function GST_TYPE_DSD_FORMAT: TGType;
begin
  GST_TYPE_DSD_FORMAT := gst_dsd_format_get_type;
end;


{$ENDIF read_implementation}
