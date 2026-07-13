unit gstpipeline;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstbin, gstclock;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
type
  PGstPipelineFlags = ^TGstPipelineFlags;
  TGstPipelineFlags = longint;
const
  GST_PIPELINE_FLAG_FIXED_CLOCK = GST_BIN_FLAG_LAST shl 0;
  GST_PIPELINE_FLAG_LAST = GST_BIN_FLAG_LAST shl 4;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstPipelinePrivate = type Pointer;

  PGstPipeline = ^TGstPipeline;
  TGstPipeline = record
    bin: TGstBin;
    fixed_clock: PGstClock;
    stream_time: TGstClockTime;
    delay: TGstClockTime;
    priv: PGstPipelinePrivate;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  PGstPipelineClass = ^TGstPipelineClass;
  TGstPipelineClass = record
    parent_class: TGstBinClass;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_pipeline_get_type: TGType; cdecl; external libgstreamer;
function gst_pipeline_new(name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_pipeline_get_bus(pipeline: PGstPipeline): PGstBus; cdecl; external libgstreamer;
procedure gst_pipeline_use_clock(pipeline: PGstPipeline; clock: PGstClock); cdecl; external libgstreamer;
function gst_pipeline_set_clock(pipeline: PGstPipeline; clock: PGstClock): Tgboolean; cdecl; external libgstreamer;
function gst_pipeline_get_clock(pipeline: PGstPipeline): PGstClock; cdecl; external libgstreamer;
function gst_pipeline_get_pipeline_clock(pipeline: PGstPipeline): PGstClock; cdecl; external libgstreamer;
procedure gst_pipeline_auto_clock(pipeline: PGstPipeline); cdecl; external libgstreamer;
procedure gst_pipeline_set_delay(pipeline: PGstPipeline; delay: TGstClockTime); cdecl; external libgstreamer;
function gst_pipeline_get_delay(pipeline: PGstPipeline): TGstClockTime; cdecl; external libgstreamer;
procedure gst_pipeline_set_latency(pipeline: PGstPipeline; latency: TGstClockTime); cdecl; external libgstreamer;
function gst_pipeline_get_latency(pipeline: PGstPipeline): TGstClockTime; cdecl; external libgstreamer;
procedure gst_pipeline_set_auto_flush_bus(pipeline: PGstPipeline; auto_flush: Tgboolean); cdecl; external libgstreamer;
function gst_pipeline_get_auto_flush_bus(pipeline: PGstPipeline): Tgboolean; cdecl; external libgstreamer;
function gst_pipeline_is_live(pipeline: PGstPipeline): Tgboolean; cdecl; external libgstreamer;
function gst_pipeline_get_configured_latency(pipeline: PGstPipeline): TGstClockTime; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:17:19 ===

function GST_TYPE_PIPELINE: TGType;
function GST_PIPELINE(obj: Pointer): PGstPipeline;
function GST_PIPELINE_CLASS(klass: Pointer): PGstPipelineClass;
function GST_IS_PIPELINE(obj: Pointer): Tgboolean;
function GST_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
function GST_PIPELINE_GET_CLASS(obj: Pointer): PGstPipelineClass;
function GST_PIPELINE_CAST(obj: Pointer): PGstPipeline;
{$ENDIF read_function}

implementation

function GST_TYPE_PIPELINE: TGType;
begin
  GST_TYPE_PIPELINE := gst_pipeline_get_type;
end;

function GST_PIPELINE(obj: Pointer): PGstPipeline;
begin
  Result := PGstPipeline(g_type_check_instance_cast(obj, GST_TYPE_PIPELINE));
end;

function GST_PIPELINE_CLASS(klass: Pointer): PGstPipelineClass;
begin
  Result := PGstPipelineClass(g_type_check_class_cast(klass, GST_TYPE_PIPELINE));
end;

function GST_IS_PIPELINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_PIPELINE);
end;

function GST_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_PIPELINE);
end;

function GST_PIPELINE_GET_CLASS(obj: Pointer): PGstPipelineClass;
begin
  Result := PGstPipelineClass(PGTypeInstance(obj)^.g_class);
end;

function GST_PIPELINE_CAST(obj: Pointer): PGstPipeline;
begin
  GST_PIPELINE_CAST := PGstPipeline(obj);
end;

end.
