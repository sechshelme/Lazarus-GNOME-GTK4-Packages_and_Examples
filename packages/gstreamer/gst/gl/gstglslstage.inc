/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 09-10-2024   19:05                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

type
  TGstGLSLStagePrivate = record
  end;
  PGstGLSLStagePrivate = ^TGstGLSLStagePrivate;

  TGstGLSLStage = record
    parent: TGstObject;
    context: PGstGLContext;
    priv: PGstGLSLStagePrivate;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLSLStage = ^TGstGLSLStage;

  TGstGLSLStageClass = record
    parent: TGstObjectClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLSLStageClass = ^TGstGLSLStageClass;

function gst_glsl_stage_get_type: TGType; cdecl; external libgstgl;
function gst_glsl_stage_new(context: PGstGLContext; _type: Tguint): PGstGLSLStage; cdecl; external libgstgl;
function gst_glsl_stage_new_with_string(context: PGstGLContext; _type: Tguint; version: TGstGLSLVersion; profile: TGstGLSLProfile; str: Pgchar): PGstGLSLStage; cdecl; external libgstgl;
function gst_glsl_stage_new_with_strings(context: PGstGLContext; _type: Tguint; version: TGstGLSLVersion; profile: TGstGLSLProfile; n_strings: Tgint;
  str: PPgchar): PGstGLSLStage; cdecl; external libgstgl;
function gst_glsl_stage_new_default_fragment(context: PGstGLContext): PGstGLSLStage; cdecl; external libgstgl;
function gst_glsl_stage_new_default_vertex(context: PGstGLContext): PGstGLSLStage; cdecl; external libgstgl;
function gst_glsl_stage_get_handle(stage: PGstGLSLStage): Tguint; cdecl; external libgstgl;
function gst_glsl_stage_get_profile(stage: PGstGLSLStage): TGstGLSLProfile; cdecl; external libgstgl;
function gst_glsl_stage_get_version(stage: PGstGLSLStage): TGstGLSLVersion; cdecl; external libgstgl;
function gst_glsl_stage_get_shader_type(stage: PGstGLSLStage): Tguint; cdecl; external libgstgl;
function gst_glsl_stage_set_strings(stage: PGstGLSLStage; version: TGstGLSLVersion; profile: TGstGLSLProfile; n_strings: Tgint; str: PPgchar): Tgboolean; cdecl; external libgstgl;
function gst_glsl_stage_compile(stage: PGstGLSLStage; error: PPGError): Tgboolean; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 12:35:26 ===

function GST_TYPE_GLSL_STAGE: TGType;
function GST_GLSL_STAGE(obj: Pointer): PGstGLSLStage;
function GST_GLSL_STAGE_CLASS(klass: Pointer): PGstGLSLStageClass;
function GST_IS_GLSL_STAGE(obj: Pointer): Tgboolean;
function GST_IS_GLSL_STAGE_CLASS(klass: Pointer): Tgboolean;
function GST_GLSL_STAGE_GET_CLASS(obj: Pointer): PGstGLSLStageClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GLSL_STAGE: TGType;
begin
  GST_TYPE_GLSL_STAGE := gst_glsl_stage_get_type;
end;

function GST_GLSL_STAGE(obj: Pointer): PGstGLSLStage;
begin
  Result := PGstGLSLStage(g_type_check_instance_cast(obj, GST_TYPE_GLSL_STAGE));
end;

function GST_GLSL_STAGE_CLASS(klass: Pointer): PGstGLSLStageClass;
begin
  Result := PGstGLSLStageClass(g_type_check_class_cast(klass, GST_TYPE_GLSL_STAGE));
end;

function GST_IS_GLSL_STAGE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GLSL_STAGE);
end;

function GST_IS_GLSL_STAGE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GLSL_STAGE);
end;

function GST_GLSL_STAGE_GET_CLASS(obj: Pointer): PGstGLSLStageClass;
begin
  Result := PGstGLSLStageClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
