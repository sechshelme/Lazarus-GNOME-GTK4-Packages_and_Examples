{$IFDEF read_interface}



function gst_riff_create_video_caps(codec_fcc: Tguint32; strh: Pgst_riff_strh; strf: Pgst_riff_strf_vids; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPchar): PGstCaps; cdecl; external libgstriff;
function gst_riff_create_audio_caps(codec_id: Tguint16; strh: Pgst_riff_strh; strf: Pgst_riff_strf_auds; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPchar; channel_reorder_map: Pgint): PGstCaps; cdecl; external libgstriff;
function gst_riff_create_iavs_caps(codec_fcc: Tguint32; strh: Pgst_riff_strh; strf: Pgst_riff_strf_iavs; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPchar): PGstCaps; cdecl; external libgstriff;

function gst_riff_create_video_template_caps: PGstCaps; cdecl; external libgstriff;
function gst_riff_create_audio_template_caps: PGstCaps; cdecl; external libgstriff;
function gst_riff_create_iavs_template_caps: PGstCaps; cdecl; external libgstriff;

// === Konventiert am: 27-7-26 13:25:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
