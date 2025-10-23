
{$IFDEF read_interface}

const
  GST_WL_VIDEO_FORMATS = '{ AYUV, RGBA, ARGB, BGRA, ABGR, P010_10LE, v308, RGBx, xRGB, BGRx, xBGR, RGB, BGR, Y42B, NV16, NV61, YUY2, YVYU, UYVY, I420, YV12, NV12, NV21, Y41B, YUV9, YVU9, BGR16, RGB16 }';

procedure gst_wl_videoformat_init_once; cdecl; external libgstwayland;
function gst_video_format_to_wl_shm_format(format: TGstVideoFormat): Twl_shm_format; cdecl; external libgstwayland;
function gst_video_format_to_wl_dmabuf_format(format: TGstVideoFormat): Tguint32; cdecl; external libgstwayland;
function gst_wl_shm_format_to_video_format(wl_format: Twl_shm_format): TGstVideoFormat; cdecl; external libgstwayland;
function gst_wl_dmabuf_format_to_video_format(wl_format: Tguint): TGstVideoFormat; cdecl; external libgstwayland;
function gst_wl_shm_format_to_string(wl_format: Twl_shm_format): Pgchar; cdecl; external libgstwayland;
function gst_wl_dmabuf_format_to_string(wl_format: Tguint; modifier: Tguint64): Pgchar; cdecl; external libgstwayland;

// === Konventiert am: 8-10-24 14:16:15 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
