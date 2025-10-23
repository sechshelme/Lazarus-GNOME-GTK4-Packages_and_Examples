
{$IFDEF read_interface}


function gst_codec_utils_aac_get_sample_rate_from_index(sr_idx: Tguint): Tguint; cdecl; external libgstpbutils;
function gst_codec_utils_aac_get_index_from_sample_rate(rate: Tguint): Tgint; cdecl; external libgstpbutils;
function gst_codec_utils_aac_get_profile(audio_config: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_aac_get_level(audio_config: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_aac_get_sample_rate(audio_config: Pguint8; len: Tguint): Tguint; cdecl; external libgstpbutils;
function gst_codec_utils_aac_get_channels(audio_config: Pguint8; len: Tguint): Tguint; cdecl; external libgstpbutils;
function gst_codec_utils_aac_caps_set_level_and_profile(caps: PGstCaps; audio_config: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_h264_get_profile(sps: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_h264_get_level(sps: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_h264_get_level_idc(level: Pgchar): Tguint8; cdecl; external libgstpbutils;
function gst_codec_utils_h264_caps_set_level_and_profile(caps: PGstCaps; sps: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_h264_get_profile_flags_level(codec_data: Pguint8; len: Tguint; profile: Pguint8; flags: Pguint8; level: Pguint8): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_h265_get_profile(profile_tier_level: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_h265_get_tier(profile_tier_level: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_h265_get_level(profile_tier_level: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_h265_get_level_idc(level: Pgchar): Tguint8; cdecl; external libgstpbutils;
function gst_codec_utils_h265_caps_set_level_tier_and_profile(caps: PGstCaps; profile_tier_level: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_mpeg4video_get_profile(vis_obj_seq: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_mpeg4video_get_level(vis_obj_seq: Pguint8; len: Tguint): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_mpeg4video_caps_set_level_and_profile(caps: PGstCaps; vis_obj_seq: Pguint8; len: Tguint): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_opus_parse_caps(caps: PGstCaps; rate: Pguint32; channels: Pguint8; channel_mapping_family: Pguint8; stream_count: Pguint8;
  coupled_count: Pguint8; channel_mapping: Tguint8): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_opus_create_caps(rate: Tguint32; channels: Tguint8; channel_mapping_family: Tguint8; stream_count: Tguint8; coupled_count: Tguint8;
  channel_mapping: Pguint8): PGstCaps; cdecl; external libgstpbutils;
function gst_codec_utils_opus_create_caps_from_header(header: PGstBuffer; comments: PGstBuffer): PGstCaps; cdecl; external libgstpbutils;
function gst_codec_utils_opus_create_header(rate: Tguint32; channels: Tguint8; channel_mapping_family: Tguint8; stream_count: Tguint8; coupled_count: Tguint8;
  channel_mapping: Pguint8; pre_skip: Tguint16; output_gain: Tgint16): PGstBuffer; cdecl; external libgstpbutils;
function gst_codec_utils_opus_parse_header(header: PGstBuffer; rate: Pguint32; channels: Pguint8; channel_mapping_family: Pguint8; stream_count: Pguint8;
  coupled_count: Pguint8; channel_mapping: Tguint8; pre_skip: Pguint16; output_gain: Pgint16): Tgboolean; cdecl; external libgstpbutils;
function gst_codec_utils_caps_get_mime_codec(caps: PGstCaps): Pgchar; cdecl; external libgstpbutils;
function gst_codec_utils_caps_from_mime_codec(codecs_field: Pgchar): PGstCaps; cdecl; external libgstpbutils;

// === Konventiert am: 27-9-24 15:37:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
