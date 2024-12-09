
{$IFDEF read_interface}

function gst_opencv_parse_cv_mat_params_from_caps(caps: PGstCaps; Width: Pgint; Height: Pgint; cv_type: Plongint; err: PPGError): Tgboolean; cdecl; external libgstopencv;
function gst_opencv_cv_mat_params_from_video_info(info: PGstVideoInfo; Width: Pgint; Height: Pgint; cv_type: Plongint; err: PPGError): Tgboolean; cdecl; external libgstopencv;
function gst_opencv_cv_image_type_from_video_format(format: TGstVideoFormat; cv_type: Plongint; err: PPGError): Tgboolean; cdecl; external libgstopencv;
function gst_opencv_caps_from_cv_image_type(cv_type: longint): PGstCaps; cdecl; external libgstopencv;

// === Konventiert am: 13-10-24 13:17:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
