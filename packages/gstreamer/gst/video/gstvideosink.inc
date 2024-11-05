/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 01-10-2024   15:41                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstVideoRectangle = record
    x: Tgint;
    y: Tgint;
    w: Tgint;
    h: Tgint;
  end;
  PGstVideoRectangle = ^TGstVideoRectangle;

  TGstVideoSinkPrivate = record
  end;
  PGstVideoSinkPrivate = ^TGstVideoSinkPrivate;

  TGstVideoSink = record
    element: TGstBaseSink;
    Width: Tgint;
    Height: Tgint;
    priv: PGstVideoSinkPrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstVideoSink = ^TGstVideoSink;

  TGstVideoSinkClass = record
    parent_class: TGstBaseSinkClass;
    show_frame: function(video_sink: PGstVideoSink; buf: PGstBuffer): TGstFlowReturn; cdecl;
    set_info: function(video_sink: PGstVideoSink; caps: PGstCaps; info: PGstVideoInfo): Tgboolean; cdecl;
    _gst_reserved: array[0..(GST_PADDING - 1) - 1] of Tgpointer;
  end;
  PGstVideoSinkClass = ^TGstVideoSinkClass;


function gst_video_sink_get_type: TGType; cdecl; external libgstvideo;
procedure gst_video_sink_center_rect(src: TGstVideoRectangle; dst: TGstVideoRectangle; Result: PGstVideoRectangle; scaling: Tgboolean); cdecl; external libgstvideo;
procedure gst_video_center_rect(src: PGstVideoRectangle; dst: PGstVideoRectangle; Result: PGstVideoRectangle; scaling: Tgboolean); cdecl; external libgstvideo;

function GST_VIDEO_SINK_CAST(obj: Pointer): PGstVideoSink;
function GST_VIDEO_SINK_PAD(obj: Pointer): PGstPad;
function GST_VIDEO_SINK_WIDTH(obj: Pointer): Tgint;
function GST_VIDEO_SINK_HEIGHT(obj: Pointer): Tgint;

// === Konventiert am: 30-9-24 17:49:15 ===

function GST_TYPE_VIDEO_SINK: TGType;
function GST_VIDEO_SINK(obj: Pointer): PGstVideoSink;
function GST_VIDEO_SINK_CLASS(klass: Pointer): PGstVideoSinkClass;
function GST_IS_VIDEO_SINK(obj: Pointer): Tgboolean;
function GST_IS_VIDEO_SINK_CLASS(klass: Pointer): Tgboolean;
function GST_VIDEO_SINK_GET_CLASS(klass: Pointer): PGstVideoSinkClass;

{$ENDIF read_interface}


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

// ====

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
