{$IFDEF read_interface}


type
  PGstOpencvVideoFilter = ^TGstOpencvVideoFilter;

  TGstOpencvVideoFilterTransformIPFunc = function(transform: PGstOpencvVideoFilter; buffer: PGstBuffer; img: pointer): TGstFlowReturn; cdecl;
  TGstOpencvVideoFilterTransformFunc = function(transform: PGstOpencvVideoFilter; buffer: PGstBuffer; img: pointer; outbuf: PGstBuffer; outimg: pointer): TGstFlowReturn; cdecl;

  TGstOpencvVideoFilterSetCaps = function(transform: PGstOpencvVideoFilter; in_width: Tgint; in_height: Tgint; in_cv_type: longint; out_width: Tgint; out_height: Tgint; out_cv_type: longint): Tgboolean; cdecl;
  TGstOpencvVideoFilter = record
    trans: TGstVideoFilter;
    in_place: Tgboolean;
    cvImage: pointer;
    out_cvImage: pointer;
  end;

  PGstOpencvVideoFilterClass = ^TGstOpencvVideoFilterClass;
  TGstOpencvVideoFilterClass = record
    parent_class: TGstVideoFilterClass;
    cv_trans_func: TGstOpencvVideoFilterTransformFunc;
    cv_trans_ip_func: TGstOpencvVideoFilterTransformIPFunc;
    cv_set_caps: TGstOpencvVideoFilterSetCaps;
  end;

function gst_opencv_video_filter_get_type: TGType; cdecl; external libgstopencv;
procedure gst_opencv_video_filter_set_in_place(transform: PGstOpencvVideoFilter; ip: Tgboolean); cdecl; external libgstopencv;

// === Konventiert am: 27-7-26 13:22:44 ===

function GST_TYPE_OPENCV_VIDEO_FILTER : TGType;
function GST_OPENCV_VIDEO_FILTER(obj : Pointer) : PGstOpencvVideoFilter;
function GST_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : PGstOpencvVideoFilterClass;
function GST_IS_OPENCV_VIDEO_FILTER(obj : Pointer) : Tgboolean;
function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : Pointer) : PGstOpencvVideoFilterClass;
function GST_OPENCV_VIDEO_FILTER_CAST(obj : Pointer) : PGstOpencvVideoFilter;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_OPENCV_VIDEO_FILTER: TGType;
begin
  GST_TYPE_OPENCV_VIDEO_FILTER := gst_opencv_video_filter_get_type;
end;

function GST_OPENCV_VIDEO_FILTER(obj: Pointer): PGstOpencvVideoFilter;
begin
  Result := PGstOpencvVideoFilter(g_type_check_instance_cast(obj, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_OPENCV_VIDEO_FILTER_CLASS(klass: Pointer): PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(g_type_check_class_cast(klass, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_IS_OPENCV_VIDEO_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(PGTypeInstance(obj)^.g_class);
end;

function GST_OPENCV_VIDEO_FILTER_CAST(obj: Pointer): PGstOpencvVideoFilter;
begin
  GST_OPENCV_VIDEO_FILTER_CAST := PGstOpencvVideoFilter(obj);
end;

{$ENDIF read_implementation}
