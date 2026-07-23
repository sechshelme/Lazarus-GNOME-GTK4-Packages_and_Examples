{$IFDEF read_interface}


procedure gst_wl_videoformat_init_once; cdecl; external libgstwayland;
function gst_video_format_to_wl_shm_format(format: TGstVideoFormat): Twl_shm_format; cdecl; external libgstwayland;
function gst_video_format_to_wl_dmabuf_format(format: TGstVideoFormat): Tguint32; cdecl; external libgstwayland;
function gst_wl_shm_format_to_video_format(wl_format: Twl_shm_format): TGstVideoFormat; cdecl; external libgstwayland;
function gst_wl_dmabuf_format_to_video_format(wl_format: Tguint): TGstVideoFormat; cdecl; external libgstwayland;
function gst_wl_shm_format_to_string(wl_format: Twl_shm_format): Pgchar; cdecl; external libgstwayland;

// === Konventiert am: 23-7-26 19:12:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
