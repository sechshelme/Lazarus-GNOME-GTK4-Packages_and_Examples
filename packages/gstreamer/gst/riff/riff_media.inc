
{$IFDEF read_interface}

function gst_riff_create_video_caps(codec_fcc: Tguint32; strh: Pgst_riff_strh; strf: Pgst_riff_strf_vids; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPansichar): PGstCaps; cdecl; external libgstriff;
function gst_riff_create_audio_caps(codec_id: Tguint16; strh: Pgst_riff_strh; strf: Pgst_riff_strf_auds; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPansichar; channel_reorder_map: Tgintarr18): PGstCaps; cdecl; external libgstriff;
function gst_riff_create_iavs_caps(codec_fcc: Tguint32; strh: Pgst_riff_strh; strf: Pgst_riff_strf_iavs; strf_data: PGstBuffer; strd_data: PGstBuffer;
  codec_name: PPansichar): PGstCaps; cdecl; external libgstriff;
function gst_riff_create_video_template_caps: PGstCaps; cdecl; external libgstriff;
function gst_riff_create_audio_template_caps: PGstCaps; cdecl; external libgstriff;
function gst_riff_create_iavs_template_caps: PGstCaps; cdecl; external libgstriff;

// === Konventiert am: 12-10-24 15:21:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
