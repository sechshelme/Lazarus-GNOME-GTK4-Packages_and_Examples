
{$IFDEF read_interface}

const
  GST_BUFFER_POOL_OPTION_GL_SYNC_META = 'GstBufferPoolOptionGLSyncMeta';

type
  PGstGLSyncMeta = ^TGstGLSyncMeta;
  TGstGLSyncMeta = record
    parent: TGstMeta;
    context: PGstGLContext;
    Data: Tgpointer;
    set_sync: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    set_sync_gl: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    wait: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    wait_gl: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    wait_cpu: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    wait_cpu_gl: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    copy: procedure(src: PGstGLSyncMeta; sbuffer: PGstBuffer; dest: PGstGLSyncMeta; dbuffer: PGstBuffer); cdecl;
    Free: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
    free_gl: procedure(sync: PGstGLSyncMeta; context: PGstGLContext); cdecl;
  end;

function gst_gl_sync_meta_api_get_type: TGType; cdecl; external libgstgl;
function gst_gl_sync_meta_get_info: PGstMetaInfo; cdecl; external libgstgl;
function gst_buffer_add_gl_sync_meta(context: PGstGLContext; buffer: PGstBuffer): PGstGLSyncMeta; cdecl; external libgstgl;
function gst_buffer_add_gl_sync_meta_full(context: PGstGLContext; buffer: PGstBuffer; Data: Tgpointer): PGstGLSyncMeta; cdecl; external libgstgl;
procedure gst_gl_sync_meta_set_sync_point(sync_meta: PGstGLSyncMeta; context: PGstGLContext); cdecl; external libgstgl;
procedure gst_gl_sync_meta_wait(sync_meta: PGstGLSyncMeta; context: PGstGLContext); cdecl; external libgstgl;
procedure gst_gl_sync_meta_wait_cpu(sync_meta: PGstGLSyncMeta; context: PGstGLContext); cdecl; external libgstgl;

function GST_GL_SYNC_META_INFO: PGstMetaInfo;
function gst_buffer_get_gl_sync_meta(b: PGstBuffer): PGstGLSyncMeta;


// === Konventiert am: 9-10-24 14:58:55 ===

function GST_GL_SYNC_META_API_TYPE: TGType;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_GL_SYNC_META_API_TYPE: TGType;
begin
  GST_GL_SYNC_META_API_TYPE := gst_gl_sync_meta_api_get_type;
end;

function GST_GL_SYNC_META_INFO: PGstMetaInfo;
begin
  GST_GL_SYNC_META_INFO := gst_gl_sync_meta_get_info;
end;

function gst_buffer_get_gl_sync_meta(b: PGstBuffer): PGstGLSyncMeta;
begin
  gst_buffer_get_gl_sync_meta := PGstGLSyncMeta(gst_buffer_get_meta(b, GST_GL_SYNC_META_API_TYPE));
end;


{$ENDIF read_implementation}
