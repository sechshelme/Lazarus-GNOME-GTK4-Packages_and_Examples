

  {$IFDEF read_struct}
type
  PGstVideoSinkPrivate = type Pointer;

  PGstVideoSink = ^TGstVideoSink;
  TGstVideoSink = record
    element: TGstBaseSink;
    width: Tgint;
    height: Tgint;
    priv: PGstVideoSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstVideoSinkClass = ^TGstVideoSinkClass;
  TGstVideoSinkClass = record
    parent_class: TGstBaseSinkClass;
    show_frame: function(video_sink: PGstVideoSink; buf: PGstBuffer): TGstFlowReturn; cdecl;
    set_info: function(video_sink: PGstVideoSink; caps: PGstCaps; info: PGstVideoInfo): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_video_sink_get_type: TGType; cdecl; external libgstvideo;
procedure gst_video_sink_center_rect(src: TGstVideoRectangle; dst: TGstVideoRectangle; result: PGstVideoRectangle; scaling: Tgboolean); cdecl; external libgstvideo; deprecated;
procedure gst_video_center_rect(src: PGstVideoRectangle; dst: PGstVideoRectangle; result: PGstVideoRectangle; scaling: Tgboolean); cdecl; external libgstvideo;

// === Konventiert am: 15-7-26 13:30:38 ===

function GST_VIDEO_SINK_CAST(obj: Pointer): PGstVideoSink;
function GST_VIDEO_SINK_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_SINK_WIDTH(obj: Pointer): Tgint;
function GST_VIDEO_SINK_HEIGHT(obj: Pointer): Tgint;

function GST_TYPE_VIDEO_SINK: TGType;
function GST_VIDEO_SINK(obj: Pointer): PGstVideoSink;
function GST_VIDEO_SINK_CLASS(klass: Pointer): PGstVideoSinkClass;
function GST_IS_VIDEO_SINK(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_SINK_GET_CLASS(klass: Pointer): PGstVideoSinkClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_VIDEO_SINK: TGType;
begin
  GST_TYPE_VIDEO_SINK := gst_video_sink_get_type;
end;

function GST_VIDEO_SINK(obj: Pointer): PGstVideoSink;
begin
  Result := PGstVideoSink(g_type_check_instance_cast(obj, GST_TYPE_VIDEO_SINK));
end;

function GST_VIDEO_SINK_CLASS(klass: Pointer): PGstVideoSinkClass;
begin
  Result := PGstVideoSinkClass(g_type_check_class_cast(klass, GST_TYPE_VIDEO_SINK));
end;

function GST_IS_VIDEO_SINK(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_VIDEO_SINK);
end;

function GST_IS_VIDEO_SINK_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_VIDEO_SINK);
end;

function GST_VIDEO_SINK_GET_CLASS(klass: Pointer): PGstVideoSinkClass;
begin
  Result := PGstVideoSinkClass(PGTypeInstance(klass)^.g_class);
end;


function GST_VIDEO_SINK_CAST(obj: Pointer): PGstVideoSink;
begin
  GST_VIDEO_SINK_CAST := PGstVideoSink(obj);
end;

function GST_VIDEO_SINK_PAD(obj: Pointer): PGstPad;
begin
  GST_VIDEO_SINK_PAD := GST_BASE_SINK_PAD(obj);
end;

function GST_VIDEO_SINK_WIDTH(obj: Pointer): Tgint;
begin
  GST_VIDEO_SINK_WIDTH := (GST_VIDEO_SINK_CAST(obj))^.Width;
end;

function GST_VIDEO_SINK_HEIGHT(obj: Pointer): Tgint;
begin
  GST_VIDEO_SINK_HEIGHT := (GST_VIDEO_SINK_CAST(obj))^.Height;
end;

{$ENDIF read_implementation}
