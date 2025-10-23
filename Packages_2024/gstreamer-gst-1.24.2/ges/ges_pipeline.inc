{$IFDEF read_interface}

  {GES_DECLARE_TYPE (Pipeline, pipeline, PIPELINE); }
type
  TGESPipelinePrivate = record
  end;
  PGESPipelinePrivate = ^TGESPipelinePrivate;

  TGESPipeline = record
    parent: TGstPipeline;
    priv: PGESPipelinePrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESPipeline = ^TGESPipeline;

  TGESPipelineClass = record
    parent_class: TGstPipelineClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESPipelineClass = ^TGESPipelineClass;

function ges_pipeline_get_type: TGType; cdecl; external libges;
function ges_pipeline_new: PGESPipeline; cdecl; external libges;
function ges_pipeline_set_timeline(pipeline: PGESPipeline; timeline: PGESTimeline): Tgboolean; cdecl; external libges;
function ges_pipeline_set_render_settings(pipeline: PGESPipeline; output_uri: Pgchar; profile: PGstEncodingProfile): Tgboolean; cdecl; external libges;
function ges_pipeline_set_mode(pipeline: PGESPipeline; mode: TGESPipelineFlags): Tgboolean; cdecl; external libges;
function ges_pipeline_get_mode(pipeline: PGESPipeline): TGESPipelineFlags; cdecl; external libges;
function ges_pipeline_get_thumbnail(self: PGESPipeline; caps: PGstCaps): PGstSample; cdecl; external libges;
function ges_pipeline_get_thumbnail_rgb24(self: PGESPipeline; Width: Tgint; Height: Tgint): PGstSample; cdecl; external libges;
function ges_pipeline_save_thumbnail(self: PGESPipeline; Width: longint; Height: longint; format: Pgchar; location: Pgchar;
  error: PPGError): Tgboolean; cdecl; external libges;
function ges_pipeline_preview_get_video_sink(self: PGESPipeline): PGstElement; cdecl; external libges;
procedure ges_pipeline_preview_set_video_sink(self: PGESPipeline; sink: PGstElement); cdecl; external libges;
function ges_pipeline_preview_get_audio_sink(self: PGESPipeline): PGstElement; cdecl; external libges;
procedure ges_pipeline_preview_set_audio_sink(self: PGESPipeline; sink: PGstElement); cdecl; external libges;

// === Konventiert am: 13-12-24 16:54:59 ===

function GES_TYPE_PIPELINE: TGType;
function GES_PIPELINE(obj: Pointer): PGESPipeline;
function GES_IS_PIPELINE(obj: Pointer): Tgboolean;
function GES_PIPELINE_CLASS(klass: Pointer): PGESPipelineClass;
function GES_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
function GES_PIPELINE_GET_CLASS(obj: Pointer): PGESPipelineClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_PIPELINE: TGType;
begin
  Result := ges_pipeline_get_type;
end;

function GES_PIPELINE(obj: Pointer): PGESPipeline;
begin
  Result := PGESPipeline(g_type_check_instance_cast(obj, GES_TYPE_PIPELINE));
end;

function GES_IS_PIPELINE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_PIPELINE);
end;

function GES_PIPELINE_CLASS(klass: Pointer): PGESPipelineClass;
begin
  Result := PGESPipelineClass(g_type_check_class_cast(klass, GES_TYPE_PIPELINE));
end;

function GES_IS_PIPELINE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_PIPELINE);
end;

function GES_PIPELINE_GET_CLASS(obj: Pointer): PGESPipelineClass;
begin
  Result := PGESPipelineClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
