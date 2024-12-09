
{$IFDEF read_interface}

type
  Tcv_Mat=Pointer; // ??????

  PGstOpencvVideoFilter = ^TGstOpencvVideoFilter;
  TGstOpencvVideoFilterTransformIPFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:Tcv_Mat):TGstFlowReturn;cdecl;
  TGstOpencvVideoFilterTransformFunc = function (transform:PGstOpencvVideoFilter; buffer:PGstBuffer; img:Tcv_Mat; outbuf:PGstBuffer; outimg:Tcv_Mat):TGstFlowReturn;cdecl;

  TGstOpencvVideoFilterSetCaps = function (transform:PGstOpencvVideoFilter; in_width:Tgint; in_height:Tgint; in_cv_type:longint; out_width:Tgint; 
               out_height:Tgint; out_cv_type:longint):Tgboolean;cdecl;
  TGstOpencvVideoFilter = record
      trans : TGstVideoFilter;
      in_place : Tgboolean;
      cvImage : Tcv_Mat;
      out_cvImage : Tcv_Mat;
    end;

  PGstOpencvVideoFilterClass = ^TGstOpencvVideoFilterClass;
  TGstOpencvVideoFilterClass = record
      parent_class : TGstVideoFilterClass;
      cv_trans_func : TGstOpencvVideoFilterTransformFunc;
      cv_trans_ip_func : TGstOpencvVideoFilterTransformIPFunc;
      cv_set_caps : TGstOpencvVideoFilterSetCaps;
    end;


function gst_opencv_video_filter_get_type:TGType;cdecl;external libgstopencv;
procedure gst_opencv_video_filter_set_in_place(transform:PGstOpencvVideoFilter; ip:Tgboolean);cdecl;external libgstopencv;

function GST_OPENCV_VIDEO_FILTER_CAST(obj : Pointer) : PGstOpencvVideoFilter;

// === Konventiert am: 13-10-24 13:17:38 ===

function GST_TYPE_OPENCV_VIDEO_FILTER : TGType;
function GST_OPENCV_VIDEO_FILTER(obj : Pointer) : PGstOpencvVideoFilter;
function GST_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : PGstOpencvVideoFilterClass;
function GST_IS_OPENCV_VIDEO_FILTER(obj : Pointer) : Tgboolean;
function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : Pointer) : PGstOpencvVideoFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_OPENCV_VIDEO_FILTER : TGType;
  begin
    GST_TYPE_OPENCV_VIDEO_FILTER:=gst_opencv_video_filter_get_type;
  end;

function GST_OPENCV_VIDEO_FILTER(obj : Pointer) : PGstOpencvVideoFilter;
begin
  Result := PGstOpencvVideoFilter(g_type_check_instance_cast(obj, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(g_type_check_class_cast(klass, GST_TYPE_OPENCV_VIDEO_FILTER));
end;

function GST_IS_OPENCV_VIDEO_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_IS_OPENCV_VIDEO_FILTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_OPENCV_VIDEO_FILTER);
end;

function GST_OPENCV_VIDEO_FILTER_GET_CLASS(obj : Pointer) : PGstOpencvVideoFilterClass;
begin
  Result := PGstOpencvVideoFilterClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_OPENCV_VIDEO_FILTER_CAST(obj: Pointer): PGstOpencvVideoFilter;
begin
  GST_OPENCV_VIDEO_FILTER_CAST:=PGstOpencvVideoFilter(obj);
end;


{$ENDIF read_implementation}
