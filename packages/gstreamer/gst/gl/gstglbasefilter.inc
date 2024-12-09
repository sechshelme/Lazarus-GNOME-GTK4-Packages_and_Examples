
{$IFDEF read_interface}

function gst_gl_base_filter_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLBaseFilterPrivate = record
  end;
  PGstGLBaseFilterPrivate = ^TGstGLBaseFilterPrivate;

  TGstGLBaseFilter = record
    parent: TGstBaseTransform;
    display: PGstGLDisplay;
    context: PGstGLContext;
    in_caps: PGstCaps;
    out_caps: PGstCaps;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
    priv: PGstGLBaseFilterPrivate;
  end;
  PGstGLBaseFilter = ^TGstGLBaseFilter;

  TGstGLBaseFilterClass = record
    parent_class: TGstBaseTransformClass;
    supported_gl_api: TGstGLAPI;
    gl_start: function(filter: PGstGLBaseFilter): Tgboolean; cdecl;
    gl_stop: procedure(filter: PGstGLBaseFilter); cdecl;
    gl_set_caps: function(filter: PGstGLBaseFilter; incaps: PGstCaps; outcaps: PGstCaps): Tgboolean; cdecl;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBaseFilterClass = ^TGstGLBaseFilterClass;


function gst_gl_base_filter_find_gl_context(filter: PGstGLBaseFilter): Tgboolean; cdecl; external libgstgl;
function gst_gl_base_filter_get_gl_context(filter: PGstGLBaseFilter): PGstGLContext; cdecl; external libgstgl;

// === Konventiert am: 9-10-24 09:12:56 ===

function GST_TYPE_GL_BASE_FILTER: TGType;
function GST_GL_BASE_FILTER(obj: Pointer): PGstGLBaseFilter;
function GST_GL_BASE_FILTER_CLASS(klass: Pointer): PGstGLBaseFilterClass;
function GST_IS_GL_BASE_FILTER(obj: Pointer): Tgboolean;
function GST_IS_GL_BASE_FILTER_CLASS(klass: Pointer): Tgboolean;
function GST_GL_BASE_FILTER_GET_CLASS(obj: Pointer): PGstGLBaseFilterClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_BASE_FILTER: TGType;
begin
  GST_TYPE_GL_BASE_FILTER := gst_gl_base_filter_get_type;
end;

function GST_GL_BASE_FILTER(obj: Pointer): PGstGLBaseFilter;
begin
  Result := PGstGLBaseFilter(g_type_check_instance_cast(obj, GST_TYPE_GL_BASE_FILTER));
end;

function GST_GL_BASE_FILTER_CLASS(klass: Pointer): PGstGLBaseFilterClass;
begin
  Result := PGstGLBaseFilterClass(g_type_check_class_cast(klass, GST_TYPE_GL_BASE_FILTER));
end;

function GST_IS_GL_BASE_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BASE_FILTER);
end;

function GST_IS_GL_BASE_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_GL_BASE_FILTER);
end;

function GST_GL_BASE_FILTER_GET_CLASS(obj: Pointer): PGstGLBaseFilterClass;
begin
  Result := PGstGLBaseFilterClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
