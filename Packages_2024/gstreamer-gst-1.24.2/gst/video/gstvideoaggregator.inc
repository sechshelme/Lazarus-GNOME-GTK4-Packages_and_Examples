
{$IFDEF read_interface}

type
  PGstVideoAggregator = ^TGstVideoAggregator;

  TGstVideoAggregatorPadPrivate = record
  end;
  PGstVideoAggregatorPadPrivate = ^TGstVideoAggregatorPadPrivate;

  TGstVideoAggregatorPad = record
    parent: TGstAggregatorPad;
    info: TGstVideoInfo;
    priv: PGstVideoAggregatorPadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoAggregatorPad = ^TGstVideoAggregatorPad;

  TGstVideoAggregatorPadClass = record
    parent_class: TGstAggregatorPadClass;
    update_conversion_info: procedure(pad: PGstVideoAggregatorPad); cdecl;
    prepare_frame: function(pad: PGstVideoAggregatorPad; videoaggregator: PGstVideoAggregator; buffer: PGstBuffer; prepared_frame: PGstVideoFrame): Tgboolean; cdecl;
    clean_frame: procedure(pad: PGstVideoAggregatorPad; videoaggregator: PGstVideoAggregator; prepared_frame: PGstVideoFrame); cdecl;
    prepare_frame_start: procedure(pad: PGstVideoAggregatorPad; videoaggregator: PGstVideoAggregator; buffer: PGstBuffer; prepared_frame: PGstVideoFrame); cdecl;
    prepare_frame_finish: procedure(pad: PGstVideoAggregatorPad; videoaggregator: PGstVideoAggregator; prepared_frame: PGstVideoFrame); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE - 2) - 1] of Tgpointer;
  end;
  PGstVideoAggregatorPadClass = ^TGstVideoAggregatorPadClass;

  TGstVideoAggregatorConvertPadPrivate = record
  end;
  PGstVideoAggregatorConvertPadPrivate = ^TGstVideoAggregatorConvertPadPrivate;

  TGstVideoAggregatorConvertPad = record
    parent: TGstVideoAggregatorPad;
    priv: PGstVideoAggregatorConvertPadPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoAggregatorConvertPad = ^TGstVideoAggregatorConvertPad;

  PGstVideoAggregatorConvertPadClass = ^TGstVideoAggregatorConvertPadClass;

  TGstVideoAggregatorConvertPadClass = record
    parent_class: TGstVideoAggregatorPadClass;
    create_conversion_info: procedure(pad: PGstVideoAggregatorConvertPad; agg: PGstVideoAggregator; conversion_info: PGstVideoInfo); cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstVideoAggregatorParallelConvertPadClass = record
    parent_class: TGstVideoAggregatorConvertPadClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoAggregatorParallelConvertPadClass = ^TGstVideoAggregatorParallelConvertPadClass;

  TGstVideoAggregatorPrivate = record
  end;
  PGstVideoAggregatorPrivate = ^TGstVideoAggregatorPrivate;

  TGstVideoAggregator = record
    aggregator: TGstAggregator;
    info: TGstVideoInfo;
    priv: PGstVideoAggregatorPrivate;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;

  TGstVideoAggregatorClass = record
    parent_class: TGstAggregatorClass;
    update_caps: function(videoaggregator: PGstVideoAggregator; caps: PGstCaps): PGstCaps; cdecl;
    aggregate_frames: function(videoaggregator: PGstVideoAggregator; outbuffer: PGstBuffer): TGstFlowReturn; cdecl;
    create_output_buffer: function(videoaggregator: PGstVideoAggregator; outbuffer: PPGstBuffer): TGstFlowReturn; cdecl;
    find_best_format: procedure(vagg: PGstVideoAggregator; downstream_caps: PGstCaps; best_info: PGstVideoInfo; at_least_one_alpha: Pgboolean); cdecl;
    _gst_reserved: array[0..(GST_PADDING_LARGE) - 1] of Tgpointer;
  end;
  PGstVideoAggregatorClass = ^TGstVideoAggregatorClass;


type
  TGstVideoAggregatorParallelConvertPad = record
    parent_instance: TGstVideoAggregatorConvertPad
  end;
  PGstVideoAggregatorParallelConvertPad = ^TGstVideoAggregatorParallelConvertPad;

function gst_video_aggregator_parallel_convert_pad_get_type: TGType; cdecl; external libgstvideo;

function gst_video_aggregator_pad_get_type: TGType; cdecl; external libgstvideo;
function gst_video_aggregator_pad_has_current_buffer(pad: PGstVideoAggregatorPad): Tgboolean; cdecl; external libgstvideo;
function gst_video_aggregator_pad_get_current_buffer(pad: PGstVideoAggregatorPad): PGstBuffer; cdecl; external libgstvideo;
function gst_video_aggregator_pad_get_prepared_frame(pad: PGstVideoAggregatorPad): PGstVideoFrame; cdecl; external libgstvideo;
procedure gst_video_aggregator_pad_set_needs_alpha(pad: PGstVideoAggregatorPad; needs_alpha: Tgboolean); cdecl; external libgstvideo;

function gst_video_aggregator_convert_pad_get_type: TGType; cdecl; external libgstvideo;
procedure gst_video_aggregator_convert_pad_update_conversion_info(pad: PGstVideoAggregatorConvertPad); cdecl; external libgstvideo;

function gst_video_aggregator_get_type: TGType; cdecl; external libgstvideo;
function gst_video_aggregator_get_execution_task_pool(vagg: PGstVideoAggregator): PGstTaskPool; cdecl; external libgstvideo;

function GST_VIDEO_AGGREGATOR_PAD_CAST(obj: Pointer): PGstVideoAggregatorPad;
function GST_VIDEO_AGGREGATOR_CAST(obj: Pointer): PGstVideoAggregator;

// === Konventiert am: 29-9-24 19:26:03 ===

function GST_TYPE_VIDEO_AGGREGATOR_PAD: TGType;
function GST_VIDEO_AGGREGATOR_PAD(obj: Pointer): PGstVideoAggregatorPad;
function GST_VIDEO_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstVideoAggregatorPadClass;
function GST_IS_VIDEO_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorPadClass;

function GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD: TGType;
function GST_VIDEO_AGGREGATOR_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorConvertPad;
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorConvertPadClass;
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorConvertPadClass;

function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD: TGType;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorParallelConvertPad;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorConvertPadClass;
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorConvertPadClass;

function GST_TYPE_VIDEO_AGGREGATOR: TGType;
function GST_VIDEO_AGGREGATOR(obj: Pointer): PGstVideoAggregator;
function GST_VIDEO_AGGREGATOR_CLASS(klass: Pointer): PGstVideoAggregatorClass;
function GST_IS_VIDEO_AGGREGATOR(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_AGGREGATOR_GET_CLASS(obj: Pointer): PGstVideoAggregatorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}


function GST_TYPE_VIDEO_AGGREGATOR_PAD: TGType;
begin
  GST_TYPE_VIDEO_AGGREGATOR_PAD := gst_video_aggregator_pad_get_type;
end;

function GST_VIDEO_AGGREGATOR_PAD(obj: Pointer): PGstVideoAggregatorPad;
begin
  Result := PGstVideoAggregatorPad(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_AGGREGATOR_PAD));
end;

function GST_VIDEO_AGGREGATOR_PAD_CLASS(klass: Pointer): PGstVideoAggregatorPadClass;
begin
  Result := PGstVideoAggregatorPadClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_AGGREGATOR_PAD));
end;

function GST_IS_VIDEO_AGGREGATOR_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_AGGREGATOR_PAD);
end;

function GST_IS_VIDEO_AGGREGATOR_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_AGGREGATOR_PAD);
end;

function GST_VIDEO_AGGREGATOR_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorPadClass;
begin
  Result := PGstVideoAggregatorPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD: TGType;
begin
  GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD := gst_video_aggregator_convert_pad_get_type;
end;

function GST_VIDEO_AGGREGATOR_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorConvertPad;
begin
  Result := PGstVideoAggregatorConvertPad(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD));
end;

function GST_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorConvertPadClass;
begin
  Result := PGstVideoAggregatorConvertPadClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD));
end;

function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD);
end;

function GST_IS_VIDEO_AGGREGATOR_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_AGGREGATOR_CONVERT_PAD);
end;

function GST_VIDEO_AGGREGATOR_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorConvertPadClass;
begin
  Result := PGstVideoAggregatorConvertPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD: TGType;
begin
  GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD := gst_video_aggregator_parallel_convert_pad_get_type;
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): PGstVideoAggregatorParallelConvertPad;
begin
  Result := PGstVideoAggregatorParallelConvertPad(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD));
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): PGstVideoAggregatorConvertPadClass;
begin
  Result := PGstVideoAggregatorConvertPadClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD));
end;

function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

function GST_IS_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD);
end;

function GST_VIDEO_AGGREGATOR_PARALLEL_CONVERT_PAD_GET_CLASS(obj: Pointer): PGstVideoAggregatorConvertPadClass;
begin
  Result := PGstVideoAggregatorConvertPadClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_TYPE_VIDEO_AGGREGATOR: TGType;
begin
  GST_TYPE_VIDEO_AGGREGATOR := gst_video_aggregator_get_type;
end;

function GST_VIDEO_AGGREGATOR(obj: Pointer): PGstVideoAggregator;
begin
  Result := PGstVideoAggregator(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_AGGREGATOR));
end;

function GST_VIDEO_AGGREGATOR_CLASS(klass: Pointer): PGstVideoAggregatorClass;
begin
  Result := PGstVideoAggregatorClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_AGGREGATOR));
end;

function GST_IS_VIDEO_AGGREGATOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_AGGREGATOR);
end;

function GST_IS_VIDEO_AGGREGATOR_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_AGGREGATOR);
end;

function GST_VIDEO_AGGREGATOR_GET_CLASS(obj: Pointer): PGstVideoAggregatorClass;
begin
  Result := PGstVideoAggregatorClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_VIDEO_AGGREGATOR_PAD_CAST(obj: Pointer): PGstVideoAggregatorPad;
begin
  GST_VIDEO_AGGREGATOR_PAD_CAST := PGstVideoAggregatorPad(obj);
end;

function GST_VIDEO_AGGREGATOR_CAST(obj: Pointer): PGstVideoAggregator;
begin
  GST_VIDEO_AGGREGATOR_CAST := PGstVideoAggregator(obj);
end;



{$ENDIF read_implementation}
