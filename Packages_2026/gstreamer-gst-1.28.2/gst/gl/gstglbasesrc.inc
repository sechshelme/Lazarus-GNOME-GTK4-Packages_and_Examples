

  {$IFDEF read_struct}
type
  PGstGLBaseSrcPrivate = type Pointer;

  PGstGLBaseSrc = ^TGstGLBaseSrc;
  TGstGLBaseSrc = record
    parent: TGstPushSrc;
    display: PGstGLDisplay;
    context: PGstGLContext;
    out_info: TGstVideoInfo;
    out_caps: PGstCaps;
    running_time: TGstClockTime;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
    priv: PGstGLBaseSrcPrivate;
  end;

  PGstGLBaseSrcClass = ^TGstGLBaseSrcClass;
  TGstGLBaseSrcClass = record
    parent_class: TGstPushSrcClass;
    supported_gl_api: TGstGLAPI;
    gl_start: function(src: PGstGLBaseSrc): Tgboolean; cdecl;
    gl_stop: procedure(src: PGstGLBaseSrc); cdecl;
    fill_gl_memory: function(src: PGstGLBaseSrc; mem: PGstGLMemory): Tgboolean; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_gl_base_src_get_type: TGType; cdecl; external libgstgl;
function gst_gl_base_src_get_gl_context(base_src: PGstGLBaseSrc): PGstGLContext; cdecl; external libgstgl;

// === Konventiert am: 14-7-26 12:54:57 ===

function GST_TYPE_GL_BASE_SRC: TGType;
function GST_GL_BASE_SRC(obj: Pointer): PGstGLBaseSrc;
function GST_GL_BASE_SRC_CLASS(klass: Pointer): PGstGLBaseSrcClass;
function GST_IS_GL_BASE_SRC(obj: Pointer): Tgboolean;
function GST_IS_GL_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BASE_SRC_GET_CLASS(obj: Pointer): PGstGLBaseSrcClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function GST_TYPE_GL_BASE_SRC: TGType;
begin
  GST_TYPE_GL_BASE_SRC := gst_gl_base_src_get_type;
end;

function GST_GL_BASE_SRC(obj: Pointer): PGstGLBaseSrc;
begin
  Result := PGstGLBaseSrc(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_SRC));
end;

function GST_GL_BASE_SRC_CLASS(klass: Pointer): PGstGLBaseSrcClass;
begin
  Result := PGstGLBaseSrcClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_SRC));
end;

function GST_IS_GL_BASE_SRC(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BASE_SRC);
end;

function GST_IS_GL_BASE_SRC_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_BASE_SRC);
end;

function GST_GL_BASE_SRC_GET_CLASS(obj: Pointer): PGstGLBaseSrcClass;
begin
  Result := PGstGLBaseSrcClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
