{$IFDEF read_interface}


function gst_analytics_image_util_iou_int(bb1_x: Tgint; bb1_y: Tgint; bb1_w: Tgint; bb1_h: Tgint; bb2_x: Tgint;
  bb2_y: Tgint; bb2_w: Tgint; bb2_h: Tgint): Tgfloat; cdecl; external libgstanalytics;
function gst_analytics_image_util_iou_float(bb1_x: Tgfloat; bb1_y: Tgfloat; bb1_w: Tgfloat; bb1_h: Tgfloat; bb2_x: Tgfloat;
  bb2_y: Tgfloat; bb2_w: Tgfloat; bb2_h: Tgfloat): Tgfloat; cdecl; external libgstanalytics;

// === Konventiert am: 22-7-26 19:37:18 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
