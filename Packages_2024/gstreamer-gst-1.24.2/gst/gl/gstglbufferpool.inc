
{$IFDEF read_interface}


function gst_gl_buffer_pool_get_type: TGType; cdecl; external libgstgl;

type
  TGstGLBufferPoolPrivate = record
  end;
  PGstGLBufferPoolPrivate = ^TGstGLBufferPoolPrivate;

  TGstGLBufferPool = record
    bufferpool: TGstBufferPool;
    context: PGstGLContext;
    priv: PGstGLBufferPoolPrivate;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBufferPool = ^TGstGLBufferPool;

  TGstGLBufferPoolClass = record
    parent_class: TGstBufferPoolClass;
    _padding: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstGLBufferPoolClass = ^TGstGLBufferPoolClass;


function gst_gl_buffer_pool_new(context: PGstGLContext): PGstBufferPool; cdecl; external libgstgl;
function gst_gl_buffer_pool_get_gl_allocation_params(pool: PGstGLBufferPool): PGstGLAllocationParams; cdecl; external libgstgl;
function gst_buffer_pool_config_get_gl_allocation_params(config: PGstStructure): PGstGLAllocationParams; cdecl; external libgstgl;
procedure gst_buffer_pool_config_set_gl_allocation_params(config: PGstStructure; params: PGstGLAllocationParams); cdecl; external libgstgl;
function gst_buffer_pool_config_get_gl_min_free_queue_size(config: PGstStructure): Tguint; cdecl; external libgstgl;
procedure gst_buffer_pool_config_set_gl_min_free_queue_size(config: PGstStructure; queue_size: Tguint); cdecl; external libgstgl;

function GST_GL_BUFFER_POOL_CAST(obj: Pointer): PGstGLBufferPool;

// === Konventiert am: 9-10-24 12:14:42 ===

function GST_TYPE_GL_BUFFER_POOL: TGType;
function GST_GL_BUFFER_POOL(obj: Pointer): PGstGLBufferPool;
function GST_IS_GL_BUFFER_POOL(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_GL_BUFFER_POOL: TGType;
begin
  GST_TYPE_GL_BUFFER_POOL := gst_gl_buffer_pool_get_type;
end;

function GST_GL_BUFFER_POOL(obj: Pointer): PGstGLBufferPool;
begin
  Result := PGstGLBufferPool(g_type_check_instance_cast(obj, GST_TYPE_GL_BUFFER_POOL));
end;

function GST_IS_GL_BUFFER_POOL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_GL_BUFFER_POOL);
end;

// ====

function GST_GL_BUFFER_POOL_CAST(obj: Pointer): PGstGLBufferPool;
begin
  GST_GL_BUFFER_POOL_CAST := PGstGLBufferPool(obj);
end;


{$ENDIF read_implementation}
