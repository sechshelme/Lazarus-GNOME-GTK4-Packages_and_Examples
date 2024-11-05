/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVideoFilter = record
    element: TGstBaseTransform;
    negotiated: Tgboolean;
    in_info: TGstVideoInfo;
    out_info: TGstVideoInfo;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoFilter = ^TGstVideoFilter;

  TGstVideoFilterClass = record
    parent_class: TGstBaseTransformClass;
    set_info: function(filter: PGstVideoFilter; incaps: PGstCaps; in_info: PGstVideoInfo; outcaps: PGstCaps; out_info: PGstVideoInfo): Tgboolean; cdecl;
    transform_frame: function(filter: PGstVideoFilter; inframe: PGstVideoFrame; outframe: PGstVideoFrame): TGstFlowReturn; cdecl;
    transform_frame_ip: function(trans: PGstVideoFilter; frame: PGstVideoFrame): TGstFlowReturn; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoFilterClass = ^TGstVideoFilterClass;


function gst_video_filter_get_type: TGType; cdecl; external libgstvideo;

function GST_VIDEO_FILTER_CAST(obj: Pointer): PGstVideoFilter;

// === Konventiert am: 1-10-24 15:03:40 ===

function GST_TYPE_VIDEO_FILTER: TGType;
function GST_VIDEO_FILTER(obj: Pointer): PGstVideoFilter;
function GST_VIDEO_FILTER_CLASS(klass: Pointer): PGstVideoFilterClass;
function GST_IS_VIDEO_FILTER(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstVideoFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_FILTER: TGType;
begin
  GST_TYPE_VIDEO_FILTER := gst_video_filter_get_type;
end;

function GST_VIDEO_FILTER(obj: Pointer): PGstVideoFilter;
begin
  Result := PGstVideoFilter(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_FILTER));
end;

function GST_VIDEO_FILTER_CLASS(klass: Pointer): PGstVideoFilterClass;
begin
  Result := PGstVideoFilterClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_FILTER));
end;

function GST_IS_VIDEO_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_FILTER);
end;

function GST_IS_VIDEO_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_FILTER);
end;

function GST_VIDEO_FILTER_GET_CLASS(obj: Pointer): PGstVideoFilterClass;
begin
  Result := PGstVideoFilterClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VIDEO_FILTER_CAST(obj: Pointer): PGstVideoFilter;
begin
  GST_VIDEO_FILTER_CAST := PGstVideoFilter(obj);
end;


{$ENDIF read_implementation}
